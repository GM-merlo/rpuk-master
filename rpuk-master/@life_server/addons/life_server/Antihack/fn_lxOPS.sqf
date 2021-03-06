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

if (isServer and isDedicated) exitWith {};
waitUntil {player == player};
if(!(player call AH_AdminCheck)) exitWith {};
lxObj = objNull;
lxInd = false;
lxCurrObjList = [];
lxVehList = [];
lxIsSimEnable = true;
lxCanCollide = false;

Lx_fnc_newObject = {
	private ["_building"];
	_dlg = findDisplay 24350;

	_buildSelect = lbText [24357, lbCurSel 24357];

	_pos = screentoworld [0.5,0.5];

	_cam = missionnamespace getvariable ["BIS_fnc_camera_cam",objnull];
	_camPos = getposasl _cam;
	_isSubTarget = ((ATLtoASL _pos) select 2) < 0;
	_isSubCam = (_camPos select 2) < 0;
	_pitchbank = _cam call BIS_fnc_getPitchBank;

	_spawnType = "CAN_COLLIDE";
	_sys = lbCurSel 24359;
	_isASL = false;
	if (_sys == 1) then {
		_isASL = true;
	};

	if (_buildSelect in lxVehList) then {
		_spawnType = "NONE";
	};


	if (_isSubTarget ) then {
		if (_isSubCam) then {
			_subPos = [_camPos, getDir _cam, _pitchbank select 0] call lx_getSubGround;
			[[player,[_buildSelect,_subPos,_spawnType,false]],"AH_Menu_placeObject",false,false] spawn life_fnc_MP;
		} else {
			_surfPos = [_camPos, getDir _cam,  _pitchbank select 0] call lx_getSurface;
			[[player,[_buildSelect,_surfPos,_spawnType,false]],"AH_Menu_placeObject",false,false] spawn life_fnc_MP;
		};
	} else {
		_posASL = _pos;
		if (_isASL) then {
			_posASL = ATLtoASL _pos;
		};
		[[player,[_buildSelect,_posASL,_spawnType,false]],"AH_Menu_placeObject",false,false] spawn life_fnc_MP;
	};

	(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>New object created</t>";
	lxInd = true;
	(_dlg displayCtrl 24355) ctrlSetChecked true;
};
["Lx_fnc_newObject"] call _compileFinal;

Lx_fnc_supprObject = {
	_dlg = findDisplay 24350;
	if (!isNull lxObj) then {
		_buildSelect = typeOf lxObj;
		deleteVehicle lxObj;
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText format ["
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Object deleted : %1</t>", _buildSelect];
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Object deleted</t>";
		(_dlg displayCtrl 24355) ctrlSetChecked false;
		lxObj = objNull;
	} else {
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Can't delete object</t>";
	};
};
["Lx_fnc_supprObject"] call _compileFinal;

Lx_fnc_copyObject = {
	_type = _this select 0;
	_dlg = findDisplay 24350;
	if (!isNull lxObj) then {
		private ["_copiedTxt","_uiTxt"];
		_objType = typeOf lxObj;
		_spawnType = "CAN_COLLIDE";
		if (lxObj in lxVehList) then {_spawnType = "NONE";};
		_posATL = getPosATL lxObj;
		hint _test;
		_posASL = getPosASL lxObj;
		_dir = getDir lxObj;
		_pitchBank = lxObj call BIS_fnc_getPitchBank;
		_pitch = _pitchBank select 0;
		_bank = _pitchBank select 1;
		_index = lbCurSel 24361;

		_txtType = "Code copied to clipboard";
		if (_type == 1) then {
			_txtType = "Code copied to RPT";
		};

		switch _index do {
			case 0 : {
				if (lxIsSimEnable) then {
			_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosATL _pos;
", _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir];


			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosATL _pos;</t>",_txtType, _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir];
				} else {
			_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosATL _pos;
_object enableSimulation false;
", _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir];

			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosATL _pos;<br/>
_object enableSimulation false;</t>", _txtType, _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir];
				};
			};
			case 1 : {
				if (lxIsSimEnable) then {
				_copiedTxt =  format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosASL _pos;
", _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosASL _pos;</t>", _txtType, _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir];
				} else {
				_copiedTxt =  format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosASL _pos;
_object enableSimulation false;
", _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosASL _pos;<br/>
_object enableSimulation false;</t>",_txtType, _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir];
				};
			};
			case 2 : {
				if (lxIsSimEnable) then {
				_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosATL _pos;
[_object, %5, %6] call BIS_fnc_setPitchBank;
", _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosATL _pos;<br/>
[_object, %6, %7] call BIS_fnc_setPitchBank;</t>", _txtType,_posATL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
				} else {
				_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosATL _pos;
[_object, %5, %6] call BIS_fnc_setPitchBank;
_object enableSimulation false;
", _posATL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosATL _pos;<br/>
[_object, %6, %7] call BIS_fnc_setPitchBank;<br/>
_object enableSimulation false;</t>", _txtType,_posATL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
				};
			};
			case 3 : {
				if (lxIsSimEnable) then {
				_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosASL _pos;
[_object, %5, %6] call BIS_fnc_setPitchBank;
", _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosASL _pos;<br/>
[_object, %6, %7] call BIS_fnc_setPitchBank;</t>", _txtType, _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
				} else {
				_copiedTxt = format ["
_pos = [%1];
_object = createVehicle [""%2"", _pos, [], 0, ""%3""];
_object setDir %4;
_object setPosASL _pos;
[_object, %5, %6] call BIS_fnc_setPitchBank;
_object enableSimulation false;
", _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
			_uiTxt = parseText format ["<t size='1.2' align='center' color='#ffffff'>%1<br/><br/></t>
<t size='1' align='left' color='#ffffff'>_pos = [%2];<br/>
_object = createVehicle [""%3"", _pos, [], 0, ""%4""];<br/>
_object setDir %5;<br/>
_object setPosASL _pos;<br/>
[_object, %6, %7] call BIS_fnc_setPitchBank;<br/>
_object enableSimulation false;</t>", _txtType, _posASL call KK_fnc_positionToString, _objType, _spawnType, _dir, _pitch, _bank];
				};
			};
		};

		//if (_type == 0) then {
		//	copyToClipboard _copiedTxt;
		//} else {
 			diag_log _copiedTxt;
		//};

		(_dlg displayCtrl 24358) ctrlSetStructuredText _uiTxt;
	} else {
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Can't copy object</t>";

	};
};
["Lx_fnc_copyObject"] call _compileFinal;


Lx_fnc_changeObject = {
	_dlg = findDisplay 24350;
	if (!isNull lxObj) then {
		_ctrl = _dlg displayCtrl 24355;
		if (ctrlChecked _ctrl) then {
			if (!lxInd) then {
				_type = lbText [24357, lbCurSel 24357];

				_spawnType = "CAN_COLLIDE";
				_sys = lbCurSel 24359;
				_isASL = false;
				if (_sys == 1) then {
					_isASL = true;
				};

				if (_type in lxVehList) then {
					_spawnType = "NONE";
				};

				_pos = getPosASL lxObj;
				_dir = getDir lxObj;
				_posBef = _pos;
				_dirBef = _dir;
				_isSimEnable = lxObj getVariable "lxIsSimEnable";
				deleteVehicle lxObj;
				[[player,[_type,_pos,_spawnType,_isSimEnable]],"AH_Menu_placeObject",false,false] spawn life_fnc_MP;
			} else {
				lxInd = false;
			};
		};
	} else {
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
	};
};
["Lx_fnc_changeObject"] call _compileFinal;

Lx_fnc_lockObject = {
	_dlg = findDisplay 24350;
	_ctrl = _dlg displayCtrl 24355;

	if (ctrlChecked _ctrl) then {
		if (!lxInd) then {
			_building = missionnamespace getVariable ["BIS_fnc_camera_target", objNull];
			if (isNull _building) then {

				_pos = screentoworld [0.5,0.5];
				_cam = missionnamespace getvariable ["BIS_fnc_camera_cam",objnull];
				_camPos = getposasl _cam;
				_isSubTarget = ((ATLtoASL _pos) select 2) < 0;
				_isSubCam = (_camPos select 2) < 0;
				_pitchbank = _cam call BIS_fnc_getPitchBank;
				_pitch = _pitchbank select 0;
				_bank = _pitchbank select 1;

				if (_isSubTarget ) then {
					if (_isSubCam) then {
						_subPos = [_camPos, getDir _cam, _pitch] call lx_getSubGround;
						_objects = nearestObjects [_subPos, ["All"], 5];
						if (count _objects > 0) then {
							_object = _objects select (count _objects - 1);
							missionnamespace setvariable ["BIS_fnc_camera_target",_object];
							lxObj = _object;
							_var = lxObj getVariable "lxIsSimEnable";
							if (!isNil "_var") then {
								if (lxObj getVariable "lxIsSimEnable") then {
									lbSetCurSel [24362, 0];
								} else {
									lbSetCurSel [24362, 1];
								};
							} else {
								lxObj setVariable ["lxIsSimEnable", lxIsSimEnable];
								if (!lxIsSimEnable) then {
									lxObj enableSimulation false;
								};
							};
						} else {
							missionnamespace setvariable ["BIS_fnc_camera_target",objnull];
							_ctrl ctrlSetChecked false;
						};

					} else {
						_surfPos = [_camPos, getDir _cam, _pitch] call lx_getSurface;
						_objects = nearestObjects [_surfPos, ["All"], 5];
						if (count _objects > 0) then {
							_object = _objects select (count _objects - 1);
							missionnamespace setvariable ["BIS_fnc_camera_target",_object];
							lxObj = _object;
							_var = lxObj getVariable "lxIsSimEnable";
							if (!isNil "_var") then {
								if (lxObj getVariable "lxIsSimEnable") then {
									lbSetCurSel [24362, 0];
								} else {
									lbSetCurSel [24362, 1];
								};
							} else {
								lxObj setVariable ["lxIsSimEnable", lxIsSimEnable];
								if (!lxIsSimEnable) then {
									lxObj enableSimulation false;
								};
							};
						} else {
							missionnamespace setvariable ["BIS_fnc_camera_target",objnull];
							_ctrl ctrlSetChecked false;
						};
					};
				} else {
					_ctrl ctrlSetChecked false;
				};
			} else {
				lxObj = _building;
				_var = lxObj getVariable "lxIsSimEnable";
				if (!isNil "_var") then {
					if (lxObj getVariable "lxIsSimEnable") then {
						lbSetCurSel [24362, 0];
				} else {
						lbSetCurSel [24362, 1];
					};
				} else {
					lxObj setVariable ["lxIsSimEnable", lxIsSimEnable];
					if (!lxIsSimEnable) then {
						lxObj enableSimulation false;
					};
				};
			};
		};
	} else {
		lxObj = objNull;
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
	};

	if (!isNull lxObj) then {
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText format ["
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Object locked : %1</t>", typeOf lxObj];
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "";
		_idx = lxCurrObjList find (typeOf lxObj);
		if (_idx != -1) then {
			lxInd = true;
			lbSetCurSel [24357, _idx];
		};
	};
};
["Lx_fnc_lockObject"] call _compileFinal;

Lx_fnc_ResetObject = {
	if (!isNull lxObj) then {
		_index = lbCurSel 24360;
		switch _index do {
			case 0 : {
				lxObj setVectorUp [0,0,1];
				(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Reset object horizontality</t>";
			};
			case 1 : {
				lxObj setVectorUp (surfaceNormal [(getPos lxObj) select 0, (getPos lxObj) select 1]);
				(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Reset object normal surface</t>";
			};
			case 2 : {
				_posATL = getPosATL lxObj;
				_posATL set [2,0];
				lxObj setPosATL _posATL;
				(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Reset object terrain level</t>";
			};
			case 3 : {
				_posASL = getPosASL lxObj;
				_posASL set [2,0];
				lxObj setPosASL _posASL;
				(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Reset object sea level</t>";
			};
		};
	};
};
["Lx_fnc_ResetObject"] call _compileFinal;

Lx_fnc_translateObject = {

	_direction = _this select 0;
	if (!isNull lxObj) then {
		_index = lbCurSel 24352;
		private ["_inc"];
		switch _index do {
			case 0 : {
				_inc = 10;
			};
			case 1 : {
				_inc = 1;
			};
			case 2 : {
				_inc = 0.1;
			};
			case 3 : {
				_inc = 0.01;
			};
			case 4 : {
				_inc = 0.001;
			};
		};

		_pos = getPosASL lxObj;
		_px = _pos select 0;
		_py = _pos select 1;
		_pz = _pos select 2;
		switch _direction do {
			case 0 : {
				_py = _py + _inc;
			};
			case 1 : {
				_py = _py - _inc;
			};
			case 2 : {
				_px = _px + _inc;
			};
			case 3 : {
				_px = _px - _inc;
			};
			case 4 : {
				_pz = _pz + _inc;
			};
			case 5 : {
				_pz = _pz - _inc;
			};
		};
		_pos = [_px, _py, _pz];
		_dir = getDir lxObj;
		_type = typeOf lxObj;
		_pitchBank = lxObj call BIS_fnc_getPitchBank;
		_isSimEnable = lxObj getVariable "lxIsSimEnable";
		_pitch = _pitchBank select 0;
		_bank = _pitchBank select 1;
		deleteVehicle lxObj;
		[[player,[_type,_pos,"CAN_COLLIDE",_isSimEnable,_pitch,_bank,_dir]],"AH_Menu_placeObjectWithDir",false,false] spawn life_fnc_MP;
	} else {
		_dlg = findDisplay 24350;
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Can't translate object</t>";

	};
};
["Lx_fnc_translateObject"] call _compileFinal;

Lx_fnc_rotateObject = {

	_direction = _this select 0;

	if (!isNull lxObj) then {
		_index = lbCurSel 24353;
		private ["_inc"];
		switch _index do {
			case 0 : {
				_inc = 10;
			};
			case 1 : {
				_inc = 1;
			};
			case 2 : {
				_inc = 0.1;
			};
			case 3 : {
				_inc = 0.01;
			};
			case 4 : {
				_inc = 0.001;
			};
		};

		_pos = getPosASL lxObj;
		_dir = getDir lxObj;
		_type = typeOf lxObj;
		_pitchBank = lxObj call BIS_fnc_getPitchBank;
		_isSimEnable = lxObj getVariable "lxIsSimEnable";
		_pitch = _pitchBank select 0;
		_bank = _pitchBank select 1;
		switch _direction do {
			case 0 : {
				_dir = _dir - _inc;
			};
			case 1 : {
				_dir = _dir + _inc;
			};
			case 2 : {
				_pitch = _pitch - _inc;
			};
			case 3 : {
				_pitch = _pitch + _inc;
			};
			case 4 : {
				_bank = _bank - _inc;
			};
			case 5 : {
				_bank = _bank + _inc;
			};
		};

		deleteVehicle lxObj;
		[[player,[_type,_pos,"CAN_COLLIDE",_isSimEnable,_pitch,_bank,_dir]],"AH_Menu_placeObjectWithDir",false,false] spawn life_fnc_MP;

	} else {
		_dlg = findDisplay 24350;
		(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>No lock</t>";
		(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Can't rotate object</t>";
	};
};
["Lx_fnc_rotateObject"] call _compileFinal;

lxFilterObject = {
	_idx = 0;
	_objects = [];
	_index = lbCurSel 24354;
	switch _index do {
		case 0 : {
			for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
				_objCfg = (configFile >> "CfgVehicles") select _i;
				if (isClass(_objCfg)) then {
					if (getNumber (_objCfg >> "scope") > 0) then {
						_className = configName (_objCfg);
						if (_className isKindOf "Building") then {
							_objects set [_idx, _className];
							_idx = _idx + 1;
						};
					};
				};
			};
		};
		case 1 : {

			for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
				_objCfg = (configFile >> "CfgVehicles") select _i;
				if (isClass(_objCfg)) then {
					if (getNumber (_objCfg >> "scope") > 0) then {
						_className = configName (_objCfg);
						if (_className isKindOf "Car_F") then {
							_objects set [_idx, _className];
							_idx = _idx + 1;
						};
					};
				};
			};
		};
		case 2 : {
			for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
				_objCfg = (configFile >> "CfgVehicles") select _i;
				if (isClass(_objCfg)) then {
					if (getNumber (_objCfg >> "scope") > 0) then {
						_className = configName (_objCfg);
						if (_className isKindOf "Air") then {
							_objects set [_idx, _className];
							_idx = _idx + 1;
						};
					};
				};
			};
		};
		case 3 : {
			for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
				_objCfg = (configFile >> "CfgVehicles") select _i;
				if (isClass(_objCfg)) then {
					if (getNumber (_objCfg >> "scope") > 0) then {
						_className = configName (_objCfg);
						if (_className isKindOf "Ship_F") then {
							_objects set [_idx, _className];
							_idx = _idx + 1;
						};
					};
				};
			};
		};
		case 4 : {
			for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
				_objCfg = (configFile >> "CfgVehicles") select _i;
				if (isClass(_objCfg)) then {
					if (getNumber (_objCfg >> "scope") > 0) then {
						_objects set [_idx, configName (_objCfg)];
						_idx = _idx + 1;
					};
				};
			};
		};
	};

	_dlg = findDisplay 24350;
	_ctrl = _dlg displayCtrl 24357;

	lbClear 24357;
	{
		_index = _ctrl lbAdd _x;
	} forEach _objects;
	lxCurrObjList = _objects;
	(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "<t size='1.2' align='center' color='#ffffff'>Object list filtered</t>";
};
["lxFilterObject"] call _compileFinal;

lx_getSubGround = {
	_camPos = _this select 0;
	_camDir = _this select 1;
	_camPitch = _this select 2;
	_subGroundPos = ASLtoATL _camPos;
	if (_camPitch < 0) then {
		_r = 1;
		_subGroundPosT = _subGroundPos;
		while {_r > 0.01} do {
			_subGroundPosT set [0, (_subGroundPos select 0) + _r * sin (_camDir) * cos(_camPitch)];
			_subGroundPosT set [1, (_subGroundPos select 1) + _r * cos (_camDir) * cos(_camPitch)];
			_subGroundPosT set [2, (_subGroundPos select 2) + _r * sin(_camPitch)];
			if (_subGroundPosT select 2 < 0) then {
				_r = _r / 2;
			} else {
				_subGroundPos = _subGroundPosT;
			};
		};
	};
	_pos = ATLtoASL _subGroundPos;
	_pos
};
["lx_getSubGround"] call _compileFinal;

lx_getSurface = {
	_camPos = _this select 0;
	_camDir = _this select 1;
	_camPitch = _this select 2;
	_surfPos = _camPos;
	if (_camPitch < 0) then {
		_r = 1;
		_surfPosT = _surfPos;
		while {_r > 0.01} do {
			_surfPosT set [0, (_surfPos select 0) + _r * sin (_camDir) * cos(_camPitch)];
			_surfPosT set [1, (_surfPos select 1) + _r * cos (_camDir) * cos(_camPitch)];
			_surfPosT set [2, (_surfPos select 2) + _r * sin(_camPitch)];
			if (_surfPosT select 2 < 0) then {
				_r = _r / 2;
			} else {
				_surfPos = _surfPosT;
			};
		};
	};
	_surfPos
};
["lx_getSurface"] call _compileFinal;

lx_setObjSim = {

    _idx = lbCurSel 24362;
    if (_idx == 0) then {
			lxIsSimEnable = true;
	  	if (!isNull lxObj) then {
	  		lxObj enableSimulation true;
	  		lxObj setVariable ["lxIsSimEnable", true];
			(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
				<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Object simulation enabled</t>";
	  	};
    };

    if (_idx == 1) then {
    	lxIsSimEnable = false;
	  	if (!isNull lxObj) then {
	  		lxObj enableSimulation false;
	  		lxObj setVariable ["lxIsSimEnable", false];
			(_dlg displayCtrl 24351) ctrlSetStructuredText parseText "
				<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Object simulation disabled</t>";
	  	};
  	};
};
["lx_setObjSim"] call _compileFinal;

Lx_fnc_floatToString = {
	private "_arr";
	_arr = toArray str (_this % 1);
	_arr set [0, 'x'];
	_arr = _arr - ['x'];
	toString (toArray str (_this - _this % 1) + _arr)
};
["Lx_fnc_floatToString"] call _compileFinal;

KK_fnc_positionToString = {
	{ _this = if (_forEachIndex == 0 and _forEachIndex != 2) then [
		{_x call Lx_fnc_floatToString},
		{if (_forEachIndex ==1) then [{_this + "," + (_x call Lx_fnc_floatToString)},{_this + "," + (str _x)}]}];
	} forEach +_this;
	_this
};
["KK_fnc_positionToString"] call _compileFinal;



[] call BIS_fnc_camera;
createDialog "LxObjectPositioningSystem";
_dlg = findDisplay 24350;
_ctrl = _dlg displayCtrl 24351;
_ctrl ctrlSetStructuredText parseText "<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Lx Object Positioning System v1.31</t>";

_ctrl = _dlg displayCtrl 24352;
{
	_index = _ctrl lbAdd _x;
} forEach ["10m","1m","0.1m","0.01m","0.001m"];
lbSetCurSel [24352, 0];

_ctrl = _dlg displayCtrl 24353;
{
	_index = _ctrl lbAdd _x;
} forEach ["10°","1°","0.1°","0.01°","0.001°"];
lbSetCurSel [24353, 0];

_ctrl = _dlg displayCtrl 24354;
{
	_index = _ctrl lbAdd _x;
} forEach ["Building","Land vehicle","Air vehicle","Ship","All"];
lbSetCurSel [24354, 0];

_ctrl = _dlg displayCtrl 24359;
{
	_index = _ctrl lbAdd _x;
} forEach ["Above Sea Level","Above Terrain Level"];
lbSetCurSel [24359, 0];

_ctrl = _dlg displayCtrl 24360;
{
	_index = _ctrl lbAdd _x;
} forEach ["Reset horizontality","Reset surface normal","Reset ground level","Reset sea level"];
lbSetCurSel [24360, 0];

_ctrl = _dlg displayCtrl 24361;
{
	_index = _ctrl lbAdd _x;
} forEach ["ATL, Dir","ASL, Dir","ATL, Dir, Pitch, Bank","ASL, Dir, Pitch, Bank"];
lbSetCurSel [24361, 0];

_ctrl = _dlg displayCtrl 24362;
{
	_index = _ctrl lbAdd _x;
} forEach ["Enable object sim.","Disable object sim."];
lbSetCurSel [24362, 0];



_idx = 0;
for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
	_objCfg = (configFile >> "CfgVehicles") select _i;
	if (isClass(_objCfg)) then {
		if (getNumber (_objCfg >> "scope") > 0) then {
			_className = configName (_objCfg);
			if (_className isKindOf "Car_F" or _className isKindOf "Air") then {
				lxVehList set [_idx, _className];
				_idx = _idx + 1;
			};
		};
	};
};

[] spawn {
	_dlg = findDisplay 24350;
	while {dialog} do {
		if (!isNull lxObj) then {
			(_dlg displayCtrl 24351) ctrlSetStructuredText parseText format ["
	<t color='#ffffff' align = 'center' shadow = '1' shadowColor='#312f0d' size = '1.8' font='PuristaSemibold'>Object locked : %1</t>", typeOf lxObj];
			(_dlg displayCtrl 24358) ctrlSetStructuredText parseText "";
			_idx = lxCurrObjList find (typeOf lxObj);
			if (_idx != -1) then {
				lxInd = true;
				lbSetCurSel [24357, _idx];
			};
		};
	};
};