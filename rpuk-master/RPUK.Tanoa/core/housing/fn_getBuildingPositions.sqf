/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_arr","_restricted","_exitLoop","_i"];
_building = _this select 0;
_arr = [];

_restricted = switch(typeOf _building) do
{
	case "Land_Hotel_01_F": {[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]};
	case "Land_Hotel_02_F": {[6,9,11,13,15,23,24,26,28,30]};
	case "Land_House_Big_01_F": {[2,3,4,5,6,7,9,10,11,12]};
	case "Land_House_Big_02_F": {[0,1,2,5,6,7,9,10,11,12,13]};
	case "Land_House_Big_03_F": {[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,19,20,21]};
	case "Land_House_Big_04_F": {[1,2,5,6,7,8,9,10,11,12,13,14,15,18,19,20,21,22,23]};
	case "Land_House_Small_01_F": {[0,1,2,3,4,5,7,12]};
	case "Land_House_Small_02_F": {[0,1,2,3,8]};
	case "Land_House_Small_03_F": {[0,1,2,3,5,6]};
	case "Land_House_Small_04_F": {[0,1,2,3,4,6]};
	case "Land_House_Small_05_F": {[0,2,3,4,5]};
	case "Land_House_Small_06_F": {[0,2,3,4,6,7,8]};
	case "Land_GarageShelter_01_F": {[0,1,2,3,4,6]};
	case "Land_Slum_01_F": {[0,2,3,4]};
	case "Land_Slum_03_F": {[0,2,3,4,5,6,7,10,11,15,16,19,20,22,23,24,25]};
	case "Land_Shed_02_F": {[]};
	case "Land_Shed_05_F": {[0,1,3]};
	default {[]};
};

_i = 0;
_exitLoop = false; //Loops are not fun.
while {true} do {
	if(!(_i in _restricted)) then {
		_pos = _building buildingPos _i;
		if(_pos isEqualTo [0,0,0]) exitWith {_exitLoop = true;};
		_arr pushBack _pos;
	};
	
	if(_exitLoop) exitWith {};
	_i = _i + 1;
};

_arr;
