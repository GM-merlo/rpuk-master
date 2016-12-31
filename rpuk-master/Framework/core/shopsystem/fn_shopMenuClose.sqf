/*
  RolePlay.co.uk 
  Rathbone	
  Copyright (c) RolePlay.co.uk 2014 - 2016

  The usage of this file is restricted to RolePlay.co.uk
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
private _display = findDisplay 56100;

_display displayRemoveAllEventHandlers "KeyDown";

RPUKCartTotal = nil;
RPUKCart = nil;
RPUKShopInfo = nil;
RPUK_OldClothing = nil;
RPUK_ClothingFilter = nil;
RPUK_ClothingCurrent = nil;

closeDialog 0;

[3] call SOCK_fnc_updatePartial;
[0] call SOCK_fnc_updatePartial;

