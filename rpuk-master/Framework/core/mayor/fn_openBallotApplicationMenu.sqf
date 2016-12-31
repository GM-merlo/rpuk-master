/* 
	File: fn_openBallotApplicationMenu.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-02 17:05:22
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-10 19:20:03
*/
disableSerialization;
if(dialog) exitWith {};
if(!isNil 'life_mayor_entered') exitWith {hint "You have already entered a ballot application this term, or are currently in office.";};
if(!isNil 'life_mayor_query') exitWith {hint "You are already loading the menu.";};
life_mayor_query = true;
[[player],"MAYOR_fnc_checkBallotApplication",false] spawn life_fnc_MP;
hint "Please wait while we load your ballot status from the server.";