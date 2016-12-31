/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
*/
private["_veh","_tInv","_pInv","_veh_data"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh OR !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;

((findDisplay 3500) displayCtrl 3507) ctrlEnable false;
((findDisplay 3500) displayCtrl 3508) ctrlEnable false;

lbClear _tInv;
lbClear _pInv;

if(_veh isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh getVariable["containers",[]]);
	_veh_data = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_veh] call life_fnc_vehicleWeight;
};

if(_veh_data select 0 == -1) exitWith {closeDialog 0};

ctrlSetText[3504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];
_data = _veh getVariable ["Trunk",[]];
if(count _data == 0) then {_veh setVariable["Trunk",[[],0],true]; _data = [];} else {_data = _data select 0;};

_invHandle = [_pInv] spawn {
	disableSerialization;
	_pInv = _this select 0;
	//Player Inventory Items
	{
		//Money Handle
		if(_x != "RPUK_dosh") then
		{
			_str = [_x] call life_fnc_varToStr;
			_shrt = [_x,1] call life_fnc_varHandle;
			_val = missionNameSpace getVariable _x;
			if(_val > 0) then
			{
				_pInv lbAdd format["[%1] - %2",_val,_str];
				_pInv lbSetData [(lbSize _pInv)-1,_shrt];

				_pic = [_x] call life_fnc_itemImage;
				if(_pic != "") then {
					_pInv lbSetPicture [(lbSize _pInv)-1,_pic];
				};
			};
		}
			else
		{
			if(RPUK_dosh > 0) then
			{
				_pInv lbAdd format["£%1",[RPUK_dosh] call life_fnc_numberText];
				_pInv lbSetData [(lbSize _pInv)-1,"money"];
			};
		};
	} foreach life_inv_items;
};

_trunkHandle = [_tInv,_data] spawn {
	disableSerialization;
	_tInv = _this select 0;
	_data = _this select 1;
	//Trunk Inventory Items
	{
		if((_x select 0) != "money") then
		{
			_var = [_x select 0,0] call life_fnc_varHandle;
			_name = [_var] call life_fnc_varToStr;
			_val = _x select 1;
			if(_val > 0) then
			{
				_tInv lbAdd format["[%1] - %2",_val,_name];
				_tInv lbSetData [(lbSize _tInv)-1,_x select 0];

				_pic = [_var] call life_fnc_itemImage;
				if(_pic != "") then {
					_tInv lbSetPicture [(lbSize _tInv)-1,_pic];
				};
			};
		}
			else
		{
			_val = _x select 1;
			if(_val > 0) then
			{
				_tInv lbAdd format["£%1",[_val] call life_fnc_numberText];
				_tInv lbSetData [(lbSize _pInv)-1,"money"];
			};
		};
	} foreach _data;
};

waitUntil {scriptDone _invHandle && scriptDone _trunkHandle};
((findDisplay 3500) displayCtrl 3507) ctrlEnable true;
if(!(_veh isKindOf "Land_Sack_F")) then {((findDisplay 3500) displayCtrl 3508) ctrlEnable true;};
