/*
	File: fn_broadcastAlert.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks if player is admin and notifies them that of the
	flagged person.
*/
private["_pName","_pReason"];
_pName = _this select 0;
_pReason = _this select 1;
if(isServer && !hasInterface) exitWith {}; //NO SERVER DO NOT EXECUTE IT!
if((call life_wilcorank) < 1) exitWith {};
hint parseText format["<t align='center'><t color='#FF0000'><t size='3'>Altis Life UK</t></t><br/>Cheater Flagged</t><br/><br/>Name: %1<br/>Detection: %2",_pName,_pReason];