/* 
	File: fn_noDamage.sqf
	Desc: Makes the areas around the markers indestructable.

	Author: Ciaran Langton
*/
_markers = _this select 0;
_radius = _this select 1;
{
	_nodmg = nearestObjects [markerPos _x, ["House_F"], _radius];
	{
		_x allowDamage false; 
	} forEach _nodmg;
} forEach _markers;