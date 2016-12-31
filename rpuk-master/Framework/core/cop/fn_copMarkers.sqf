/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops"];
_markers = [];
_cops = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == west) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	
	//Create markers
	{
		//Do check for GPS
		if((!isNull _x) && ("ItemGPS" in assignedItems _x)) then { //Track cop fix CL - 17/08/2014
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
			_markers pushBack [_marker,_x];
		};
	} foreach _cops;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if((!isNull _unit) && ("ItemGPS" in assignedItems _unit)) then //NDJ 16Jul14 only track a cop if he has a GPS unit in his slot
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
	_cops = [];
};