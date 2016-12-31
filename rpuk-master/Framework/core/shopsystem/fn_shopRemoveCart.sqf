/*
  RolePlay.co.uk 
  Author: Rathbone	
  Copyright (c) RolePlay.co.uk 2014 - 2016

  The usage of this file is restricted to RolePlay.co.uk
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
private _display = findDisplay 56100;
private _cartList = _display displayCtrl 1501;
private _cartAmount = _display displayCtrl 1008;
private _totalPrice = _display displayCtrl 1007;
private _cashOnHand = _display displayCtrl 1003;
private _arrayToFind = [];
private _className = lbData [1501,(lbCurSel 1501)];
private _wIndex = lbValue [1501,(lbCurSel 1501)];

_arrayToFind = [_className,_wIndex];
lbDelete[1501,(lbCurSel 1501)];

private _index = RPUKCart find _arrayToFind;
RPUKCart deleteAt _index;

RPUKCartTotal = RPUKCartTotal - _wIndex;
_totalPrice ctrlSetStructuredText parseText format ["Total Amount: £%1",[(RPUKCartTotal)] call life_fnc_numberText];
_cartAmount ctrlSetText format ["%1/20",[(count RPUKCart)] call life_fnc_numberText];

if(RPUK_dosh >= RPUKCartTotal) then 
{
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
} 
else 
{
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
};
