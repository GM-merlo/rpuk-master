waitUntil {!isNil 'AH_AdminCheck'};
_compileFinal = {   
    private ["_var","_ns","_code","_arr"];
    _var = [_this,0,"",[""]] call BIS_fnc_param;
    _ns = [_this,1,missionNamespace,[missionNamespace]] call BIS_fnc_param;
    _code = _ns getVariable [_var, 0];
    if (typeName _code != typeName {}) exitWith {false};
    _arr = toArray str _code;
    _arr set [0,32];
    _arr set [count _arr - 1,32];
    _code = compileFinal toString _arr;
    _ns setVariable [_var, _code];
    true
};

AH_Menu_placeObject = {
	_player = _this select 0;
	if(_player call AH_AdminCheck) then {
		_params = _this select 1;
		_buildSelect = _params select 0;
		_subPos = _params select 1;
		_spawnType = _params select 2;
		_enableSim = _params select 3;

		_building = createVehicle [_buildSelect, _subPos, [], 0, _spawnType];
		_building setPosASL _subPos;
		_building enableSimulation _enableSim;
		_building setVariable ["lxIsSimEnable", _enableSim,true];
		lxObj = _building;
		(owner _player) publicVariableClient "lxObj";
	};
};
["AH_Menu_placeObject"] call _compileFinal;

AH_Menu_placeObjectWithDir = {
	_player = _this select 0;
	if(_player call AH_AdminCheck) then {
		_params = _this select 1;
		_buildSelect = _params select 0;
		_subPos = _params select 1;
		_spawnType = _params select 2;
		_enableSim = _params select 3;
		_pitch = _params select 4;
		_bank = _params select 5;
		_dir = _params select 6;

		_building = createVehicle [_buildSelect, _subPos, [], 0, _spawnType];
		_building setPosASL _subPos;
		_building enableSimulation _enableSim;
		_building setVariable ["lxIsSimEnable", _enableSim,true];
		_building setDir _dir;
		if (_pitch !=0 or _bank != 0) then {
			[_building, _pitch, _bank] call BIS_fnc_setPitchBank;
		};
		lxObj = _building;
		(owner _player) publicVariableClient "lxObj";
	};
};
["AH_Menu_placeObjectWithDir"] call _compileFinal;