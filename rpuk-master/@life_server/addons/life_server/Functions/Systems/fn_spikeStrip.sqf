/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	This is the server-side part of it which constantly monitors the spike strip and vehicles near it.
	First originally tried triggers but I was never any good at those nor do I like them as they
	have a global effect.
*/
private["_nearVehicles","_spikeStrip"];
_spikeStrip = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.
if(typeOf _spikeStrip != "Land_Razorwire_F") exitWith {};
_spikeStrip setDamage 1;
waitUntil {sleep 0.2; _nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],10]; count _nearVehicles > 0 OR isNull _spikeStrip};

if(isNull _spikeStrip) exitWith {}; //It was picked up?
_vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[[_vehicle],"life_fnc_spikeStripEffect",_vehicle,false] spawn life_fnc_MP;
deleteVehicle _spikeStrip;
