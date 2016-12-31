/* 
	File: fn_launderMoney.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-31 22:36:22
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-31 22:51:20
*/
if(playerSide != civilian) exitWith {};
_count = life_inv_markedmoney;
if(_count < 1) exitWith {hint "You do not have any marked money to launder!"};
_money = (_count * 35000);
[false,"markedmoney",_count] call life_fnc_handleInv;
RPUK_dosh = RPUK_dosh + _money;
hint format["I have taken my cut of the money to pay for the laundering, here is your part of the cut. (£%1)", [_money] call life_fnc_numberText];