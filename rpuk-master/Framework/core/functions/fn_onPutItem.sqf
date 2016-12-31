/*
	File: fn_onPutItem.sqf
	Author: Ciaran Langton

	Description:
	Stops the dropping/storing of admin uniform
*/
private["_unit","_item","_house","_container"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?
if(_item in ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR"]) then {
	if((_container isKindOf "GroundWeaponHolder") || (_container isKindOf "WeaponHolderSimulated")) then {
		deleteVehicle _container;
	};
};