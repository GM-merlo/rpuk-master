/*
	FIle: fn_initHouses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the houses from the DB onto the map.
*/
private["_queryResult","_query","_count"];
_count = ([format["houseCount:%1",worldName],2] call DB_fnc_preparedCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	_queryResult = [format["housingInit:%1:%2",worldName,_x],2,true] call DB_fnc_preparedCall; //what happens if query fails?
	if(count _queryResult == 0) exitWith {}; 

	{
		_pos = call compile format["%1",_x select 2];
		_house = _pos call life_fnc_getBuilding;
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["housestoragelocked",true,true]; //Lock up all the stuff.
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house animate[format["door_%1_rot",_i],0]; //ADDED NDJ 070816 to ensure doors are physically closed first!
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
	} foreach _queryResult;
};

[format["Loaded %1 houses from the DB.",_count],"SYSLOG"] call console;