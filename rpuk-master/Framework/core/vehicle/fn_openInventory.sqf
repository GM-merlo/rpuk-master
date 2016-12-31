/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Edits: TinyBigJacko, Ciaran Langton
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Land_Sack_F" OR _vehicle isKindOf "Cargo_base_F" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

//NDJ Let's get some fucking range checking going on here, shall we? Too much cross-map sack-opening going on!

if( (player distance _vehicle > 3) && (_vehicle isKindOf "Land_Sack_F") ) exitWith {};

if( (player distance _vehicle > 8) && (_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F")) exitWith {};

//If a house and no containers, piss off!
if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];}; 


if(_vehicle isKindOf "House_F") then {
	titleText["Opening house storage...","PLAIN DOWN"];
} else {
	if(_vehicle isKindOf "Land_Sack_F") then {
		titleText["Opening Sack...","PLAIN DOWN"];
	} else {
		titleText["Opening vehicle trunk...","PLAIN DOWN"];
	};
};
sleep (random 1);

if(typeName (_vehicle getVariable["Trunk",-1]) == typeName -1) exitWith {}; //checking for SCALAR vs SCALAR (trunk should be ARRAY) NDJ 5/8/16
if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";};
disableSerialization;

if(_vehicle isKindOf "House_F") then { //HOUSE
	ctrlShow[3509,false]; //DON'T SHOW MENU YET!! more checks to come
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	if(_vehicle isKindOf "Land_Sack_F") then { //SACK
		ctrlShow[3509,false]; //DON'T SHOW MENU YET!! more checks to come
		ctrlSetText[3501,"Item Sack"];
		((findDisplay 3500) displayCtrl 3508) ctrlShow false;
	} else { //NOT HOUSE OR SACK, MUST BE CAR/VEHICLE
		ctrlShow[3509,true];
		if(serverTime - (_vehicle getVariable["lastSync",-99999]) < 900) then {ctrlEnable[3509,false];};

		ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
};

//If a house, compute the T-inventory space; if a car/vehicle, just return it.
if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};


if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",(call life_fnc_findTransactionMethod),false] spawn life_fnc_MP;
	};
	if(_this isKindOf "Land_Sack_F") then {
		if(count ((_this getVariable["Trunk",[[],0]]) select 0) < 1) then {deleteVehicle _this;}; //Cleanup sack after it is empty.
	};
};
