/* 
	File: fn_slotStat.sqf
	Desc: Send the jackpot to the client.

	Author: Ciaran Langton
*/
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_slotType = [_this,1,-1,[0]] call BIS_fnc_param;
if(!isPlayer _player || _slotType == -1) exitWith {};
[[(life_jackpot select _slotType)],"life_fnc_slotStat",_player,false] spawn life_fnc_MP;