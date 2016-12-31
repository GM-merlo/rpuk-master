scopeName "SpawnCamera";
/*
	File: fn_spawnCreateCam.sqf


    RolePlay.co.uk
    Author: Rathbone	
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _camera = _this select 0;
private _angle = _this select 1;
private _direction = _this select 2;
private _altitude = _this select 3;
private _radius = _this select 4;

if (RPUK_SpawnCam) exitWith {};

RPUK_SpawnCam = true;
cutText ["","BLACK IN"];

private _pos = life_spawn_point;

while {RPUK_SpawnCam} do 
{
	private _coords = [getMarkerPos (life_spawn_point select 1), _radius, _angle] call BIS_fnc_relPos;
	_coords set [2, _altitude];
	_camera camSetPos _coords;
	_camera camCommit 0.5;
	waitUntil {camCommitted _camera || !(RPUK_SpawnCam)};
	if !(RPUK_SpawnCam) exitWith 
    {
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
        breakOut "SpawnCamera";
	};
	if !(_pos isEqualTo life_spawn_point) then 
    {
        titleText["","BLACK IN",5];
		_pos = life_spawn_point;
		_camera camSetTarget (getMarkerPos (life_spawn_point select 1));
	};
	_camera camSetPos _coords;
	_camera camCommit 0;
	_angle = if (_direction isEqualTo 0) then 
    {
        _angle - 1;
    } 
    else 
    {
        _angle + 1;
    };
};

 