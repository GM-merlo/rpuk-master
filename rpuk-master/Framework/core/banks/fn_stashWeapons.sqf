/* 
	File: fn_stashWeapons.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-31 22:56:15
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-31 22:57:08
*/
if(playerSide != civilian) exitWith {};
_count = life_inv_weaponbag;
if(_count < 1) exitWith {hint "You do not have any illegal weapons to launder!"};
_money = (_count * 45000);
[false,"weaponbag",_count] call life_fnc_handleInv;
RPUK_dosh = RPUK_dosh + _money;
hint format["I have taken my cut of the money to pay for the storage, here is your part of the cut. (£%1)", [_money] call life_fnc_numberText];