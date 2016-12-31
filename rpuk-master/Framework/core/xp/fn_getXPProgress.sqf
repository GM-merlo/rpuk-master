#include "xp.h"
/*
* @File:   fn_getXPProgress.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/

/* removed check for civ only - cops allowed to get xp - NDJ 100816

if !(playerSide isEqualTo civilian) exitWith 
{
    private _notCiv = 0;
    _notCiv
};
*/

private _dif = GET_LEVEL_PROGRESS();
_dif
