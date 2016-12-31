/*
	File: fn_skyDiving.sqf
	Author: Ciaran Langton
	Desc: Makes the player skydive.
*/

private ["_landingPos","_dropPos","_rangefromtargetm","_xpfactor","_diveprice"];

if (worldname == "Tanoa") then {
	_diveprice = 100;
}	else {
	_diveprice = 500;
};
if(RPUK_dosh < _diveprice) exitWith {hint format["You do not have £%1 to skydive!",_diveprice];};
RPUK_dosh = RPUK_dosh - _diveprice;

if(life_action_inUse) exitWith {};
life_action_inUse = true;
//Save these two vars.
life_skydive_backpack = backpack player;
life_skydive_backpackItems = backpackItems player;

if(worldName == "Tanoa") then {
	_landingPos = [6846.5879,7385.1353,2.6600001]; //xyz format ATL
} else {
	_landingPos =  getPosATL player;
};

_dropPos = _landingPos;
_dropPos set[2,6000]; //Drop from 6000m.

cutText ["", "BLACK OUT", 5];
sleep 3;
cutText ["You are now arriving at the drop zone. Please prepare to jump!", "BLACK FADED"];
0 cutFadeOut 999999;
sleep 1;
//SETUP SIM OF PLANE
player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian"); //Send them to a island to play the audio to simulate the plane.
player addBackpack "B_Parachute";
//Now play our audio
for "_i" from 0 to 3 do
{
	playSound "airplane";
	sleep 2.2;
};
sleep 5;
player setPosATL _dropPos; //Set their position
_currentView = viewDistance;
setViewDistance 12000; //Up the view distance
cutText["","PLAIN"];

waitUntil {isTouchingGround player};

if((alive player)) then {
	//award some XP (Tanoa only) if they made it close enough to the landing spot!
	_rangefromtargetm = player distance2D _landingPos;
	switch (true) do {
		case (_rangefromtargetm > 0.0001 && _rangefromtargetm <= 1): {
			//dead-centre to 1m (allowing for potential 1e10m default 'not found' return value)
			_xpfactor = 50;
			titleText["Bullseye! Less than a meter! You hero! Have your money back!","PLAIN"];
			RPUK_dosh = RPUK_dosh + _diveprice; //money back!
		};
		case (_rangefromtargetm > 1 && _rangefromtargetm <= 5): {
			//1m to 5m
			_xpfactor = 30;
			titleText["Within 5 meters - great job!","PLAIN"];
		};
		case (_rangefromtargetm > 5 && _rangefromtargetm <= 10): {
			//5m to 10m
			_xpfactor = 20;
			titleText["Within 10 meters - nice work!","PLAIN"];
		};
		case (_rangefromtargetm > 10 && _rangefromtargetm <= 20): {
			//10m to 20m
			_xpfactor = 10;
			titleText["Within 20 meters - not bad!","PLAIN"];
		};
		case (_rangefromtargetm > 20 && _rangefromtargetm <= 30): {
			//20m to 30m
			titleText["Within 30 meters - so-so!","PLAIN"];
			_xpfactor = 5;
		};
		case (_rangefromtargetm > 30 && _rangefromtargetm <= 50): {
			//30m to 50m
			_xpfactor = 2;
			titleText["Within 50 meters. Meh! You could do better!","PLAIN"];
		};
		default {
			//over 50m
			titleText["Well, you didn't die at least. Try steering next time!","PLAIN"];
			_xpfactor = 1;
		}; 
	};
	if (worldName == "Tanoa") then {[_xpfactor] call life_fnc_addxp;};
};
uiSleep 5; //wait 5 seconds for the XP hint to show
removeBackpack player;
player addBackpack life_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call life_fnc_handleItem;
} foreach life_skydive_backpackItems;
hint "You're done with the chute now, so here's your own backpack again.";

setViewDistance _currentView;
life_action_inUse = false;
