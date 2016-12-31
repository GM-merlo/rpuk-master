/*
	File: fn_getbusdriveMission.sqf
	Author: Bryan "Tonic" Boardwine
	Modded by: TinyBigJacko (NDJ) 13/Jul/2016
	
	Description:
	Selects a non-random next bus-stop point for a bus driving mission.

*/
private["_dp","_dpText","_taskName","_target","_vehicle","_nearvehicles"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

// check vehicles in a 15m radius from the bus stop
_nearVehicles = nearestObjects[getPos (_this select 0),["I_Truck_02_transport_F"],15];
if(count _nearVehicles > 0) then
{
	{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((getPlayerUID player) == _vehOwner) exitWith
			{
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;
};

if(isNil "_vehicle") exitWith {hint "Your rented PostBus vehicle was not found within 15m"};
if(isNull _vehicle) exitWith {};
if(!(uniform player == "U_C_Poloshirt_salmon")) exitWith {hint "You're not wearing your uniform, driver! Tanoa Bus requires drivers to be smart at all times."};

if(str(_target) in life_busdrive_points) then
{
	private["_point", "_count"]; 
	_count = count life_busdrive_points;
	_point = life_busdrive_points find str(_target);
	if (_point < (_count - 1)) then
	{
		_dp = life_busdrive_points select _point + 1;
	}
		else 
	{
		_dp = life_busdrive_points select 0;
	};
};

life_busdrive_start = _target;

life_busdrive_in_progress = true;
life_busdrive_point = call compile format["%1",_dp];

if (_dp == "bus_stop_0") then
{
	_dpText = "Bus Station";
}
	else
{
	_dpText = [_dp,"_"," "] call KRON_Replace;
};

_taskName = [format["Bus Route to %1",_dpText]];
life_cur_task = player createSimpleTask _taskName;
life_cur_task setSimpleTaskDestination (markerPos _dp);
//life_cur_task setSimpleTaskDescription [format["Drive the bus to %1, check in, and pick up any passengers that may be waiting. You are free to negotiate any fares with your passengers as you see fit.",_dpText],_taskName,_dpText];
life_cur_task setSimpleTaskDescription [format["Drive the bus to %1, check in, and pick up any passengers that may be waiting. You are free to negotiate any fares with your passengers as you see fit.",_dpText],format["%1",_taskName],format["%1",_dp]];
life_cur_task setTaskState "Created";
sleep 1;
player setCurrentTask life_cur_task;
life_cur_task setTaskState "Assigned";


["DeliveryAssigned",_taskName] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!life_busdrive_in_progress OR !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed","You have failed your bus driving task. Tanoa Bus is not impressed."] call BIS_fnc_showNotification;
		life_busdrive_in_progress = false;
		life_busdrive_point = nil;
	};
};