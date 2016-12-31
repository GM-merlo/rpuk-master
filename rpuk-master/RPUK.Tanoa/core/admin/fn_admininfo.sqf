/*
	File: fn_admininfo.sqf
	Author: Bryan "Tonic" Boardwine
	Modded & Fixed: NDJ 280716

	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_pattach","_sattach","_tmp","_isRebel","_playerclass"];
_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_unit = _ret select 3;
_prim = if(primaryWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "DisplayName")} else {"None"};
_sec = if(handgunWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "DisplayName")} else {"None"};
_vest = if(vest _unit != "") then { getText(configFile >> "CfgWeapons" >> (vest _unit) >> "DisplayName")} else {"None"};
_uni = if(uniform _unit != "") then { getText(configFile >> "CfgWeapons" >> (uniform _unit) >> "DisplayName")} else {"None"};
_bp = if(backpack _unit != "") then { getText(configFile >> "CfgVehicles" >> (backpack _unit) >> "DisplayName")} else {"None"};
_isRebel = _ret select 4;
if (isNil {_isRebel}) then {_isRebel = false;};

_pattach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_pattach pushBack _tmp;
		};
	} foreach (primaryWeaponItems _unit);
};
if(count _pattach == 0) then {_pattach = "None"};

_sattach = [];
if(secondaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_sattach pushBack _tmp;
		};
	} foreach (secondaryWeaponItems _unit);
};
if(count _sattach == 0) then {_sattach = "None"};

//_playerxp_level = call life_fnc_getLevel;
//_playerxp_progress = round((call life_fnc_getXPProgress) * 100);

if(side _unit == civilian) then
{
	if (_isRebel) then
	{
		 _playerclass = "Rebel";
	}
	else
	{
		 _playerclass = "Civilian";
	};
	_text ctrlSetStructuredText parseText format["<a href='http://tanoa.roleplay.co.uk/getplayer.php?playerid=%14' color='#ff0000'>Stats Panel Page</a><br/>Name: %1<br/>Bank: %2<br/>Money: %3<br/>XP: %4 (+%5pc)<br/>Class: %6<br/>Uniform: %7<br/>Vest: %8<br/>Backpack: %9<br/>Primary: %10<br/>Secondary: %11<br/><t align='center'>Primary Attachments:</t><br/>%12<br/><t align='center'>Secondary Attachments:</t><br/>%13<br/>",_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText,[_ret select 5] call life_fnc_numberText,[_ret select 6] call life_fnc_numberText,_playerclass,_uni,_vest,_bp,_prim,_sec,_pattach,_sattach,getPlayerUID _unit];
}
else
{
	_text ctrlSetStructuredText parseText format["<a href='http://tanoa.roleplay.co.uk/getplayer.php?playerid=%13' color='#ff0000'>Stats Panel Page</a><br/>Name: %1<br/>Bank: %2<br/>Money: %3<br/>XP: %4 (+%5%)<br/>Uniform: %6<br/>Vest: %7<br/>Backpack: %8<br/>Primary: %9<br/>Secondary: %10<br/><t align='center'>Primary Attachments</t><br/>%11<br/><t align='center'>Secondary Attachments:</t><br/>%12<br/>",_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText,[_ret select 5] call life_fnc_numberText,[_ret select 6] call life_fnc_numberText,_uni,_vest,_bp,_prim,_sec,_pattach,_sattach,getPlayerUID _unit];
};
