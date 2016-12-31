/*
	File: fn_openMedipad.sqf
	Author: Ciaran Langton
	Description: Opens the medical pad for a dead body.
*/
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_nameDead = _unit getVariable["name","Unknown"];
_name = _unit getVariable["realname","Unknown"];
_dead = false;
if(_nameDead != "Unknown") then {_name = _nameDead; _dead = true;};

if(player distance _unit > 5) exitWith {};
createDialog "life_medic_viewer";

_dialog = findDisplay 1000;
_title = _dialog displayCtrl 1001;
_nameCtrl = _dialog displayCtrl 1005;
_occupation = _dialog displayCtrl 1006;
_unconTimer = _dialog displayCtrl 1003;
_medilog = _dialog displayCtrl 1520;

_title ctrlSetText format["Observing Body Of: %1",_name];
_nameCtrl ctrlSetText format["Name: %1",_name];
_bodySide = side (group _unit);
_occupationText = switch (_bodySide) do
{
	case west: {"Police Officer"};
	case independent: {"NHS Doctor"};
	case civilian: {
		if(uniform _unit == "U_B_CombatUniform_mcam_worn") then {
			"Bountyhunter";
		} else {
			"Job Unknown";
		};
	};
};
_occupation ctrlSetText format["Occupation: %1",_occupationText];

_idcArr = [1202,1203,1204,1201];
_deadTime = _unit getVariable["medideadtime",serverTime];
_i = 1;
while {dialog && !isnull (findDisplay 1000)} do {
	if(_dead) then {
		_currentTime = serverTime - _deadTime;
		_countDown = [_currentTime,"MM:SS.MS"] call BIS_fnc_secondsToString;
		_unconTimer ctrlSetText format["Unconscious for: %1",_countDown];
	} else {
		_unconTimer ctrlSetText format["Not Unconscious"];
	};
	sleep 0.1;
	_i = _i + 0.1;
	//Every half a second refresh
	if(_i >= 0.5) then
	{
		_i = 0;
		lbClear _medilog;
		{
			_medilog lbAdd _x;
		} forEach (_unit getVariable["medilog",[]]);
		_dmgArr = [];
		_dmgArr set[0,_unit getHitPointDamage "hitHead"];
		_dmgArr set[1,_unit getHitPointDamage "hitBody"];
		_dmgArr set[2,_unit getHitPointDamage "hitLegs"];
		_dmgArr set[3,_unit getHitPointDamage "hitHands"];

		{
			_dmg = _x;
			_idc = _idcArr select _foreachindex;
			_idc = _dialog displayCtrl _idc;
			_idc ctrlSetTextColor [1,0,0,_dmg];
		} forEach _dmgArr;
	};
};