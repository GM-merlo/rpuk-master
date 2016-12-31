/*
* @File:   xp.h
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
#define XP_CONSTANT 0.15
#define GET_LEVEL(XP) (floor(XP_CONSTANT * sqrt(XP)))
#define GET_LEVEL_XP(LEVEL) (ceil(((LEVEL) / XP_CONSTANT) ^ 2))
#define GET_LEVEL_DIFF(L1, L2) (GET_LEVEL_XP(L1) - GET_LEVEL_XP(L2))
#define GET_LEVEL_PROGRESS() ((life_xp - GET_LEVEL_XP(GET_LEVEL(life_xp))) / GET_LEVEL_DIFF(GET_LEVEL(life_xp) + 1, GET_LEVEL(life_xp)))
