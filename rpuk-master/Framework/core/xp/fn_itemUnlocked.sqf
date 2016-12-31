#include "xp.h"
/*
* @File:   fn_itemUnlocked.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
params [
  ["_type", "", [""]],
  ["_item", "", [""]]
];
if (playerSide != civilian) exitWith {[false, 0]};
private _class = missionConfigFile >> "CfgProgression" >> _type >> _item;

//Doesn't have a progression class, its not blocked.
if !(isClass _class) exitWith {[false, 0]};

private _level = getNumber (_class >> "level");

//It has a class, validate level needs.
[(_level > GET_LEVEL(life_xp)), _level]
