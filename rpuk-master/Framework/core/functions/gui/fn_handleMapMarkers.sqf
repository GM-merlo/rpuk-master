/*
	File: fn_handleMapMarkers.sqf

	Author: Ciaran Langton
	Date: 2015-01-13 16:40:19
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-06-03 22:16:59
*/
private["_markers","_units"];
disableSerialization;
_isGPS = _this select 0;
_display = displayNull;
_ctrl = 51;
if(_isGPS) then {
	_display = (uiNamespace getVariable "RscMiniMap");
	_ctrl = 101;
	waitUntil {visibleGPS};
} else {
	_display = findDisplay 12;
	_ctrl = 51;
	waitUntil {visibleMap};
};

_loop = [] spawn {
	while {visibleMap || visibleGPS} do
	{
		_playerSide = side (group player);
		_units = [];
		switch (_playerSide) do {
			case west: {
				{
					if(side (group _x) == west && (("ItemGPS" in assignedItems _x) || ("B_UavTerminal" in assignedItems _x))) then {
						_units pushBack [
							_x,
							_x getVariable["realname",name _x],
							[0,0,1,1],
							""
						];
					};
				} forEach playableUnits;

				{
					if(_x getVariable["side",sideUnknown] == west) then {
						_controller = (UAVControl _x) select 0;
						_controllerName = "";
						if(!isNull _controller) then {
							_controllerName = _controller getVariable ["realname", name _controller];
						};
						_units pushBack [
							_x,
							_controllerName,
							[0,0,1,1],
							""
						];
					};
				} forEach allUnitsUAV;

			};

			case independent: {
				{
					if(side (group _x) == independent && ("ItemGPS" in assignedItems _x)) then {
						_units pushBack [
							_x,
							_x getVariable["realname",name _x],
							[1,1,0,1],
							""
						];
					};
				} forEach playableUnits;

				{
					_name = _x getVariable "name";
					_down = _x getVariable ["Revive",false];

					if(!isNil "_name" && !_down) then {
						_units pushBack [
							_x,
							_name,
							[1,0,0,1],
							"\A3\ui_f\data\map\vehicleicons\pictureheal_ca.paa"
						];
					};
				} forEach allDeadMen;
			};

			case civilian: {
				{
					if("ItemGPS" in assignedItems _x) then {
						_units pushBack [
							_x,
							_x getVariable["realname",""],
							[0,1,0,1],
							""
						];
					};
				} forEach units (group player);
			};
		};

		if(player call AH_AdminCheck && life_adminmarkers) then {
			{
				if(!(_x in _units)) then {

					_color = [1,0,0,1];

					switch(side group _x) do
					{
						case west: {_color = [0,0,1,1];};
						case independent: {_color = [0,1,0,1];};
						case civilian: {_color = [0,0.7,0.7,1];};
					};

					_units pushBack [
						_x,
						_x getVariable["realname",""],
						_color,
						""
					];
				};
			} forEach playableUnits;
		};

		if(player call AH_AdminCheck && life_vehiclemarkers) then {
			{
				if((_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land") || (_x isKindOf "Ship")) then {
					if((count crew _x == 0 || !life_adminmarkers) && !(_x in _units)) then {
						_units pushBack [
							_x,
							"",
							[1,0,0,1],
							""
						];
					};
				};
			} forEach vehicles;
		};

		life_markers = _units;
		sleep 1.5;
	};
};

_id = _display displayCtrl _ctrl ctrlAddEventHandler ["Draw", {
	disableSerialization;
	{
		_unit = _x select 0;
		_name = _x select 1;
		_color = _x select 2;
		_type = _x select 3;
		_marker = "";

		_pos = position _unit;
		_dir = direction _unit;
		if(_type == "") then {
			//Show the driver.
			if(vehicle _unit != _unit && {driver (vehicle _unit) == _unit}) then {
				_icon = getText(configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "icon");
				_vehName = getText(configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "displayName");
				_name = format["%1: %2",_vehName,_name];
				_marker = _icon call BIS_fnc_textureVehicleIcon;
				_pos = position (vehicle _unit);
				_dir = direction (vehicle _unit);
			} else {
				if(_unit in allUnitsUAV) then {
					_icon = getText(configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "icon");
					_vehName = getText(configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "displayName");
					_name = format["%1: %2 (RemoteControl)",_vehName,_name];
					_marker = _icon call BIS_fnc_textureVehicleIcon;
					_pos = position (vehicle _unit);
					_dir = direction (vehicle _unit);
				} else {
					if(!isPlayer _unit) then {
						_icon = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "icon");
						_name = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
						_marker = _icon call BIS_fnc_textureVehicleIcon;
						_pos = position (vehicle _unit);
						_dir = direction (vehicle _unit);
					} else {
						_marker = "\A3\ui_f\data\map\vehicleicons\iconman_ca.paa";
					};
				};
			};
		} else {
			_marker = _type;
		};

		_this select 0 drawIcon [
			_marker,
			_color,
			_pos,
			26,
			26,
			_dir,
			_name,
			1,
			0.06,
			'TahomaB',
			'right'
		];
	} forEach life_markers;
	if(!isNull (findDisplay 12)) then {
		((findDisplay 12) displayCtrl 112) ctrlSetText "Roleplay.co.uk";
		((findDisplay 12) displayCtrl 111) ctrlSetText format["%1",profileName];
		((findDisplay 12) displayCtrl 116) ctrlShow false;
		((findDisplay 12) displayCtrl 1014) ctrlShow false;
	};
}];

if(_isGPS) then {
	waitUntil {!visibleGPS};
} else {
	waitUntil {!visibleMap};
};

_display displayCtrl _ctrl ctrlRemoveEventHandler["Draw",_id];
terminate _loop;
life_markers = [];
