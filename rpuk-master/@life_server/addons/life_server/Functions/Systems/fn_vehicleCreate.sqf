/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Answers the query request to create the vehicle in the database.
*/
private["_uid","_side","_type","_classname","_color","_plate"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = [_this,3,-1,[0]] call BIS_fnc_param;

//Error checks
if(_uid == "" OR _side == sideUnknown OR isNull _vehicle) exitWith {};
if(!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch(true) do
{
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
	case (_vehicle isKindOf "Cargo_base_F"): {"Crate"};
};

_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

_plate = round(random(1000000));

_method = call life_fnc_findTransactionMethod;
if(typeName _method == typeName objNull) then {
	[[_uid,_side,_type,_classname,_color,_plate],"DB_fnc_insertVehicle",_method] call life_fnc_MP; //TO HC
} else {
	[_uid,_side,_type,_classname,_color,_plate] spawn DB_fnc_insertVehicle; //EXEC LOCALLY
};

_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;
if(_weight >= 5) then { //Theres space, so add a default Fuel item.
	_vehicle setVariable["Trunk",[[["fuelF",1]],5],true];
} else {
	_vehicle setVariable["Trunk",[[],0],true];
};

_vehicle setVariable["dbInfo",[_uid,_plate]];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];