/*
	File: fn_breathalyse.sqf
	Author: Ciaran Langton
	
	Description:
	Breathalyses the player, returns if they are legal or not (For driving).
*/
_player = cursorTarget;
if(isNull _player) exitWith {hint "You are not looking at a player.";};
if(!isPlayer _player) exitWith {hint "You are not looking at a player.";};
if(playerSide == civilian) exitWith {hint "You have no idea how to use this! (Only Police and Medics can use this item!)";};

_bac = _player getVariable["bac",0];

if(_bac > 0.11) then {
	//Player is intoxicated.
	hint parseText format["<t size='2'>Player is Intoxicated</t><br>BAC:%1",_bac];
} else {
	//Player is not intoxicated.
	hint parseText format["<t size='2'>Player is not Intoxicated</t><br>The player is legal to operate a motor vehicle. BAC:%1",_bac];
};