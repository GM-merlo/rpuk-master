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
private _list = _display displayCtrl 1500;
private _cartList = _display displayCtrl 1501;
private _totalPrice = _display displayCtrl 1007;
private _cashOnHand = _display displayCtrl 1003;
private _cartAmount = _display displayCtrl 1008;
private _arrayToAdd = [];
private _value = lbValue [1500,(lbCurSel 1500)];

if ((lbCurSel 1500) isEqualTo -1) exitWith 
{
    hintSilent "You haven't selected an Item!"
};

if (count RPUKCart >= 20) exitWith 
{
    hintSilent "Your shopping cart is full!";
};

if (_value isEqualTo -1) exitWith 
{
    hint "This item is currently locked!";
};

private _className = lbData [1500,(lbCurSel 1500)];
private _price = getNumber (missionConfigFile >> "CfgShopSystem" >> (RPUKShopInfo select 0) >> _className >> "price" >> str (playerSide));
private _arrayToAdd = [_className,_price];
RPUKCart pushBack _arrayToAdd;

private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _index = _cartList lbAdd (_itemInfo select 1);
_cartList lbSetPicture [_index,(_itemInfo select 2)];
_cartList lbSetData [_index,_className];
_cartList lbSetValue [_index,_price];
_cartList lbSetCurSel 0;

RPUKCartTotal = RPUKCartTotal + _price;
_totalPrice ctrlSetStructuredText parseText format ["Total Amount: £%1",[(RPUKCartTotal)] call life_fnc_numberText];
_cartAmount ctrlSetText format ["%1/20",[(count RPUKCart)] call life_fnc_numberText];

if (RPUK_dosh >= RPUKCartTotal) then 
{
    _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
} 
else 
{
    _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
};

