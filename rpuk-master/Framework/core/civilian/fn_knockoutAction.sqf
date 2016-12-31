/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	Modified: NDJ (TinyBigJacko) for PCSO knockdown 24Apr14
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockingout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
sleep 0.08;
if(!(playerSide == west)) then {
	//systemchat "Phase 3 knockdown - calling as cop";
	[[_target,profileName, false],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
}
else {
	//systemchat "Phase 3 knockdown - calling as civ";
	[[_target,profileName, true],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
};
sleep 3;
life_knockingout = false;