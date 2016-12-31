#include "xp.h"
/*
* @File:   fn_addXP.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
params [
  ["_xp", 0, [0]] , 
  ["_showhint", true, [objNull,true]]
];
//if (playerSide != civilian) exitWith {};  //NDJ 100816 - removed - Cops can now earn XP whilst copping.
if (_xp isEqualTo 0) exitWith {};
private _isIncrease = (_xp > 0);

//Fetch previous level
private _prevLevel = call life_fnc_getLevel;

//Add XP
life_xp = life_xp + _xp;

if (life_xp <= 0) exitWith {
  life_xp = 0;
};

//Fetch new level.
private _newLevel = call life_fnc_getLevel;

if (_xp > 0) then {
	if (_showhint) then {hint format["Well done! You gained %1 XP", _xp]};
	playSound "xpup";
} else {
	if (_showhint) then {hint format["Bad move! You just LOST %1 XP", abs(_xp)]};
	playSound "xpdown";
};	

if !(_prevLevel isEqualTo _newLevel) then {
  private _msg = [
    format["Hi %1!", profileName]
  ];

  private _levelToInspect = [_prevLevel, _newLevel] select _isIncrease;
  private _newClothes = ["Clothing", _levelToInspect] call life_fnc_getItemsForLevel;
  private _newVehicles = ["Vehicles", _levelToInspect] call life_fnc_getItemsForLevel;
  private _newSpawns = ["Spawns", _levelToInspect] call life_fnc_getItemsForLevel;
  private _newWeapons = ["Weapons", _levelToInspect] call life_fnc_getItemsForLevel;
  private _newItems = (count _newClothes > 0 || count _newVehicles > 0 || count _newSpawns > 0 || count _newWeapons > 0);

  if (_isIncrease) then {
    _msg pushBack format["Congratulations on levelling up to level %1!", _newLevel];

    if (_newItems) then {
      _msg pushBack "You've just gained access to:";
    };
  } else {
    _msg pushBack format["Oh, thats embarrassing... It seems that you levelled down to level %1!", _newLevel];

    if (_newItems) then {
      _msg pushBack "You've just lost access to:";
    };
  };

  //To be cleaned the fuck up!
  if (_newItems) then {
    if (count _newSpawns > 0) then {
      _msg pushBack "\nSpawns:";
      _msg append (_newSpawns apply {format["- %1", getText(_x >> "name")]});
    };
    if (count _newWeapons > 0) then {
      _msg pushBack "\nWeapons:";
      _msg append (_newWeapons apply {format["- %1", getText(_x >> "name")]});
    };
    if (count _newVehicles > 0) then {
      _msg pushBack "\nVehicles:";
      _msg append (_newVehicles apply {format["- %1", getText(_x >> "name")]});
    };
    if (count _newClothes > 0) then {
      _msg pushBack "\nClothing:";
      _msg append (_newClothes apply {format["- %1", getText(_x >> "name")]});
    };
  };

  _msg pushBack "\nYours truly, Professor Windbottom.";

  //Send message
  [
    "Professor Windbottom",
    "11111111111111111",
    0,
    getPlayerUID player,
    _msg joinString "\n",
    [-1,-1,-1]
  ] call life_fnc_mobileMessageReceived;
};

//Update HUD
[] call life_fnc_hudUpdate;
