/* 
  File: fn_admininfo.sqf 
  Author: Bryan "Tonic" Boardwine 
 
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
  _text ctrlSetStructuredText parseText format["<a href='http://stats.altislife.co.uk/getplayer.php?playerid=%12' color='#ff0000'>Stats Panel Page</a><br/>Name: %1<br/>Bank: %2<br/>Money: %3<br/>Class: %4<br/>Uniform: %5<br/>Vest: %6<br/>Backpack: %7<br/>Primary: %8<br/>Handgun: %9<br/><t align='center'>Primary Attachments</t><br/>%10<br/><t align='center'>Secondary Attachments:</t><br/>%11<br/>",_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText,_playerclass,_uni,_vest,_bp,_prim,_sec,_pattach,_sattach,getPlayerUID _unit]; 
} 
else 
{ 
  _text ctrlSetStructuredText parseText format["<a href='http://stats.altislife.co.uk/getplayer.php?playerid=%11' color='#ff0000'>Stats Panel Page</a><br/>Name: %1<br/>Bank: %2<br/>Money: %3<br/>Uniform: %4<br/>Vest: %5<br/>Backpack: %6<br/>Primary: %7<br/>Handgun: %8<br/><t align='center'>Primary Attachments</t><br/>%9<br/><t align='center'>Secondary Attachments:</t><br/>%10<br/>",_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText,_uni,_vest,_bp,_prim,_sec,_pattach,_sattach,getPlayerUID _unit]; 
}; 
