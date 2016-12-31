/*
	File: fn_sellHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a 
	stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers","_positions"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {systemChat ":SERVER:sellHouse: House is null";};

_houseID = _house getVariable["house_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _house;
	_ownerID = (_house getVariable "house_owner") select 0;
	_query = format["sellHousePID:%1:%2:%3",_ownerID,_housePos,worldName];
} else {
	_query = format["sellHouseID:%1:%2",_houseID,worldName];
};

_house setVariable["house_id",nil,true];
_house setVariable["house_owner",nil,true];


// _radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2)); //this is BS! Only works if house taller than wide! NDJ 050816
//_containers = nearestObjects[(getPosATL _house),["Box_IND_Grenades_F","B_supplyCrate_F"],_radius];
//	{deleteVehicle _x} foreach _containers; //Fuck the way you do things Tonic, go fix it

_positions = [_house] call life_fnc_getBuildingPositions; //get an array with all the viable locations for crates
{
	_containers = nearestObjects[_x,["Box_IND_Grenades_F","B_supplyCrate_F"],1]; //check for crate within 1m of viable position
	if (count _containers > 1) then {
		//if crate exists, delete it
		deleteVehicle _containers select 0;
	};
} forEach _positions;

[_query,1] call DB_fnc_preparedCall;
_house setVariable["house_sold",nil,true];