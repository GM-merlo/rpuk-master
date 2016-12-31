/*
	File: fn_changeFPS.sqf
	Author: Ciaran Langton
	
	Description:
	Updates the grass and other settings.
	
	Disabled for Tanoa! NDJ 15-07-16
*/

if(life_lowDetail && (worldname != "Tanoa")) then {
	setTerrainGrid 50;
} else {
	setTerrainGrid 25;
};