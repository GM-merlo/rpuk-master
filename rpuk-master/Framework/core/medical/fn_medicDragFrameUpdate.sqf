/*
	File: fn_medicDragFrameUpdate.sqf
	Author: Ciaran Langton
	
	Description:
	Updates on frame. Keeps the player attached.
*/
_unit 	= (_this select 0);
_player	= (_this select 1);

while {_unit getVariable["dragging",false] && alive _player} do {
	_pos  = _player modelToWorld [0,1,0];
	_unit setPos _pos;
	_unit switchMove "AinjPpneMrunSnonWnonDb";
	_dir = [_unit,_player] call BIS_fnc_dirTo;
	_unit setDir _dir;
};