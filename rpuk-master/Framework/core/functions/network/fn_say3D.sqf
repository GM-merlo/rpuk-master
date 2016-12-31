/* 
	File: fn_say3D.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-30 19:59:37
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-11 18:46:48
*/
private["_object","_sound"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _object OR _sound == "") exitWith {};
_object say3D _sound;