/*
	File: fn_dropItems.sqf
	Author: Ciaran Langton (Refactored 30/04/2015)

	Description:
	Called when the player dies, places all items they have into a bag, and then drops their money.
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

_pos = _unit modelToWorld[0,3,0];
_pos = [_pos select 0, _pos select 1, 0];

_trunkContents = [];
_weight = 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	if(_value > 0) then {
		_var = [_item,1] call life_fnc_varHandle;
		_itemWeight = ([_var] call life_fnc_itemWeight) * _value;
		_trunkContents pushBack [_var, _value];
		missionNamespace setVariable[_item,0];
		_weight = _weight + _itemWeight;
	};
} forEach life_inv_items;

if(count _trunkContents > 0) then {
	_obj = "Land_Sack_F" createVehicle _pos;
	[[_obj],"life_fnc_simDisable",true,true] spawn life_fnc_MP;
	_obj allowDamage false;
	_obj setPos _pos;
	_obj setVariable["Trunk",[_trunkContents,_weight],true];
};

if(RPUK_dosh > 0) then
{
	_obj = "Land_Money_F" createVehicle _pos;
	_obj setVariable["item",["money",RPUK_dosh],true];
	[[_obj],"life_fnc_simDisable",true,true] spawn life_fnc_MP;
	_obj setPos _pos;
	missionNamespace setVariable["RPUK_dosh",0];
};
