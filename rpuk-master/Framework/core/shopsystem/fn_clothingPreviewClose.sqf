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
    
    disableSerialization;
    private _display = findDisplay 56100;

    private _prevArray = [
        1009,
        1010,
        1101,
        2405
    ];

    private _shopArray = [
        2404,
        1501,
        2403,
        2402,
        2401,
        2400,
        1100,
        2100,
        1500,
        1008,
        1007,
        1003,
        1006,
        1005,
        1004,
        1002,
        1001,
        1000
    ];

    RPUK_ShopCam cameraEffect ["TERMINATE","BACK"];
    camDestroy RPUK_ShopCam;
    RPUK_ShopCam_Degree = nil;

    _display displayRemoveAllEventHandlers "MouseButtonDown";
    _display displayRemoveAllEventHandlers "MouseButtonUp";
    _display displayRemoveAllEventHandlers "MouseMoving";

    {
        ctrlShow [_x,false];
    } forEach _prevArray;

    {
        ctrlShow [_x,true];
    } forEach _shopArray;

    private _combo = _display displayCtrl 2100;
    private _list = _display displayCtrl 1500;
    private _clothingCart = _display displayCtrl 1501;
    private _cashOnHand = _display displayCtrl 1003;
    private _cartTotal = _display displayCtrl 1007;
    private _cartAmount = _display displayCtrl 1008;

    lbClear _combo;
    lbClear _list;
    lbClear _clothingCart;

    {
        _combo lbAdd _x;
    } forEach ["Clothing","Hats","Glasses","Vests","Backpacks"];

    _combo lbSetCurSel RPUK_ClothingFilter;
    //sleep 1;
    _list lbSetCurSel RPUK_ClothingCurrent;

    RPUK_ClothingCurrent = nil;

    {
        private _className = (_x select 0);
        private _price = (_x select 1);
        private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
        private _index = _clothingCart lbAdd (_itemInfo select 1);
        _clothingCart lbSetPicture [_index,(_itemInfo select 2)];
        _clothingCart lbSetData [_index,_className];
        _clothingCart lbSetValue [_index,_price];
    } forEach RPUKCart;

    if (RPUK_dosh >= RPUKCartTotal) then 
    {
        _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
    } 
    else 
    {
        _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>£%1</t>",[(RPUK_dosh)] call life_fnc_numberText];
    };
    _cartTotal ctrlSetStructuredText parseText format ["Total Amount: £%1",[(RPUKCartTotal)] call life_fnc_numberText];
    _cartAmount ctrlSetText format ["%1/20",[(count RPUKCart)] call life_fnc_numberText];

    switch (RPUK_ClothingFilter) do 
    {
        case 0:
        {
            private _clothing = (RPUK_OldClothing select 0);
            if !(_clothing isEqualTo "") then 
            {
                player forceAddUniform _clothing;
            } 
            else
            {
                removeUniform player;
            };
            if (count (RPUK_OldClothing select 5) > 0) then
            {
                {
                    [_x,true,false,false,true] call life_fnc_handleItem;
                } forEach (RPUK_OldClothing select 5);
            };
        };
        case 1:
        {
            private _headgear = (RPUK_OldClothing select 1);
            if !(_headgear isEqualTo "") then 
            {
                player addHeadgear _headgear;
            } 
            else
            {
                removeHeadgear player;
            };
        };
        case 2:
        {
            private _goggles = (RPUK_OldClothing select 2);
            if !(_goggles isEqualTo "") then
            {
                player addGoggles _goggles;
            }
            else
            {
                removeGoggles player;
            };
        };
        case 3:
        {
            private _vest = (RPUK_OldClothing select 3);
            if !(_vest isEqualTo "") then
            {
                player addVest _vest;
                if (count (RPUK_OldClothing select 6) > 0) then {
                    {
                        [_x,true,false,false,true] call life_fnc_handleItem
                    } forEach (RPUK_OldClothing select 6);
                };
            }
            else
            {
                removeVest player;
            };
        };
        case 4:
        {
            private _backpack = (RPUK_OldClothing select 4);
            if !(_backpack isEqualTo "") then
            {
                removeBackpack player;
                player addBackpack _backpack;
                clearAllItemsFromBackpack player;
                if (count (RPUK_OldClothing select 7) > 0) then {
                    {
                        [_x,true,true] call life_fnc_handleItem;
                    } forEach (RPUK_OldClothing select 7);
                };
            }
            else
            {
                removeBackpack player;
            };
        };
    };
}
catch
{
    hint _exception;
};


