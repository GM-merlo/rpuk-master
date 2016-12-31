/* 
	File: fn_collectWood.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-08 13:17:39
*/
if(([true,"wood",1] call life_fnc_handleInv)) then
{
	titleText["You have collected some wood from the box! Please go and process it at the Machine over there!","PLAIN"];
};