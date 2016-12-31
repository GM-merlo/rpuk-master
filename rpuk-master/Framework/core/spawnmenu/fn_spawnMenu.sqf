/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if (life_is_arrested) exitWith 
{
	[] call life_fnc_respawned;
};

if (life_respawned) then 
{
	[] call life_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

if (!(createDialog "life_spawn_selection")) exitWith {[] spawn life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["KeyDown","_this call life_fnc_displayHandler"];

_spCfg = getArray(missionConfigFile >> "CfgSpawns" >> worldName >> str(playerSide));

if (count life_houses > 0) then 
{
	{
		_pos = call compile format["%1",_x select 0];
		_house = _pos call life_fnc_getBuilding;
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		_spCfg pushBack [_houseName,format["house_%1",_house getVariable "uid"],"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa","true"];
	} forEach life_houses;
};

_defaultSp = [];

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	if (call compile (_x select 3)) then 
	{
		(["Spawns", _x select 1] call life_fnc_itemUnlocked) params [
			["_locked", false, [false]],
			["_level", 0, [0]]
		];

    	private _val = [_forEachIndex, -1] select _locked;
    	private _text = [_x select 0, format["%1 [%2]",_x select 0,_level]] select _locked;

		if (!isNil {_x select 4}) then 
		{
			_sp = call compile (_x select 4);
			if (count _defaultSp < 1) then 
			{
				_defaultSp = _x; 
				_defaultSp set[1,_sp];
			};
			_ctrl lnbAddRow[_text,_sp,""];
			_ctrl lnbSetPicture[[(lnbSize _ctrl select 0) - 1,0],_x select 2];
			_ctrl lnbSetData[[(lnbSize _ctrl select 0) - 1,0],_sp];
			_ctrl lnbSetValue[[(lnbSize _ctrl select 0) - 1,0],_val];
			if (_val isEqualTo -1) then
			{
				_ctrl lnbSetColor [[(lnbSize _ctrl select 0) - 1,0],[0.22,0.22,0.22,1]];
			};
		} 
		else 
		{
			if (count _defaultSp < 1) then 
			{
				_defaultSp = _x;
			};
			_ctrl lnbAddRow[_text,_x select 1,""];
			_ctrl lnbSetPicture[[(lnbSize _ctrl select 0) - 1,0],_x select 2];
			_ctrl lnbSetData[[(lnbSize _ctrl select 0) - 1,0],_x select 1];
			_ctrl lnbSetValue[[(lnbSize _ctrl select 0) - 1,0],_val];
			if (_val isEqualTo -1) then
			{
				_ctrl lnbSetColor [[(lnbSize _ctrl select 0) - 1,0],[0.22,0.22,0.22,1]];
			};
		};
	};
} forEach _spCfg;

_ctrl lnbSetCurSelRow 0;
_sp = _spCfg select 0;
life_spawn_point = _sp;
private _camStart = getMarkerPos (_sp select 1);

private _angle = getDir player;
private _direction = 0;//getNumber (missionConfigFile >> "CfgSpawns" >> "direction");
private _altitude = 200;//getNumber (missionConfigFile >> "CfgSpawns" >> "altitude");
private _radius = 150;

private _coords = [_camStart,_radius,_angle] call BIS_fnc_relPos;
_coords set [2,_altitude];

private _camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
showCinemaBorder false;
_camera camSetFOV 0.800;
_camera camSetTarget _camStart;
_camera camCommit 0;

waitUntil {camCommitted _camera};

[_camera,_angle,_direction,_altitude,_altitude] spawn life_fnc_spawnCreateCam;