/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
params [
	["_robber",objNull,[objNull]]
];

if(isNull _robber) exitWith {}; //No one to return it to?

if(RPUK_dosh > 0) then
{
	[[RPUK_dosh],"life_fnc_rbRecv",_robber,false] spawn life_fnc_MP; //NDJ - altered name of func to reduce hack calls
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	
	[1,format[localize "STR_NOTF_Robbed",_robber getVariable["realname",name _robber],profileName,[RPUK_dosh] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];

	[[player,_robber,RPUK_dosh, "robtaken"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP; //log to server NDJ 11Apr14
	RPUK_dosh = 0;
}
	else
{
	[2,format[localize "STR_NOTF_RobFail",profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};