/*
	File: fn_fatigueManager.sqf
	Author: Ciaran
	Desc: Prevents players fatigue levels from going above our limit.
	As always, if you are not from altislife.co.uk then WHAT THE FUCK ARE YOU DOING HERE
*/

while {true} do {
	//If our player has a fatigue above limit then reset it to fatigue - 0.5
	if (0.7 < getFatigue player) then {
		player setFatigue 0.65;
	};
	sleep 1.5;
};