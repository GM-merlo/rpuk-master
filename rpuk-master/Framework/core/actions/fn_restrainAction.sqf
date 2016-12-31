/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine / Ciaran - 15/08/2014
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
//if(side _unit == west) exitWith {}; - Ciaran - Add new civ restrain
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

if(playerSide == west) then 
{
	//Cuffs
	[[_unit, "cuffson",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[0,format[localize "STR_NOTF_Restrained",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
	_unit setVariable["civrestrained",false,true]; //Restrained by cop
}
	else
{
	//Ziptie	
	if(license_civ_bounty) then 
	{
		[0,format[localize "STR_NOTF_Restrained",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
		[[_unit, "cuffson",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	} 
		else
	{
		[[_unit, "ZipTie",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		[0,format[localize "STR_NOTF_Ziptied",_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",-2];
	};
	_unit setVariable["civrestrained",true,true]; //Restrained by civ
};

_unit setVariable["restrained",true,true];
[[player,license_civ_bounty], "life_fnc_restrain", _unit, false] spawn life_fnc_MP; //CL - Pass if the player is a bhunter or not.