/*
* @File:   fn_getItemsForLevel.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
params [
  ["_type", "", [""]],
  ["_level", 0, [0]]
];

("_level isEqualTo getNumber(_x >> 'level')" configClasses (missionConfigFile >> "CfgProgression" >> _type))
