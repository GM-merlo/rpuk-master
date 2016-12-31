/*
  RolePlay.co.uk
  Rathbone
  Copyright (c) RolePlay.co.uk 2014 - 2016

  The usage of this file is restricted to RolePlay.co.uk
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/

private _success = false;
private _exit = false;

if (RPUK_dosh < RPUKCartTotal) exitWith
{
    hint "You do not have enough to complete this purchase!";
};

if ((count RPUKCart) isEqualTo 0) exitWith
{
    hint "Cart is Empty!";
};

{
    private _className = (_x select 0);
    switch (RPUKShopInfo select 0) do
    {
        case "clothing":
        {
            [_className,true,nil,nil,nil,nil,nil,true] call life_fnc_handleItem;
            _success = true;
            RPUK_dosh = RPUK_dosh - (_x select 1);
            [player, true] call life_fnc_HandleUniforms;
        };
        case "weapon":
        {
            if (_className in ["ItemWatch","ItemMap","ItemGPS","ItemRadio","ItemCompass","ToolKit","FirstAidKit","Binocular","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","Medikit","Rangefinder","B_UavTerminal"]) then
            {
                if !(player canAdd _className) exitWith
                {
                    _exit = true;
                };
            };
            [_className,true] call life_fnc_handleItem;
            _success = true;
            RPUK_dosh = RPUK_dosh - (_x select 1);
        };
        default {_exit = true;};
    };
} forEach RPUKCart;

if (_exit) exitWith
{
    hint "You do not have enough Room!";
    [] call life_fnc_shopMenuClose;
};

if (_success) then
{
    [] call life_fnc_shopMenuClose;
};
