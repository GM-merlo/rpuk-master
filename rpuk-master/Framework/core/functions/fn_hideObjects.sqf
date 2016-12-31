/*
	File: fn_hideObjects.sqf

	Author: Ciaran
	Date: 2015-12-20 23:36:40
	Last Modified by: Ciaran
	Last Modified time: 2015-12-20 23:40:50
*/
params [
	[ "_models", [ ], [ [ ] ] ],
	[ "_range", -1, [ -1 ] ],
	[ "_pos", objNull, [ objNull, [ ] ] ]
];

{

	private _obj = _x;
	private _vName = str _x;
	{

		if ( _vName find _x != -1 ) exitWith {

			_obj hideObject true;

		};

	} forEach _models;

} forEach nearestObjects [_pos, [], _range];
true