/*
    File: fn_modShopClose.sqf
    Author: Ciaran Langton
    Desc: Resorts the car back to its old format.
*/
private["_oldTextureID","_vehicle","_texture"];
_vehicle = vehicle player;

if(!life_modshop_purchase) then {

    _oldTextureID = life_modshop_data select 0;
    _rgb = life_modshop_data select 1;

    [_vehicle, _oldTextureID] call life_fnc_colorVehicle;

};

life_modshop_data = nil;
life_modshop_purchase = nil;
life_modshop_cost = nil;