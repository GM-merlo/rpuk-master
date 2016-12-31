/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka

    Description:
    Saves the players gear for syncing to the database for persistence..
    NDJ note 11/July/2016 - Remember! Don't save processable items here, to prevent save/respawn exploits near processors/dealers!
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];

if (RPUK_AGear < 4) exitWith{}; //Tronny don't save...

_return = [];
//if player is wearing admin g@dtogs, don't save it - give him default. Only matters at end-of-session save (all others are blocked).
if (!(uniform player == "U_Virtualman_F")) then { 
	_return pushBack (uniform player);
} else {
	_return pushBack ("U_I_C_Soldier_Bandit_5_F");
};
_return pushBack (vest player);
_return pushBack (backpack player);
_return pushBack (goggles player);
_return pushBack (headgear player);
_return pushBack (assignedITems player);
if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then {
    _return pushBack (primaryWeapon player);
    _return pushBack (handgunWeapon player);
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags pushBack _x;
        } else {
            _uItems pushBack _x;
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags pushBack _x;
        } else {
            _bItems pushBack _x;
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags pushBack _x;
        } else {
            _vItems pushBack _x;
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags pushBack _pMag;
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags pushBack _pMag;
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags pushBack _pMag;
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags pushBack _hMag;
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags pushBack _hMag;
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags pushBack _hMag;
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems pushBack _x;
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems pushBack _x;
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems pushBack _name;
        };
    };
} forEach [
    ["life_inv_apple", life_inv_apple],
    ["life_inv_potato", life_inv_potato],
    ["life_inv_rabbit", life_inv_rabbit],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
    ["life_inv_defusekit", life_inv_defusekit],
    ["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
    ["life_inv_zipties", life_inv_zipties], //Our items added below this
    /*["life_inv_roadcone", life_inv_roadcone],
    ["life_inv_roadbarrier", life_inv_roadbarrier],
    ["life_inv_tapesign", life_inv_tapesign],
    ["life_inv_tapesignsm", life_inv_tapesignsm],
    ["life_inv_tapesignwarning", life_inv_tapesignwarning],
    ["life_inv_portablebarrier", life_inv_portablebarrier],
    ["life_inv_arrowleft", life_inv_arrowleft],
    ["life_inv_arrowright", life_inv_arrowright],*/
    ["life_inv_gyro", life_inv_gyro],
    ["life_inv_redburger", life_inv_redburger],
    ["life_inv_chips", life_inv_chips],
    ["life_inv_fries", life_inv_fries],
    ["life_inv_icecream", life_inv_icecream],
    ["life_inv_ratkebab", life_inv_ratkebab],
    ["life_inv_lollipop", life_inv_lollipop],
    ["life_inv_excavator", life_inv_excavator],
    ["life_inv_beer", life_inv_beer],
    ["life_inv_whisky", life_inv_whisky],
    ["life_inv_breathalyzer",life_inv_breathalyzer],
    ["life_inv_parkingticket",life_inv_parkingticket],
    ["life_inv_marmite",life_inv_marmite],
    //New Tanoa items
    ["life_inv_bbanana",life_inv_bbanana],
    ["life_inv_mango",life_inv_mango],
    ["life_inv_orange",life_inv_orange],
    ["life_inv_kiwi",life_inv_kiwi],
    ["life_inv_coconut",life_inv_coconut],
    ["life_inv_defib", life_inv_defib]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call life_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

life_gear = _return;
