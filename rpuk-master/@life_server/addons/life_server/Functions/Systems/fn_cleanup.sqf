/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Ciaran Langton

	Description:
	Server-side cleanup script on vehicles using Arma2Net DateTime function.
	Sort of a lame way but whatever.
*/
private["_deleted"];
_deleted = false;
while {true} do
{
	private["_veh","_units"];
	sleep (2 * 60);
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"] && !(_veh getVariable["scenery",false])) then
		{
			_deleted = false;
			_dbInfo = _veh getVariable["dbInfo",[]];
			_units = {(_x distance _veh < 500)} count playableUnits;
			_unitsLR = {(_x distance _veh < 1000)} count playableUnits;
			if(count crew _x == 0) then
			{
				switch (true) do
				{
					case (_units == 0 && damage _x > 0): {_deleted = true;};
					case (_units == 0 && _unitsLR == 0): {_deleted = true;};
				};
			};

			_inv = call compile str(_x getVariable["Trunk",[[],0]]);

			if(_deleted) then {
				deleteVehicle _x;
				waitUntil {isNull _veh};
				_deleted = false;
			};

			if(count _dbInfo > 0 && _deleted) then
			{
				_items = _inv select 0;
				_weight = 0;
				{
					if((_x select 0) in life_illegal_items_names) then {
						_items set[_forEachIndex,-1];
					} else {
						_itemWeight = ([(_x select 0)] call life_fnc_itemWeight) * (_x select 1);
						_weight = _weight + _itemWeight;
					};
				} forEach _items;
				_items = _items - [-1];

				_inv = [_items,_weight];
				_inv = [_inv] call DB_fnc_mresArray;

				_uid = _dbInfo select 0;
				_plate = _dbInfo select 1;

				[format["cleanupVehicle:%1:%2:%3",_inv,_uid,_plate],1] call DB_fnc_preparedCall;
			};
		};
	} foreach vehicles;

	sleep (2 * 60); //2 minute cool-down before next cycle.
	{
		if((typeOf _x) in ["Land_Money_F","Land_Sack_F"] && {(!(_x getVariable["scenery",false])) && (!(_x getVariable["bankItem",false]))}) then //Dont delete scenery or bankCash.
		{
			if(!(_x getVariable["trunk_in_use",false])) then { //Check if someone is using it. Do not delete when it is open. (Applies to Sack.)
				deleteVehicle _x;
			};
		};
	} foreach (allMissionObjects "Thing");

	sleep (2 * 60);
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");

	sleep (2 * 60);
	{
		deleteVehicle _x;
	} forEach (allMines);

	sleep (2 * 60);

	_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0
	{
		if((owner _x == _serverID) && isDedicated) then {deleteVehicle _x};
	} forEach (allDeadMen);

	//Moves the mainscope to random positions
	_mainscope = missionnamespace getvariable ["bis_functions_mainscope",objnull];
	_mainscope setPosATL [random 15000,random 1500,random 1500];
};
