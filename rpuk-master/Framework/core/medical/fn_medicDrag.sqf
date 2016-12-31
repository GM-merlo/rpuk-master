/*
	File: fn_medicDrag.sqf
	Author: Ciaran Langton
	
	Description:
	Drags player.
*/
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target	
if(!(_curTarget isKindOf "Man") || {alive _curTarget}) exitWith {closeDialog 0;}; //Bad side check?

if(_curTarget getVariable["dragging",false]) then {
	//Exit the loop from the drag frame updater, then switch our animation back.
	_curTarget setVariable["dragging",false,true];
	player playMove "amovpknlmstpsraswrfldnon";
	player forceWalk false;
	//Set them down to the direction	
	if(alive player) then {
		//If player is NOT dead then set them back to the right position.
		_dir = [_curTarget,player] call BIS_fnc_dirTo;
		_curTarget setDir _dir;
		//Stop them from flying away 
		_pos  = player modelToWorld [0,1,0];
		_curTarget setPos _pos;
	};
} else {
	player playAction "grabDrag";
	player forceWalk true;
	_curTarget setVariable["dragging",true,true];
	[[_curTarget,player],"life_fnc_medicDragFrameUpdate",true,false] spawn life_fnc_MP;
	waitUntil {!(alive player) || !(_curTarget getVariable["dragging",false])};
	if(!(alive player)) then {
		[_curTarget] spawn life_fnc_medicDrag;
	};
};