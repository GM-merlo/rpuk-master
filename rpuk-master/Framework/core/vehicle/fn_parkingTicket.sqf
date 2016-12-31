/*
	File: fn_parkingTicket.sqf
	Author: Ciaran Langton

	Description:
	Adds a parking ticket to the car.
*/
_car = cursorTarget;
if(isNull _car) exitWith {};
if(player distance _car > 10) exitWith {};
if(!(_car isKindOf "LandVehicle")) exitWith {};
if(!(_car in life_vehicles)) exitWith {hint "You do not own this car!";};
if(_car getVariable["parkingTicket",false]) exitWith {hint "You already have a parking ticket on this car!";};

if(([false,"parkingticket",1] call life_fnc_handleInv)) then
{
	_car setVariable["parkingTicket",true,true];
	titleText["You slip the parking ticket onto the cars dashboard.","PLAIN DOWN"];
	[] call life_fnc_p_updateMenu;
	[] call life_fnc_hudUpdate;
};
