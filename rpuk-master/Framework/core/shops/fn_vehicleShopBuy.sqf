/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_buymode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
//_buymode = _this select 0; //Sure Tonic's got this wrong, so rewriting to use bis_fnc_param...
_buymode = [_this,0,false,[false]] call BIS_fnc_param;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];

(["Vehicles", _className] call life_fnc_itemUnlocked) params [
  ["_locked", false, [false]],
  ["_level", 0, [0]]
];

if (_locked) exitWith {hint format["You are not at the needed level to purchase this item yet! You need to be level %1", _level]};

if((life_veh_shop select 0) == "bus_garage" && uniform player != "U_C_Poloshirt_salmon") exitWith {hint "You need a bus driver's uniform first, you scruffy looking hobo!"};

_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;

if(!(_buymode)) then { //Rental?
	if(_className == "B_Quadbike_01_F" || {_className == "C_Quadbike_01_F"}) then {
		_basePrice = round(_basePrice * 0.25); //NDJ quadbike rental vehicle, quarter price!
	} else {
		_basePrice = round(_basePrice * 0.5); //NDJ rental vehicle, half price!
	};
};

_basePrice = ceil(_basePrice * call life_priceModifier); //donator goals met - do this AFTER the rental/buy cost is calculated

_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(RPUK_dosh < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - RPUK_dosh] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],55]) == 0) exitWith {_spawnPoint = _spawnPoints}; //UP to 55 to prevent kavala hosptial explosions *derp*
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
RPUK_dosh = RPUK_dosh - _basePrice;
playSound "buy";
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,11.2554]);
	_vehicle allowDamage false;
	waitUntil {(speed _vehicle) <= 0};
	_vehicle allowDamage true;
	_vehicle setDamage 0; //REPAIR IT
	_vehicle setFuel 1; //REFUEL IT
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle setVariable["side",playerSide,true];
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle setVariable["side",playerSide,true];
};

_vehicle spawn life_fnc_spawnIndicator;

//NDJ 30Apr14 give all vehicles 1 toolkit in a backpack automatically!
if(!(_className in ["B_UAV_01_F","B_UGV_01_rcws_F"])) then {
	_vehicle addItemCargoGlobal ["Toolkit",1]; //No backpacks anymore! Buy them, suckers!
};

//NDJ 04May14 - initialise UAVs with crew
if(_className in ["B_UAV_01_F","B_UGV_01_rcws_F"]) then {
	createVehicleCrew _vehicle;
	_vehicle setAutonomous false;
};

_vehicle call life_fnc_massFix;
[_vehicle] call life_fnc_ropeBlock;

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		_vehicle addItemCargoGlobal ["ToolKit",2]; //NDJ 30Apr14 give cop vehicles a couple more toolkits automatically!
		_vehicle addItemCargoGlobal ["FirstAidKit",2]; //NDJ 30Apr14 first aid kits!
	};

	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		[_vehicle,"med_ship",true] spawn life_fnc_vehicleAnimate;
		_vehicle addItemCargoGlobal ["FirstAidKit",2]; //NDJ 17Jul14 first aid kits for medic vehicles!
	};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle; //Add err to the chain.
if(_buymode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
} else {
	//Else handle the vehicle weight ourselves.
	_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;
	if(_weight >= 5) then { //Theres space, so add a default Fuel item.
		_vehicle setVariable["Trunk",[[["fuelF",1]],5],true];
	} else {
		_vehicle setVariable["Trunk",[[],0],true];
	};
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
