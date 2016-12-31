/*
	File: fn_CrushAction.sqf
	Author: Bryan "Tonic" Boardwine / TinyBigJacko 15May14 / Ciaran Langton 14/08/2014

	Description:
	Crushes the vehicle (destroys it forever)
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_crew"];
_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if(!alive cursorTarget) exitWith {hint "Sorry, you cannot crush a already destroyed car.";};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[0,format["%1 your %2 is being scrapped by the police.",(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["life_fnc_broadcast",-2];
	life_action_inUse = true;

	_upp = "Crushing Vehicle";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	_speedUp = ["profession_crushing"] call life_fnc_getProfessionlevel;
	_time = 0.09 - (_speedUp / 600);
	if(_time < 0.001) then {_time = 0.001;};

	for "_i" from 0 to 1 step 0 do
	{
		sleep _time;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];

	if(player distance _vehicle > 10) exitWith {hint "Crushing cancelled.\nYou moved too far away."; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};

	//NDJ 15May14 I see dead people? Remove them from the crew
	_crew = crew _vehicle;
	{
		if(!alive _x) then deleteVehicle _x;
	} forEach _crew;

	if(((count crew _vehicle) == 0) OR ((typeOf _vehicle) == "B_UAV_01_F")) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = call life_impound_car;};
			case (_vehicle isKindOf "Ship"): {_price = call life_impound_boat;};
			case (_vehicle isKindOf "Air"): {_price = call life_impound_air;};
		};

		life_crusher_inuse = true;
		[[_vehicle, player],"TON_fnc_vehicleCrushed",false,false] spawn life_fnc_MP; //Ciaran - Redirect to own function. 14/08/2014
		waitUntil {!life_crusher_inuse};
		[0,format["%1 has sent %2's %3 to the crusher!",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["life_fnc_broadcast",-2];
		RPUK_doshinbank = RPUK_doshinbank + _price;
		if (worldName == "Altis") then {["crushing",20] call life_fnc_addProfessionPoints;};
	}
		else
	{
		hint "Crushing cancelled.\nThere is a person in this vehicle.";
	};
};
life_action_inUse = false;
