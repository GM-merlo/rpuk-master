/*
	fn_copANPR_Radar.sqf
	@Version: 1.0
	@Author: TinyBigJacko (NDJ)
	@Edited: 25.Apr.2014
	
	Copyright (C) Roleplay.co.uk - All Rights Reserved
	Unauthorized copying of this file, via any medium is strictly prohibited 
	Proprietary and confidential.
	You may not distribute this file inside of any package without direct permissions from Roleplay.co.uk.
	P.S. If you are from AltisLifeRPG.com You can go back to AltisLifeRPG.com and take a nice look at the tutorials section and learn yourself...
*/ 
private ["_speed","_vehicle", "_targets", "_validtargets", "_data", "_owners", "_ownerschecked", "_targetveh", "_vehicleName"];
if((playerSide != west) OR  !(vehicle player != player)) exitWith {}; //if player not cop or not in vehicle, leave.
_vehicle = vehicle player;
if(isNull _vehicle) exitWith {};
if(!((typeOf _vehicle) in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","B_T_LSV_01_unarmed_F"])) exitWith {}; 
if(count (crew (_vehicle)) == 0) exitWith {};
if(!alive _vehicle) exitWith {};

[[player, "RadarBleeps",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;

_targets = nearestObjects [_vehicle, ["Car"], 50];
_validtargets = [];
{if (alive _x) then {_validtargets set [(count _validtargets),_x];};} foreach _targets;
//all alive (valid) targets are now in _validtargets array, with luck!

if(count _validtargets < 2) exitWith {hint parseText "<t color='#5882FA'><t size='2'>ANPR Target</t></t><br/><t color='#ff00ff'><t size='1'>Nothing in Range</t></t>"};

_targetveh = (_validtargets select 1); //take the 2nd item in the array - the first seems to be our own body or car(for some mad reason)

_speed = round speed (_targetveh);

_owners = _targetveh getVariable "vehicle_info_owners";

if(isNil {_owners}) then
{ 
	_data = "<t color='#ff0000'><t size='1'>NONE!<br/>(Bug/Cheat - Impound)</t></t><br/>";
}
else
{
	_return = "";
	if(count _owners < 1) then {
		_return = "NONE!<br/>(Vacant - Impound)";
	} else {
		{
			_format = "";
			if(count _X > 0) then
			{
				_format = "";
				_uid = _x select 0;
				//CL - Implement wanted list checker.
				if(!([_uid] call life_fnc_isUIDActive)) then {
					_format = format["(Offline) %1<br/>",_x select 1];
				} else {
					_unit = objNull;
					{if(getPlayerUID _x == _uid) then {_unit = _x;};} forEach playableUnits; //UID -> UNIT
					//If we could not find it then just print name
					if(isNull _unit) then {
						_format = format["%1<br/>",_x select 1];	
					} else {
						//If they have a bounty bigger than 0 (wanted) then add them to the list with a prefix!
						if((_unit getVariable ["life_crimes",[]]) select 1 > 0) then {
							_format = format["(WANTED) %1<br/>",_x select 1];		
						} else {
							//Not wanted
							_format = format["%1<br/>",_x select 1];		
						};
					};
				};
			};
			_return = _return + _format;
		} foreach _owners;
	};
	_data = format["<t color='#ffffff'><t size='1'>%1</t></t><br/>", _return];
};

_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _targetveh) >> "displayName");

_data = format["<t color='#5882FA'><t size='2'>ANPR Target</t></t><br/><t color='#ff00ff'><t size='1'>Type: %1</t></t><br/><t color='#ffffff'><t size='1.5'>Owner(s):</t></t><br/>%2<br/>", _vehicleName, _data];

//systemchat "ANPR owner lookup completed ok";

switch (true) do 
{
	case ((_speed > 50 && _speed <= 110)): 
	{	
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#FFFF00'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //amber
	};
	
	case ((_speed > 110)): 
	{	
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //red
	};
	
	default
	{
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#00FF00'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //green
	};
};

//systemchat "ANPR output complete - returning";

hint parseText _data;