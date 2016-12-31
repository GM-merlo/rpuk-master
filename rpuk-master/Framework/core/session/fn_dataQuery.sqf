/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(isDedicated) exitWith {}; //Sometimes it returns back here.
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;

_doMsg = {
	[
		format[
		"<t size='1.3' color='#5600FF'>%1</t><br/>%2.",_this select 0, _this select 1],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
};
["Query request sent",format[localize "STR_Session_Query",_uid]] call _doMsg;

0 cutFadeOut 999999999;

[[_uid,_side,_sender],"DB_fnc_queryRequest",(call life_fnc_findTransactionMethod),false] call life_fnc_MP;