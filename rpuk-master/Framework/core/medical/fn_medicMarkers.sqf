/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/

private["_markers","_NHS"];
_markers = [];
_NHS = [];
_dead = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == independent) then {_NHS pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["NHS: %1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _NHS;
			
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_dead pushBack _x;
		};
	} foreach allDeadMen;

	//Loop through and create dead markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["Need Revive: %1",(_x getVariable["name","Unknown Player"])];
		_markers pushBack [_marker];
	} foreach _dead;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then //CL - Disable GPS requirements as medics (shouldnt) be taken hostage...
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_NHS = [];
	_dead = [];
};