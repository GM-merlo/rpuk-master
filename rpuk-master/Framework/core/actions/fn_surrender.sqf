/*
	Author: Ciaran
	File: fn_surrender.sqf
	Description: Sets the surrender variable on the body to true, then beings the animation
*/

player setVariable ["surrender", true, true]; 

while { player getVariable ["surrender", false] }  do { 
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; 
	
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";