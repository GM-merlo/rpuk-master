/* 
	File: fn_slotStatSend.sqf
	Desc: Gets the new slot jackpot. Checks if this is higher.

	Author: Ciaran Langton
*/
_int = [_this,0,-1,[0]] call BIS_fnc_param;
_slotType = [_this,1,-1,[0]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(_int == -1 || _slotType == -1 || !isPlayer _player) exitWith {}; 

_current = life_jackpot select _slotType;

if(_current < _int) then {
	life_jackpot set[_slotType,_int];
	[[_int],"life_fnc_slotStat",_player,false] spawn life_fnc_MP; 
};
