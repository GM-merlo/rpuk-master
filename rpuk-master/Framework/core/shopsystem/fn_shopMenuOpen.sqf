/*
    RolePlay.co.uk 
    Author: Rathbone	
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _shop = param [0,objNull,[objNull]];

(_this select 3) params [
    ["_side",sideUnknown,[sideUnknown]],
    ["_type","",[""]],
    ["_store","",[""]]
];

try
{
    if (dialog) then 
    {
        throw "Another Dialog is already open!";
    };
    if (isNull _shop) then 
    {
        throw "Vendor Error";
    };
    if (_side isEqualTo sideUnknown) then 
    {
        throw "Shop Init Error: Side Not Set";
    };
    if (_type isEqualTo "") then 
    {
        throw "Shop Init Error: Type Data is Null";    
    };
    if (_store isEqualTo "") then 
    {
        throw "Shop Init Error: Store Data is Null";
    };
    if !(isNull objectParent player) then 
    {
        throw "You cannot be in a Vehicle!";
    };
    if !(playerSide isEqualTo _side) then 
    {
        throw "You're not allowed to access this shop!";
    };

    RPUKCartTotal = 0;
    RPUKCart = [];
    RPUKShopInfo = [];
    RPUKShopInfo = [_type,_store];

    switch (_type) do 
    {
        case "clothing": 
        {
            [] call life_fnc_clothingMenuOpen;
        };
        case "weapon": 
        {
            [] call life_fnc_weaponMenuOpen;
        };
        case "virtualitems": 
        {
            [] call life_fnc_vItemMenuOpen;
        };
        default {};
    };
}
catch
{
    hint _exception;
};


