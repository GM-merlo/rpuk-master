/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_control = param [0,controlNull,[controlNull]];
_selection = param [1,0,[0]];

_spCfg = getArray(missionConfigFile >> "CfgSpawns" >> worldName >> str(playerSide));

if(count life_houses > 0) then {
	{
		_pos = call compile format["%1",_x select 0];
		_house = _pos call life_fnc_getBuilding;
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		_spCfg pushBack [_houseName,format["house_%1",_house getVariable "uid"],"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa","true"];
	} foreach life_houses;
};

private _id = _control lnbValue[_selection,0];
if (_id isEqualTo -1) exitWith 
{
	systemChat "Spawn point is currently locked."; 
	_control lbSetCurSel 0;
};

_sp = _spCfg select _id;

((findDisplay 38500) displayCtrl 38502) ctrlEnable false;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 0,localize "STR_Spawn_CSP"]];
