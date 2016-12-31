/* 
	File: fn_openBallotMenu.sqf
	
	Author: Ciaran Langton
	Date: 2015-01-28 20:38:52
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-05 01:39:29
*/
disableSerialization;
if(dialog) exitWith {};
if(!createDialog "mayor_ballot_menu") exitWith {};
[[player],"MAYOR_fnc_getBallotEntries",(call life_fnc_findTransactionMethod)] spawn life_fnc_MP;
ctrlEnable[2400,false];
