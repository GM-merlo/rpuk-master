/*
    File: fn_modShopSave.sqf
    Author: Ciaran Langton
    Desc: Saves the new variables to the car.
*/
private["_r","_g","_b","_a","_display","_reskinList","_cost","_nitroList","_texture","_selected_looks","_engineList","_paintR","_paintG","_paintB","_reskin","_reskinID","_nitro","_engine"];
disableSerialization;
_vehicle = vehicle player;
if(_vehicle == player) exitWith {};
_display = findDisplay 2000;
_reskinList = _display displayCtrl 1500;
_paintR = _display displayCtrl 1800;
_paintG = _display displayCtrl 1801;
_paintB = _display displayCtrl 1802;
_alpha = _display displayCtrl 1803;

_reskin = lbText [1500, lbCurSel 1500];
_reskinID = lbValue[1500, lbCurSel 1500];

if(_reskin == "") exitWith {hint "Please select a reskin to apply!"}; //Nothing selected

_cost = 0;

//Custom image
if(_reskin == "Custom RGB") then {
    _cost = _cost + 1550;
    if(RPUK_dosh < _cost) exitWith {hint "You do not have enough cash for this!";};

    _r = (sliderPosition _paintR);
    _g = (sliderPosition _paintG);
    _b = (sliderPosition _paintB);
    _a = (sliderPosition _alpha);

    _r = _r / 25.0;
    _g = _g / 25.0;
    _b = _b / 25.0;
    _a = _a / 10.0;

    _selected_looks = [_r,_g,_b,_a];

    _vehicle setVariable["Life_VEH_RGB",_selected_looks,true];

    //_tex = format ['#(argb,8,8,3)color(%1,%2,%3,%4)', _r, _g, _b, _a];
    //_vehicle setObjectTextureGlobal [0, _tex];
    [[_vehicle,(_vehicle getVariable "Life_VEH_color")],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;

};


//Color
if(!(_reskin == "Custom RGB")) then {
    _cost = _cost + 2500;
    if(RPUK_dosh < _cost) exitWith {hint "You do not have enough cash for this!";};
    _vehicle setVariable["Life_VEH_color",_reskinID,true];
    life_modshop_data set[1,[]]; //Set empty.
    _vehicle setVariable["Life_VEH_RGB",life_modshop_data select 1,true];

    [[_vehicle,_reskinID],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;

};
if(RPUK_dosh < _cost) exitWith {hint "You do not have enough cash for this!";};

vehicle player setDamage 0;
vehicle player setFuel 1;
[[vehicle player],"TON_fnc_updateVehicle",false,false] spawn life_fnc_MP;
RPUK_dosh = RPUK_dosh - _cost;
playSound "buy";
closeDialog 0;
life_modshop_purchase = true;
