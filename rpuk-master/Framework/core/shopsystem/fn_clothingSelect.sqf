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
private _control = _this select 0;
private _index = _this select 1;
private _preview = _display displayCtrl 2401;
private _textInfo = _display displayCtrl 1100;
private _addToCart = _display displayCtrl 2400;

if (_index isEqualTo -1) exitWith {};

private _className = _control lbData _index;

//Enable 'Add to Cart' only if the item is unlocked.
(["Clothing",_className] call life_fnc_itemUnlocked) params [
  ["_locked", false, [false]],
  ["_level", 0, [0]]
];
_addToCart ctrlEnable !_locked;

private _levelText = ['Unlocked', format["Locked, you need to be level %1 to wear this!", _level]] select _locked;
private _basePrice = getNumber (missionConfigFile >> "CfgShopSystem" >> "clothing" >> _className >> "price" >> str (playerSide));
private _cDescription = getText (missionConfigFile >> "CfgShopSystem" >> "clothing" >> _className >> "description" >> str (playerSide));
private _clothingInfo = [_className] call life_fnc_fetchCfgDetails;
private _displayName = (_clothingInfo select 1);
private _description = if (_cDescription isEqualTo "") then
{
    if ((_clothingInfo select 9) isEqualTo "") then
    {
        "None"
    }
    else
    {
        (_clothingInfo select 9)
    };
}
else
{
    _cDescription
};

_textInfo ctrlSetStructuredText parseText format [
    "Name: <t color='#ffae2b'>%1</t><br/><t align='center' size='1' shadow='0'><img image=%2 /></t><br/>Price: <t color='#27e640'>£%3</t><br/>Status: <t color='#27e640'>%4</t><br/>Description:<br/><t color='#ffae2b'>%5</t>",
    _displayName,
    _clothingInfo select 2,
    [_basePrice] call life_fnc_numberText,
    _description,
    _levelText
];


if !(ctrlEnabled _preview) then
{
    _preview ctrlEnable true;
};
