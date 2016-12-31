/*
	File fn_lockHouse.sqf

	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
	
	TinyBigJacko note 7/8/16: Yeah, only VIRTUALLY locks the house.. And then, only the STORAGE! Doors may physically still be open!
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable["housestoragelocked",true];
if(_state) then {
	_house setVariable["housestoragelocked",false,true];
	titleText[localize "STR_House_StorageUnlock","PLAIN"];
} else {
	_house setVariable["housestoragelocked",true,true];
	titleText[localize "STR_House_StorageLock","PLAIN"];
};