/*
	File: fn_wreckManager.sqf

	Author: Ciaran Langton
	Date: 2014-09-19 17:52:50
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-24 20:32:47
*/
private["_wrecks","_wreckItems"];
_wrecks = ["wreck_spawn_1","wreck_spawn_2","wreck_spawn_3","wreck_spawn_4","wreck_spawn_5",
"wreck_spawn_6","wreck_spawn_7","wreck_spawn_8","wreck_spawn_9","wreck_spawn_10"];

life_goldboat_selected = false;

{
	_rand = random 100;
	if(_rand > 50) then {
		_goldboat = false;
		//Either random, or last one if not randomly.
		if(_rand > 90 && !life_goldboat_selected) then {
			_goldboat = true;
			life_goldboat_selected = true;
		};
		_pos = markerPos _x;
		_vehicle = createVehicle ["Land_UWreck_FishingBoat_F", _pos, [], 0, "NONE"];
		_vehicle setPos _pos;
		_vehicle setDir (random 360);

		//_posNew = position player; player setPosASL [_posNew select 0, _posNew select 1, getTerrainHeightASL _posNew]; -- Debug code to get to seabed

		_posNew = [((_pos select 0) + (random 1000 - random 1000)), ((_pos select 1) + (random 1000 - random 1000))];
		_vehicle setPosASL [_posNew select 0, _posNew select 1, getTerrainHeightASL _posNew];

		//Populate the items
		_dice = random 500;
		if(_dice < 250) then {_dice = 300;};
		if(_goldboat) then {_dice = 100;};
		_vehicle setVariable["count", _dice, true];
		_vehicle setVariable["isGoldboat", _goldboat, true];

		sleep 1300; //Sleep
		//Funky message going out telling people!
		_message = "";
		if(_goldboat) then {
			_message = "<t color='#FFFF00'><t size='2'>HM Treasury Ship Sank!</t></t><br/><t color='#ff00ff'><t size='1'>A ship carrying alot of gold has crashed off the shores of Altis! Go see what you can find there! (Approximately 1 million worth of gold!)</t></t><br/>";
		} else {
			_message = "<t color='#5882FA'><t size='2'>Shipwreck Spotted!</t></t><br/><t color='#ff00ff'><t size='1'>A Shipwreck was located near altis! See what treasures you can uncover there.</t></t><br/>";
		};

		[3,_message] remoteExecCall ["life_fnc_broadcast",-2]; //Send it out!

		_markername = str(position _vehicle);
		createMarker [_markername, position _vehicle];
		_markername setMarkerShape "ICON";
		_markername setMarkerType "hd_warning";

		if(_goldboat) then {
			_markername setMarkerColor "ColorYellow";
			_markername setMarkerText "HM Treasury Shipwreck";
		} else {
			_markername setMarkerColor "ColorBlue";
			_markername setMarkerText "Boat Wreck";
		};
	};
} forEach _wrecks;