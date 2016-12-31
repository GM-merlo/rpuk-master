/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,RPUK_dosh,RPUK_doshinbank,player],"DB_fnc_insertRequest",(call life_fnc_findTransactionMethod),false] spawn life_fnc_MP;
