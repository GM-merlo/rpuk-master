/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_query","_sql","_vehicle","_nearVehicles","_tickTime","_vid","_pid","_sp","_unit","_price","_dir"];

_vid = [_this,0,-1,[0]] call BIS_fnc_param; //vehicle ID
_pid = [_this,1,"",[""]] call BIS_fnc_param; //player ID
_sp = [_this,2,[],[[],""]] call BIS_fnc_param; //spawn point; pos-array usually, string for medics
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; //player who owns the vehicle
_price = [_this,4,0,[0]] call BIS_fnc_param; //price of retrieval
_dir = [_this,5,0,[0]] call BIS_fnc_param; //direction to face on spawn (degrees)


private _name = name _unit;
private _side = side _unit;
private _real = _unit;
//_unit = owner _unit;

if (_vid == -1 OR _pid == "") exitWith {};
if (_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

_queryResult = [format["spawnVehicleGet:%1:%2",_vid,_pid],2] call DB_fnc_preparedCall;

if (_queryResult isEqualType "") exitWith {};

_vInfo = _queryResult;
if (isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if (count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if ((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};

if ((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};
if !(_sp isEqualType "") then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = nearestObjects[getMarkerPos _sp,["Air"],55];
};
if (count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,_real],"life_fnc_garageRefund",_unit,false] spawn life_fnc_MP;
	[1,(localize "STR_Garage_SpawnPointError")] remoteExecCall ["life_fnc_broadcast",_unit];
};

[format["spawnVehicleActivate:%1:%2",_pid,_vid],false] spawn DB_fnc_preparedCall;

if (_sp isEqualType "") then { //spawn point passed as string
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,11.2554]);
	sleep 0.6;
} else { //spawn point passed as pos array - most of them are this one...
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
		
	_vehicle allowDamage false;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir; //set the direction FIRST, before the pos. NDJ 24/07/16
	_vehicle setPos _sp;
	
	diag_log format["Spawning vehicle at spawn: %1 direction: %2 owner: %3",_sp, _dir, owner _vehicle];
	
};
_vehicle allowDamage true;
//Send keys over the network.
[[_vehicle],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
_vehicle setVariable["side",_side,true];
[[_vehicle],"life_fnc_ropeBlock",_unit,false] spawn life_fnc_MP;
_vehicle lock 2;
//Reskin the vehicle
//In the event that it is not allowed on a player.
_colorDB = _vInfo select 8;
_colour = [typeOf _vehicle] call life_fnc_vehicleColorCfg;
_type = _colour select (_vInfo select 8);
if (!isNil '_type' && {count _type > 0}) then 
{
	_type = _type select 1;
	if (_side == civilian && _type in ["cop","med","fed"]) then 
	{
		_colorDB = 0;
	};
};

_rgb = [(_queryResult select 9)] call DB_fnc_mresToArray;
if (_rgb isEqualType "") then {_rgb = call compile format["%1", _rgb];};
_vehicle setVariable["Life_VEH_RGB",_rgb,true]; //Set that variable!

_inv = [(_queryResult select 10)] call DB_fnc_mresToArray;
if (_inv isEqualType "") then {_inv = call compile format["%1", _inv];};
_vehicle setVariable["Trunk",_inv,true]; //INVENTORY SAVING


[[_vehicle,_colorDB],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;

//NDJ 30Apr14 give all vehicles 1 toolkit automatically! //updated 21/07/2016 - quadbikes get them back again, no backpack now!
if(!((_vInfo select 2) in ["B_UAV_01_F","B_UGV_01_rcws_F"])) then {
	_vehicle addItemCargoGlobal ["Toolkit",1]; 
};

//NDJ 26Mar14 - initialise the cop car variables for siren status and type.
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["B_MRAP_01_F","C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_T_LSV_01_unarmed_F"]) then {
	_vehicle addItemCargoGlobal ["ToolKit",2]; //NDJ 30Apr14 give cop vehicles a couple more toolkits automatically!
	_vehicle addItemCargoGlobal ["FirstAidKit",2]; //NDJ 30Apr14 first aid kits!
};

//NDJ 04May14 - initialise UAVs with crew
if((_vInfo select 2) in ["B_UAV_01_F","B_UGV_01_rcws_F"]) then {
	createVehicleCrew _vehicle;
	_vehicle setAutonomous false;
};

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _colorDB != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then
{
	[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Boat_Civil_01_rescue_F") then
{
	[[_vehicle,"med_ship",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};


[1,"Your vehicle is ready!"] remoteExecCall ["life_fnc_broadcast",_unit];
serv_sv_use = serv_sv_use - [_vid];

//NDJ 19May14 - attempt to give the vehicle back to the local player, to avoid the unlock problem
//_vehicle setOwner _unit;
[[_vehicle,2], "lock",_unit,false] call life_fnc_MP; //make the local unit re-run the lock action again. 

[_vehicle,"life_fnc_spawnIndicator",_unit,false] spawn life_fnc_MP; //make the indicator appear.

[_vehicle,"life_fnc_massFix",_unit,false] spawn life_fnc_MP;
