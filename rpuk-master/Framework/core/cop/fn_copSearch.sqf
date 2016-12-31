#include <macro.h>
/* 
	File: fn_copSearch.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-01 02:02:29
*/
life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_output = [_this,1,"",[""]] call BIS_fnc_param;
_value = [_this,2,0,[0]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

hint parseText format["%1<br/> Total of Illegal Items: £%2",_output,[_value] call life_fnc_numberText];
