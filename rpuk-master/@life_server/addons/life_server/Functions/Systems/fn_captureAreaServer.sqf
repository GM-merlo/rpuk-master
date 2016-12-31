/*
	Name: fn_captureAreaServer.sqf
	Author: Ciaran Langton
	
	Description:
	Runs the serverside for capturing zones.
*/
hint "Capture area loaded.";
waitUntil {!isNil 'life_config_gangArea'};
waitUntil {!isNil 'life_fnc_broadcast'};
["GangZones: Gang Zone System Starting","SYSLOG"] call console;


//First, setup the markers.


{
	_x params [
		["_areaID",0,[0]],
		["_mapMarker","",[""]],
		["_areaName","Error: Gang Hideout Error",[""]],
		["_currentGang",grpNull,[grpNull]],
		["_currentCapture",0,[0]],
		["_currentCaptureGroup",grpNull,[grpNull]],
		["_textMarker","",[""]]
	];
	_gangName = _currentGang getVariable["gang_name","Police"];

	if(_gangName == "Police") then {
		_mapMarker setMarkerColor "ColorBlue";
		_textMarker setMarkerColor "ColorBlue";
	} else {
		_mapMarker setMarkerColor "ColorRed";
		_textMarker setMarkerColor "ColorRed";
	};
	_mrkName = format["%1: Controlled By %2",_areaName,_gangName];
	_textMarker setMarkerText _mrkName;

} forEach life_config_gangArea;


for "_i" from 0 to 1 step 0 do
{
	{
		_x spawn {
			params [
				["_areaID",0,[0]],
				["_mapMarker","",[""]],
				["_areaName","Error: Gang Hideout Error",[""]],
				["_currentGang",grpNull,[grpNull]],
				["_currentCapture",0,[0]],
				["_currentCaptureGroup",grpNull,[grpNull]],
				["_textMarker","",[""]]
			];
			_gangName = _currentGang getVariable["gang_name","Police"];

			if(_gangName == "Police") then {
				_mapMarker setMarkerColor "ColorBlue";
				_textMarker setMarkerColor "ColorBlue";
			} else {
				_mapMarker setMarkerColor "ColorRed";
				_textMarker setMarkerColor "ColorRed";
			};
			_mrkName = format["%1: Controlled By %2",_areaName,_gangName];
			_textMarker setMarkerText _mrkName;


			_markerSize = markerSize _mapMarker;
			if(_markerSize select 1 > _markerSize select 0) then {_markerSize = _markerSize select 1;} else {_markerSize = _markerSize select 0;};
			
			_nearPlayers = nearestObjects[(getMarkerPos _mapMarker),["Man"],_markerSize];
			_cancelIteration = false;
			if({alive _x && isPlayer _x && vehicle _x == _x} count _nearPlayers < 1) then {_cancelIteration = true;};
			if(!(_cancelIteration)) then
			{
				_gangCount = 0;
				_police = false;
				_alreadyKnow = [];
				{
					if(alive _x && isPlayer _x && vehicle _x == _x && _x getVariable["incapture",false]) then {
						if((group _x) getVariable["gang_name",""] != "" && side _x == civilian) then 
						{
							if(!(group _x in _alreadyKnow)) then {_alreadyKnow pushBack (group _x); _gangCount = _gangCount + 1;}; 
						};
						if(side _x == west) then {
							if(!(group _x in _alreadyKnow)) then {_alreadyKnow pushBack (group _x); _gangCount = _gangCount + 1; _police = true;};
						};
					};
				} forEach _nearPlayers;
		
				_text = [];
				_text pushBack "<t size='2' align='center' color='#FF0000'>Gang Capture</t><br/><br/>";
				_text pushBack format["<t align='center'>Capture Update for %1</t>",_areaName];
				_text pushBack "<br/>";
				if(_gangCount > 1) then {
					_text pushBack "<t align='center'>The Capture Zone is being Challenged by:</t><br/>";
					_list = [];
					{_list pushBack (_x getVariable ["gang_name","Police"]);} forEach _alreadyKnow;
					_str = "";
					{_str = _str + format["%1, ",_x];} forEach _list;
					_text pushBack _str;
				} else {
					_text pushBack "<t align='center'>The Capture Zone is currently not being challenged.</t><br/>";
				};

				if(_gangCount == 1) then {
					if(!isNull _currentGang && (side _currentGang != west)) then
					{
						[[3,format["<t size='2' align='center' color='#FF0000'>Hideout Being Captured</t><br/><br/>A area that you control (%1) is being captured by another gang!",_areaName]],"life_fnc_broadcast",_currentGang,false] spawn life_fnc_MP;
					};
					if(isNull _currentGang && (_currentGang != (_alreadyKnow select 0))) then
					{
						[[3,format["<t size='2' align='center' color='#FF0000'>Hideout Being Captured</t><br/><br/>A area that you control (%1) is being captured by a rebel gang!",_areaName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};

					if(side (_alreadyKnow select 0) == west) then {
						_array = _x;
						if(!isNull _currentGang && {isNull _currentCaptureGroup} && ({_currentCapture > 100})) then {
							_array set [3,grpNull];
							_array set [5,grpNull];
							_array set [4,0];
							_name = _currentCaptureGroup getVariable["gang_name","Police"];
							[[4,"<t size='2' align='center' color='#FF0000'>Hideout Captured</t><br/><br/>%1 is now controlled by the Police!",_areaName,_name],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
						};
						if(!isNull _currentGang && {isNull _currentCaptureGroup} && {_currentCapture < 101}) then {
							_currentCapture = _currentCapture + round(({side (group _x) == west} count _nearPlayers)*4);
							if(_currentCapture > 100) then {_currentCapture = 100;};
							_array set [4,_currentCapture];
						};
						if(!isNull _currentCaptureGroup) then {
							_array set [4,1];
							_array set [5,grpNull];
						};
					} else {
						if(isNull _currentGang || {!(_currentGang in _alreadyKnow)}) then {
							_array = _x;
							if(!isNull _currentCaptureGroup && {(_currentCaptureGroup == _alreadyKnow select 0)} && {_currentCapture >= 100}) then {
								_array set [3,_currentCaptureGroup];
								_array set [5,grpNull];
								_array set [4,0];
								_name = _currentCaptureGroup getVariable["gang_name","Police"];
								[[4,"<t size='2' align='center' color='#FF0000'>Hideout Captured</t><br/><br/>%1 is now controlled by %2!",_areaName,_name],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
							};
							if(!isNull _currentCaptureGroup && ({(_currentCaptureGroup == _alreadyKnow select 0)}) && ({_currentCapture < 100})) then {
								_currentCapture = _currentCapture + round(({group _x == _currentCaptureGroup} count _nearPlayers)*2);
								if(_currentCapture > 100) then {_currentCapture = 100;};
								_array set [4,_currentCapture];
							};
							if(!isNull _currentCaptureGroup && {_currentCaptureGroup != _alreadyKnow select 0}) then {
								_array set [4,0];
								_array set [5,_alreadyKnow select 0];
							};
							if(isNull _currentCaptureGroup) then {
								_array set [4,0];
								_array set [5,_alreadyKnow select 0];
							};
						};
					};
				};

				if(_police) then {_text pushBack "<br/>The Police Are on the Scene!";};
				_final = "";
				{_final = _final + _x} forEach _text;
				{[4,_final] remoteExecCall ["life_fnc_broadcast",_x];} forEach _alreadyKnow;
			};

			publicVariable "life_config_gangArea";
			if(!isDedicated) then {
				if(!isNil 'life_capture_point' && {life_capture_point != -1}) then {[] call life_fnc_areaCaptureUpdate;};
			};
		};
		sleep 20;
	} forEach life_config_gangArea;
};