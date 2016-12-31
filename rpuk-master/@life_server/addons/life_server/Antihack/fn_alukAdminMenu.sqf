/*
* @File:   fn_alukAdminMenu.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
private _randomNumberGenerator = {
	_var = "";
	_randomLength = random(80);
	if(_randomLength < 25) then {_randomLength = 40};
	_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	for "_i" from 0 to _randomLength do {
		_var = _var + (_letters call BIS_fnc_selectRandom);
	};
	ALUKAC_VARS pushBack _var;
	_var
};

private _randomNumberGeneratorWithPrefix = {
	_var = "AH_mp_";
	_randomLength = random(80);
	if(_randomLength < 25) then {_randomLength = 40};
	_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
	for "_i" from 0 to _randomLength do {
		_var = _var + (_letters call BIS_fnc_selectRandom);
	};
	_var
};

//NET FUNCTIONS
private _tppHere = call _randomNumberGeneratorWithPrefix; [format["_tppHere = %1",_tppHere],"ADMINMENU"] call console;
private _tpTo = call _randomNumberGeneratorWithPrefix; [format["_tpTo = %1",_tpTo],"ADMINMENU"] call console;
private _ivSp = call _randomNumberGeneratorWithPrefix; [format["_ivSp = %1",_ivSp],"ADMINMENU"] call console;
private _ivSpDetach = call _randomNumberGeneratorWithPrefix; [format["_ivSpDetach = %1",_ivSpDetach],"ADMINMENU"] call console;
private _kick = call _randomNumberGeneratorWithPrefix; [format["_kick = %1",_kick],"ADMINMENU"] call console;
private _input = call _randomNumberGeneratorWithPrefix; [format["_input = %1",_input],"ADMINMENU"] call console;
private _serverLog = call _randomNumberGeneratorWithPrefix; [format["_serverLog = %1",_serverLog],"ADMINMENU"] call console;
private _logList = call _randomNumberGenerator; [format["_logList = %1",_logList],"ADMINMENU"] call console;
private _requestLogs = call _randomNumberGeneratorWithPrefix; [format["_requestLogs = %1",_requestLogs],"ADMINMENU"] call console;
private _logReturn = call _randomNumberGenerator; [format["_logReturn = %1",_logReturn],"ADMINMENU"] call console;

//VARIABLES
private _adminListVar = call _randomNumberGenerator; [format["_adminListVar = %1",_adminListVar],"ADMINMENU"] call console;
private _nt = call _randomNumberGenerator; [format["_nt = %1",_nt],"ADMINMENU"] call console;
private _gm = call _randomNumberGenerator; [format["_gm = %1",_gm],"ADMINMENU"] call console;

//LOCAL FUNCTIONS
private _bind = call _randomNumberGenerator; [format["_bind = %1",_bind],"ADMINMENU"] call console;
private _viewLogs = call _randomNumberGenerator; [format["_viewLogs = %1",_viewLogs],"ADMINMENU"] call console;
private _ahInit = call _randomNumberGenerator; [format["_ahInit = %1",_ahInit],"ADMINMENU"] call console;
private _getObj = call _randomNumberGenerator; [format["_getObj = %1",_getObj],"ADMINMENU"] call console;
private _spectate = call _randomNumberGenerator; [format["_spectate = %1",_spectate],"ADMINMENU"] call console;
private _invispectate = call _randomNumberGenerator; [format["_invispectate = %1",_invispectate],"ADMINMENU"] call console;
private _target = call _randomNumberGenerator; [format["_target = %1",_target],"ADMINMENU"] call console;
private _carGod = call _randomNumberGenerator; [format["_carGod = %1",_carGod],"ADMINMENU"] call console;
private _dblClick = call _randomNumberGenerator; [format["_dblClick = %1",_dblClick],"ADMINMENU"] call console;
private _playerMarkers = call _randomNumberGenerator; [format["_playerMarkers = %1",_playerMarkers],"ADMINMENU"] call console;
private _vehMarkers = call _randomNumberGenerator; [format["_vehMarkers = %1",_vehMarkers],"ADMINMENU"] call console;
private _esp = call _randomNumberGenerator; [format["_esp = %1",_esp],"ADMINMENU"] call console;
private _tp = call _randomNumberGenerator; [format["_tp = %1",_tp],"ADMINMENU"] call console;
private _ahMP = call _randomNumberGenerator; [format["_ahMP = %1",_ahMP],"ADMINMENU"] call console;

private _admins = getArray(configFile >> "alukac_anticheatcfg" >> "admins");
private _openMenu = getText(configFile >> "alukac_anticheatcfg" >> "openMenuAction");

call compile ('
_toCompilableString = {
	_code = _this select 0;
	_string = "";
	if(typename _code == "CODE") then {
		_string = str(_code);
		_arr = toArray(_string);
		_arr set[0,32];
		_arr set[count(_arr)-1,32];
		_string = toString(_arr);
	};
	_string;
};
ALUKAC_fnc_adminCode = {
	' + _adminListVar + ' = compileFinal (''' + str(_admins) + ''');
	if(!isDedicated && hasInterface) then {
		waitUntil {player == vehicle player && getPlayerUID player != ""};
	};

	_toCompilableString = {
		_code = _this select 0;
		_string = "";
		if(typename _code == "CODE") then {
			_string = str(_code);
			_arr = toArray(_string);
			_arr set[0,32];
			_arr set[count(_arr)-1,32];
			_string = toString(_arr);
		};
		_string;
	};
	AH_AdminCheck = {
		_object = _this;
		_isAdmin = ({_x select 0 == getPlayerUID _object} count (call ' + _adminListVar + ') > 0);
		_isAdmin;
	};
	AH_AdminCheck = compileFinal ([AH_AdminCheck] call _toCompilableString);

	AH_AdminName = {
		_object = _this;
		_name = "Unknown Admin";
		_pid = getPlayerUID _object;
		{if(_pid == _x select 0) exitWith {_name = _x select 1;}} forEach (call ' + _adminListVar + ');
		_name;
	};
	AH_AdminName = compileFinal ([AH_AdminName] call _toCompilableString);

	AH_AdminRank = {
		_object = _this;
		_rank = 0;
		_pid = getPlayerUID _object;
		{if(_pid == _x select 0) exitWith {_rank = _x select 2;}} forEach (call ' + _adminListVar + ');
		_rank;
	};
	AH_AdminRank = compileFinal ([AH_AdminRank] call _toCompilableString);

	if(!hasInterface && !isServer) exitWith {};

	if(isNil "' + _ahMP + '") then {
		' + _ahMP + ' = compileFinal ([life_fnc_MP] call _toCompilableString);
	};
	if(isServer) then {
		AH_mp_DoTP = {
			_pos = _this select 1;
			_object = _this select 0;

			if(_object call AH_AdminCheck) then {
				vehicle _object setpos _pos;
				if((_object call AH_AdminRank) < 3) then {
					format["%1 has teleported to %2",_object call AH_AdminName,_pos] call ' + _serverLog + ';
				};
			};
		};
		' + _tppHere + ' = {
			_object = _this select 0;
			_target = _this select 1;
			if(_object call AH_AdminCheck) then {
				_pos = getposatl _object;
				if (_target isEqualTo _object) exitWith {hint "You can''t TP yourself to yourself! Derp!";};
				_target setposatl _pos;
				if((_object call AH_AdminRank) < 3) then {
					format["%1 has teleported %2 to his/her position!",_object call AH_AdminName ,name _target] call ' + _serverLog + ';
				};
				[1,"Player has been teleported to you!"] remoteExecCall ["life_fnc_broadcast", _object];
			};
		};
		' + _tpTo + ' = {
			_object = _this select 0;
			_target = _this select 1;
			if(_object call AH_AdminCheck) then {
				if (_target isEqualTo _object) exitWith {hint "You can''t TP yourself to yourself! Derp!";};
				_pos = getposatl _target;
				_object setposatl _pos;
				if((_object call AH_AdminRank) < 3) then {
					format["%1 teleported to %2!",_object call AH_AdminName ,name _target] call ' + _serverLog + ';
				};
				[1,"Teleported to player!"] remoteExecCall ["life_fnc_broadcast", _object];
			};
		};
		' + _ivSp + ' = {
			_object = _this select 0;
			_target = _this select 1;
			if(_object call AH_AdminCheck) then {
				_object forceAddUniform "U_VirtualMan_F";
				_pos = getposatl _target;
				_object setposatl _pos;
				_object attachTo [_target,[0,0,0]];
				if((_object call AH_AdminRank) < 3) then {
					format["%1 invisibly-spectated %2!",_object call AH_AdminName ,name _target] call ' + _serverLog + ';
				};
				[1,format["I-speccing player: %1", name _target]] remoteExecCall ["life_fnc_broadcast", _object];
			};
		};
		' + _ivSpDetach + ' = {
			_object = _this select 0;
			_target = _this select 1;
			if(_object call AH_AdminCheck) then {
				detach _object;
				if((_object call AH_AdminRank) < 3) then {
					format["%1 stopped invisibly-spectating %2!",_object call AH_AdminName ,name _target] call ' + _serverLog + ';
				};
				[1,format["Stopped I-speccing player: %1", name _target]] remoteExecCall ["life_fnc_broadcast", _object];
			};
		};
		' + _kick + ' = {
			_sender = _this select 0;
			_receiver = _this select 1;
			if(_sender call AH_AdminCheck) then {
				if (_sender isEqualTo _receiver) exitWith {hint "You can''t kick yourself! (But maybe you should..) Derp!";};
				format["%1 has kicked %2",_object call AH_AdminName,name _receiver] call ' + _serverLog + ';
				{endMission "FAIL";} remoteExecCall ["BIS_fnc_call", _receiver];
				[1,format["Kicked player %1 to lobby!", name _receiver]] remoteExecCall ["life_fnc_broadcast", _object];
			};
		};
		' + _input + ' = {
			_sender = _this select 0;
			_receiver = _this select 1;
			_allow = _this select 2;
			if(_sender call AH_AdminCheck) then {
				if (_sender isEqualTo _receiver) exitWith {hint "You really don''t want to mess with your own input. Derp!";};
				format["%1 has set %2''s input to %3",_object call AH_AdminName,name _receiver,_allow] call ' + _serverLog + ';
				if(_allow) then {
					{disableUserInput false;} remoteExecCall ["BIS_fnc_call", _receiver];
					[1, "Enabled target''s input."] remoteExecCall ["life_fnc_broadcast", _object];
				} else {
					{disableUserInput true;} remoteExecCall ["BIS_fnc_call", _receiver];
					[1, "Disabled target''s input."] remoteExecCall ["life_fnc_broadcast", _object];
				};
			};
		};
		' + _serverLog + ' = {
			_message = _this;
			[_message,"ADMINMENU"] call console;
			_message = format["<%1>: %2",serverTime,_message];
			' + _logList + ' pushBack _message;
		};
		' + _requestLogs + ' = {
			_object = _this;
			_owner = owner _object;
			if(_object call AH_AdminCheck) then {
				'+ _logReturn + ' = ' + _logList + ';
				_owner publicVariableClient "' + _logReturn +'";
			};
		};
		' + _logList + ' = [];
		[] spawn {
			_' + _logList + '_backUp = ' + _logList + ';
			while{true} do {
				waitUntil{count(' + _logList + ') != count(_' + _logList + '_backUp)};
				if(count(' + _logList + ') > count(_' + _logList + '_backUp)) then {
					_' + _logList + '_backUp = ' + _logList + ';
				} else {
					' + _logList + ' = _' + _logList + '_backUp;
				};
			};
		};
		AH_mp_DoTP = compileFinal ([AH_mp_DoTP] call _toCompilableString);
		' + _tppHere + ' = compileFinal ([' + _tppHere + '] call _toCompilableString);
		' + _tpTo + ' = compileFinal ([' + _tpTo + '] call _toCompilableString);
		' + _ivSp + ' = compileFinal ([' + _ivSp + '] call _toCompilableString);
		' + _ivSpDetach + ' = compileFinal ([' + _ivSpDetach + '] call _toCompilableString);
		' + _kick + ' = compileFinal ([' + _kick + '] call _toCompilableString);
		' + _input + ' = compileFinal ([' + _input + '] call _toCompilableString);
		' + _serverLog + ' = compileFinal ([' + _serverLog + '] call _toCompilableString);
		' + _requestLogs + ' = compileFinal ([' + _requestLogs + '] call _toCompilableString);
	};







	if(!isDedicated) then {
		if(player call AH_AdminCheck) then {
			' + _nt + ' = false;
			' + _gm + ' = false;
			if(player call AH_AdminRank < 3) then {
				[format["The admin ''%1'' has joined!",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
			};
			if(isNil "' + _ahInit + '") then {
				[] spawn {
					while{true} do {
						sleep 10;
						if(!isNil "' + _bind + '") then {(findDisplay 46) displayRemoveEventHandler["KeyDown",' + _bind + '];};
						' + _bind + ' = (findDisplay 46) displayAddEventHandler ["KeyDown",{if(((_this select 1) == 61) && (_this select 2)) then {[] spawn ' + _viewLogs + ';};if(((_this select 1) == 59) && (_this select 2)) then {if( (cursorTarget iskindof "Air" ) || (cursorTarget isKindOf "WeaponHolderSimulated") || (cursorTarget iskindof "Tank") || (cursorTarget isKindOf "Land") || (cursorTarget isKindOf "GroundWeaponHolder") || (cursorTarget isKindOf "Ship")) then {deleteVehicle cursorTarget;} else {hint "Cannot Delete Target.";};};if(((_this select 1) == 60) && (_this select 2)) then {cursorTarget setDamage 0;cursorTarget setFuel 1;cursorTarget setVectorUp (surfaceNormal (getpos cursorTarget));};false}];
					};
				};
				[] spawn {
					while{true} do {
						if !(player call AH_AdminCheck) exitWith {};
						waitUntil{inputAction "' + _openMenu + '" > 0};
						call ' + _ahInit + ';
						waitUntil{inputAction "' + _openMenu + '" == 0};
					};
				};
			};
			' + _viewLogs + ' = {
				[player,"' + _requestLogs + '",false,false] call ' + _ahMP + ';
				waitUntil{!isNil "' + _logReturn + '"};
				_logs = ' + _logReturn + ';
				' + _logReturn + ' = nil;
				createDialog "RscDisplayChooseEditorLayout";
				disableSerialization;
				ctrlSetText[1000,"AltisLife.Co.Uk''s Admin Menu - View Server Logs"];
				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Close";
				_ctrl ctrlCommit 0;
				_ctrl = (findDisplay 164) displayctrl 101;
				_c = 0;
				{
					_c = _c + 1;
					_ctrl lbAdd format["LOG #%1",_c];
					_ctrl lbSetData [(lbSize _ctrl)-1,_x];
				} forEach _logs;
				_ctrl ctrlAddEventHandler ["LbSelChanged",{
					_index = _this select 1;
					_message = ([lbData[101,_index],":"] call BIS_fnc_splitString) select 1;
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText format["<t size=''0.7''>LOG: %1</t>",_message];
					_ctrl ctrlCommit 0;
				}];
				_ctrl ctrlCommit 0;
			};
			' + _ahInit + ' = {
				if(player call AH_AdminCheck) then {
					if(isNull (FindDisplay 163)) then {
						disableserialization;
						createDialog "RscDisplayControlSchemes";

						_ctrl = (findDisplay 163) displayctrl 1000;
						_ctrl ctrlSetText "Roleplay.Co.Uk''s Admin Menu";
						_ctrl ctrlSetFont "PuristaSemiBold";
						_ctrl ctrlCommit 0;

						_ctrl = (findDisplay 163) displayctrl 1;
						_ctrl buttonSetAction "createDialog ''RscDisplayDebugPublic''";
						_ctrl ctrlSetFont "PuristaSemiBold";
						_ctrl ctrlSetText "Debug Menu";
						_ctrl ctrlCommit 0;

						_ctrl = (findDisplay 163) displayCtrl 2;
						_ctrl buttonSetAction "[] spawn ' + _tp + '";
						_ctrl ctrlSetFont "PuristaSemiBold";
						_ctrl ctrlSetText "Teleport";
						_ctrl ctrlCommit 0;

						_ctrl = (findDisplay 163) displayctrl 101;
						_ctrl ctrlSetFont "PuristaSemiBold";
						_ctrl ctrlAddEventHandler ["LBDblClick",{(_this select 1) call ' + _dblClick + '}];
						_ctrl lbAdd "Kick A Player";
						_ctrl lbAdd "Spectate A Player";
						_ctrl lbAdd "Invisibly Spectate A Player";
						_ctrl lbAdd "Disable Input";
						_ctrl lbAdd "Enable Input";
						_ctrl lbAdd "Teleport A Player";
						_ctrl lbAdd "Teleport To Player";
						_ctrl lbAdd "God Mode";
						if(' + _gm + ') then {
							_ctrl lbSetColor [7,[0,1,0,1]];
						} else {
							_ctrl lbSetColor [7,[1,0,0,1]];
						};
						_ctrl lbAdd "Player Markers";
						if(life_adminmarkers) then {
							_ctrl lbSetColor [8,[0,1,0,1]];
						} else {
							_ctrl lbSetColor [8,[1,0,0,1]];
						};
						_ctrl lbAdd "Vehicle Markers";
						if(life_vehiclemarkers) then {
							_ctrl lbSetColor [9,[0,1,0,1]];
						} else {
							_ctrl lbSetColor [9,[1,0,0,1]];
						};
						_ctrl lbAdd "Show Name Tags";
						if(' + _nt + ') then {
							_ctrl lbSetColor [10,[0,1,0,1]];
						} else {
							_ctrl lbSetColor [10,[1,0,0,1]];
						};
					};
				};
			};
			' + _getObj + ' = {
				if !(player call AH_AdminCheck) exitWith {objnull};
				_name = _this;
				_obj = objnull;
				{
					if(name _x == _name) exitWith {
						_obj = _x;
					};
				} forEach allUnits;
				_obj;
			};
			' + _spectate + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				_target = _this;
				if (_target isEqualTo player) exitWith {hint "You can''t spectate yourself! Derp!";};
				_target switchCamera "INTERNAL";
				hint "PRESS F10 TO EXIT SPECTATOR MODE";
				AH_TEMPBIND = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler [''KeyDown'',AH_TEMPBIND];player switchCamera ''INTERNAL'';hint ''YOU HAVE EXITED SPECTATOR MODE!'';};false"];
			};


			' + _invispectate + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				_target = _this;
				if (_target isEqualTo player) exitWith {hint "You can''t i-spectate yourself! Derp!";};
				private _script = [] spawn life_fnc_stripDownPlayer;
				waitUntil {scriptDone _script};
				player forceAddUniform "U_VirtualMan_F";

				[[player,_target], call ' + _ivSp + ',false,false] call ' + _ahMP + ';

				_target switchCamera "INTERNAL";
				hint "PRESS F10 TO EXIT I-SPECTATOR MODE";
				AH_TEMPBIND = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler [''KeyDown'',AH_TEMPBIND];player switchCamera ''INTERNAL''; [[player,_target], call ' + _ivSpDetach + ',false,false] call ' + _ahMP + '; hint ''YOU HAVE EXITED I-SPECTATOR MODE!'';};false"];
			};







			' + _target + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				_script = _this;
				disableserialization;
				createDialog "RscDisplayChooseEditorLayout";
				ctrlSetText[1000,"AltisLife.Co.Uk''s Admin Menu - Select a target"];
				if(_script == 0) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Kick A Player</t><br/><t size=''0.9''>Select a target to kick from the server!</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Kick";
					_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call ' + _getObj + ')],''' + _kick + ''',false,false] call ' + _ahMP + '";
					_ctrl ctrlCommit 0;
				};
				if(_script == 1) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Spectate A Player</t><br/><t size=''0.9''>Select a target to spectate them!</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Spectate";
					_ctrl buttonSetAction "(lbText[101,lbCurSel 101] call ' + _getObj + ') spawn ' + _spectate + ';";
					_ctrl ctrlCommit 0;
				};
				if(_script == 2) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Invisibly Spectate A Player</t><br/><t size=''0.9''>Select a target to spectate them invisibly!</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "I-Spectate";
					_ctrl buttonSetAction "(lbText[101,lbCurSel 101] call ' + _getObj + ') spawn ' + _invispectate + ';";
					_ctrl ctrlCommit 0;
				};
				if(_script == 3) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Disable Input</t><br/><t size=''0.9''>Select a target to disable their input!</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Disable Input";
					_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call ' + _getObj + '),false],''' + _input + ''',false,false] call ' + _ahMP + '";
					_ctrl ctrlCommit 0;
				};
				if(_script == 4) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Enable Input</t><br/><t size=''0.9''>Select a target to enable their input!</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Enable Input";
					_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call ' + _getObj + '),true],''' + _input + ''',false,false] call ' + _ahMP + '";
					_ctrl ctrlCommit 0;
				};
				if(_script == 5) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Teleport A Player Here</t><br/><t size=''0.9''>Select a target to teleport them to your position.</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Teleport Him";
					_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call ' + _getObj + '),true],''' + _tppHere + ''',false,false] call ' + _ahMP + '";
					_ctrl ctrlCommit 0;
				};
				if(_script == 6) then {
					_ctrl = (findDisplay 164) displayctrl 1100;
					_ctrl ctrlSetStructuredText parseText "<t size=''1.1''>Teleport To A Player</t><br/><t size=''0.9''>Select a target to teleport you to their position.</t>";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 164) displayctrl 1;
					_ctrl ctrlSetText "Teleport To";
					_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call ' + _getObj + '),true],''' + _tpTo + ''',false,false] call ' + _ahMP + '";
					_ctrl ctrlCommit 0;
				};

				_ctrl = (findDisplay 164) displayctrl 101;
				{
					if(alive _x && isplayer _x) then {
						_ctrl lbadd (name _x);
					};
				} forEach allUnits;
				lbSort _ctrl;
				_ctrl ctrlCommit 0;
			};
			' + _dblClick + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				_index = _this;
				switch(_index) do {
					case 0: {0 spawn ' + _target + ';};
					case 1: {1 spawn ' + _target + ';};
					case 2: {2 spawn ' + _target + ';};
					case 3: {3 spawn ' + _target + ';};
					case 4: {4 spawn ' + _target + ';};
					case 5: {5 spawn ' + _target + ';};
					case 6: {6 spawn ' + _target + ';};
					case 7: {if(player call AH_AdminCheck) then {' + _gm + ' = !' + _gm + '; if(' + _gm + ') then {lbSetColor[101,7,[0,1,0,1]];player allowDamage false;[] spawn ' + _carGod + ';hint "God Mode ON";} else {lbSetColor[101,7,[1,0,0,1]];player allowDamage true;[] spawn ' + _carGod + ';hint "God Mode OFF";};};};
					case 8: {[] spawn ' + _playerMarkers + ';};
					case 9: {[] spawn ' + _vehMarkers + ';};
					case 10: {call ' + _esp + ';};
				};
			};
			' + _carGod + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				if(' + _gm + ') then {
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has enabled God Mode",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					while{' + _gm + '} do {
						_oldVeh = vehicle player;
						_oldVeh allowDamage false;
						_oldVeh setFuel 1;
						_oldVeh setDamage 0;
						waitUntil{_oldVeh != (vehicle player)};
						if(_oldVeh != player) then {
							_oldVeh allowDamage true;
							_oldVeh = vehicle player;
						};
					};
				} else {
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has disabled God Mode",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					if(vehicle player != player) then {
						vehicle player allowDamage true;
					};
				};
			};
			' + _playerMarkers + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				life_adminmarkers = !life_adminmarkers;
				if(life_adminmarkers) then {
					lbSetColor[101,8,[0,1,0,1]];
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has enabled Player Markers",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
				} else {
					lbSetColor[101,8,[1,0,0,1]];
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has disabled Player Markers",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
				};
			};
			' + _vehMarkers + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				life_vehiclemarkers = !life_vehiclemarkers;
				if(life_vehiclemarkers) then {
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has enabled Vehicle Markers",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					lbSetColor[101,9,[0,1,0,1]];
				} else {
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has disabled Vehicle Markers",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					lbSetColor[101,9,[1,0,0,1]];
				};
			};
			' + _esp + ' = {
				if !(player call AH_AdminCheck) exitWith {};
				' + _nt + ' = !' + _nt + ';
				if(' + _nt + ') then {
					lbSetColor[101,10,[0,1,0,1]];
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has enabled ESP Name Tags",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					addMissionEventHandler["Draw3D", {
						{
							if((isPlayer _x) && ((side _x) == (side player)) && ((player distance _x) < 700)) then {
								_pos = getposatl _x;
								_eyepos = ASLtoATL eyepos _x;
								if((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then {
									_eyepos = eyepos _x;
									_pos = getposasl _x;
								};
								_1 = _x modelToWorld [-0.5,0,0];
								_2 = _x modelToWorld [0.5,0,0];
								_3 = _x modelToWorld [-0.5,0,0];
								_4 = _x modelToWorld [0.5,0,0];
								_1 set [2,_pos select 2];
								_2 set [2,_pos select 2];
								_3 set [2,(_eyepos select 2)+0.25];
								_4 set [2,(_eyepos select 2)+0.25];
								_HP = (damage _x - 1) * -100;
								_fontsize = 0.02;
								_eyepos set [2,(_3 select 2) - 0.1];
								drawIcon3D["",[0,1,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,''EtelkaNarrowMediumPro''];
								drawLine3D[_1,_2,[0,1,0,1]];
								drawLine3D[_2,_4,[0,1,0,1]];
								drawLine3D[_4,_3,[0,1,0,1]];
								drawLine3D[_3,_1,[0,1,0,1]];
							};
							if((isPlayer _x) && ((side _x) != (side player)) && ((player distance _x) < 1400)) then {
								_pos = getposatl _x;
								_eyepos = ASLtoATL eyepos _x;
								_1 = _x modelToWorld [-0.5,0,0];
								_2 = _x modelToWorld [0.5,0,0];
								_3 = _x modelToWorld [-0.5,0,0];
								_4 = _x modelToWorld [0.5,0,0];
								_1 set [2,_pos select 2];
								_2 set [2,_pos select 2];
								_3 set [2,(_eyepos select 2)+0.25];
								_4 set [2,(_eyepos select 2)+0.25];
								_HP = (damage _x - 1) * -100;
								_fontsize = 0.02;
								_eyepos set [2,(_3 select 2) - 0.1];
								drawIcon3D["",[1,0,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,''EtelkaNarrowMediumPro''];
								drawLine3D[_1,_2,[1,0,0,1]];
								drawLine3D[_2,_4,[1,0,0,1]];
								drawLine3D[_4,_3,[1,0,0,1]];
								drawLine3D[_3,_1,[1,0,0,1]];
							};
						} forEach allUnits;
					}];
					hint "Name Tags ON";
				} else {
					if(player call AH_AdminRank < 3) then {
						[format["''%1'' has disabled ESP Name Tags",player call AH_AdminName],"' + _serverLog + '",false,false] call ' + _ahMP + ';
					};
					hint "Name Tags OFF";
					removeAllMissionEventHandlers "Draw3D";
					lbSetColor[101,10,[1,0,0,1]];
				};
			};
			' + _tp + ' = {
				if(player call AH_AdminCheck) then {
					if !("ItemMap" in assigneditems player) then {
						if !("ItemMap" in items player) then {
							player addItem "ItemMap";
						};
						player assignItem "ItemMap";
					};
					openMap[true,false];
					[false] spawn life_fnc_handleMapMarkers;
					onMapSingleClick ''[[player,_pos],"AH_mp_DoTP",false,false] call life_fnc_MP;openMap[false,false];onMapSingleClick "_cat = true;";false'';
				};
			};
			' + _tp + ' = compileFinal ([' + _tp + '] call _toCompilableString);
			' + _esp + ' = compileFinal ([' + _esp + '] call _toCompilableString);
			' + _carGod + ' = compileFinal ([' + _carGod + '] call _toCompilableString);
			' + _vehMarkers + ' = compileFinal ([' + _vehMarkers + '] call _toCompilableString);
			' + _playerMarkers + ' = compileFinal ([' + _playerMarkers + '] call _toCompilableString);
			' + _dblClick + ' = compileFinal ([' + _dblClick + '] call _toCompilableString);
			' + _target + ' = compileFinal ([' + _target + '] call _toCompilableString);
			' + _spectate + ' = compileFinal ([' + _spectate + '] call _toCompilableString);
			' + _invispectate + ' = compileFinal ([' + _invispectate + '] call _toCompilableString);
			' + _getObj + ' = compileFinal ([' + _getObj + '] call _toCompilableString);
			' + _ahInit + ' = compileFinal ([' + _ahInit + '] call _toCompilableString);
			' + _viewLogs + ' = compileFinal ([' + _viewLogs + '] call _toCompilableString);
			hint parseText format["Press ''%1'' to open the admin menu!<br/>Press Shift+F1 to delete objects,<br/>Shift+F2 to repair objects<br/>and Shift+F3 to open the log menu.",(actionKeysNames ["' + _openMenu + '",1])];
		};
	};
};
ALUKAC_fnc_adminCode = compileFinal ([ALUKAC_fnc_adminCode] call _toCompilableString);

[] spawn ALUKAC_fnc_adminCode;
');
