/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.
_vehicle setVariable ["BIS_enableRandomization", false];
if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {_vehicle setVariable["color",3];};
		case "C_Hatchback_01_F": {_vehicle setVariable["color",1];};
		case "C_Hatchback_01_sport_F": {_vehicle setVariable["color",1];};
		case "C_SUV_01_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_box_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_transport_F": {_vehicle setVariable["color",1];};
	};
};

//Fetch texture from our present array.
_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(isNil '_texture') exitWith {}; //Exit if there is no config!
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["Life_VEH_color",_index,true];
};

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTexture[0,_texture];
if(!isNil "_texture2") then
{
	_vehicle setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then
{
	_vehicle setObjectTexture[2,_texture3];
};

if(typeOf _vehicle == "C_Offroad_01_F") then
{
	if(_index < 5) then
	{
		_vehicle setObjectTexture[1,_texture];
	};
};

//If the vehicle has a RGB set, lets go and set it up!
if(count (_vehicle getVariable["Life_VEH_RGB",[]]) == 4) then { //If the array is populated with 4 entries (Red, Blue, Green, Alpha) then apply.
	_rgb = _vehicle getVariable["Life_VEH_RGB",[]];
	if(count _rgb == 0) exitWith {}; //EXIT
	_r = _rgb select 0;
    _g = _rgb select 1;
    _b = _rgb select 2;
    _a = _rgb select 3;

    _tex = format ['#(argb,8,8,3)color(%1,%2,%3,%4)', _r, _g, _b, _a];
    _vehicle setObjectTexture[0,_tex];
};