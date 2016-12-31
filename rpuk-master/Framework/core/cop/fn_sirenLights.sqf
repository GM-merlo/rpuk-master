/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_T_LSV_01_unarmed_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
	if(typeOf _vehicle == "C_Offroad_01_F") then
	{
		_vehicle animate ["BeaconsStart",0];
	};
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	if(typeOf _vehicle == "C_Offroad_01_F") then
	{
		_vehicle animate ["HidePolice",0];
		_vehicle animate ["BeaconsStart",1];
	} else {
		[[_vehicle,0.22],"life_fnc_copLights",true,false] call life_fnc_MP;
	};
};