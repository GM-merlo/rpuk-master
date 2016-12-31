/*
    RolePlay.co.uk 
    Author: Rathbone	
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
try
{
    if (isNil "RPUKShopInfo") then 
    {
        throw "Error!";
    };
    if (!isClass(missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1))) then 
    {
        throw "Bad Clothing Config";
    };

    RPUK_OldClothing = [];
    RPUK_OldClothing = [
        uniform player,
        headgear player,
        goggles player,
        vest player,
        backpack player,
        uniformItems player,
        vestItems player,
        backpackItems player
    ];

    createDialog "RPUK_ClothingStore";
    disableSerialization;

    private _ctrlArray = [
        1009,
        1010,
        1101,
        2405
    ];

    {
        ctrlShow [_x,false];
    } forEach _ctrlArray;

    private _display = findDisplay 56100;
    private _title = _display displayCtrl 1004;
    private _combo = _display displayCtrl 2100;
    private _list = _display displayCtrl 1500;
    private _clothingCart = _display displayCtrl 1501;
    private _cashOnHand = _display displayCtrl 1003;
    private _cartTotal = _display displayCtrl 1007;
    private _cartAmount = _display displayCtrl 1008;
    private _preview = _display displayCtrl 2401;

    _preview ctrlEnable false;

    _display displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];

    _title ctrlSetText format ["%1",getText (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "title")];
    
    lbClear _combo;
    lbClear _list;
    lbClear _clothingCart;

    {
        _combo lbAdd _x;
    } forEach ["Clothing","Hats","Glasses","Vests","Backpacks"];
    
    _combo lbSetCurSel 0;

    _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: £%1",[(RPUK_dosh)] call life_fnc_numberText];
    _cartTotal ctrlSetStructuredText parseText format ["Total Amount £%1",[(RPUKCartTotal)] call life_fnc_numberText];
    _cartAmount ctrlSetText format ["%1/20",[(count RPUKCart)] call life_fnc_numberText];
}
catch
{
    hint _exception;
};


