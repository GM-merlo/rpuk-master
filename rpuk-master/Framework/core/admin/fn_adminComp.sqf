/* 
	File: fn_adminComp.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-25 21:10:53
*/
private["_val"];
#include <macro.h>
if(__GETC__(life_wilcorank) < 1) exitWith {closeDialog 0;};
_bank = _this select 0;

_val = parseNumber(ctrlText 2904);
if(_bank) then {
	RPUK_doshinbank = RPUK_doshinbank + _val;
} else {
	RPUK_dosh = RPUK_dosh + _val;	
};

hint format["Added %1 To your character.",_val];
[] call life_fnc_p_updateMenu;