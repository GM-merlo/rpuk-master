/*
	File: fn_toGridRef.sqf
	Author: TinyBigJacko 11/Aug/2016

	Description:
	Takes an object (building,etc) and returns a string in gridref format with corrected leading zeros: [xxx,yyy]
*/

params [ ["_objPlace",objNull,[objNull]] ];

if (isNull _objPlace) exitWith {"[UNKNOWN]"}; //Duff input? Duff output, but safe.

private _objPlacePos = position _objPlace; //Just get it the once, eh?

private _easting = floor(( _objPlacePos select 0) / 100);
if (_easting < 10 ) then {
	_easting = "00" + str(_easting);
} else {
	if (_easting < 100 ) then {
		_easting = "0" + str(_easting);
	} else {
		_easting = str(_easting);
	};
};
			
private _northing = floor((_objPlacePos select 1) / 100);
if (_northing < 10 ) then {
	_northing = "00" + str(_northing);
} else {
	if (_northing < 100 ) then {
		_northing = "0" + str(_northing);
	} else {
		_northing = str(_northing);
	};
};

//Return the formatted string:
"[" + _easting + "/" + _northing + "]"