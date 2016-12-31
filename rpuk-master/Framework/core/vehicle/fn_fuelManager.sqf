/*
	File: fn_fuelManager.sqf
	Author: Ciaran Langton
	Mods: TinyBigJacko 15/07/16

	Description:
	Ensures more realistic fuel values are used for vehicles.
*/
while {true} do {
	_vehicle = (vehicle player);
	if(_vehicle != player && {(local _vehicle)} && {(effectiveCommander _vehicle == player)} && {(isEngineOn _vehicle)}) then // && {(speed _vehicle >= 1)} //NDJ 15/07/16 removed this so that vehicles are always consuming if engine running.
	{
		_speed = abs((speed _vehicle))+ 1; //Absolute Value, min 1km/h even when stopped (to ensure consumption)

		//Smaller the modifier number below, the more fuel consumed this cycle.
		_modifier = switch(true) do {
			case (_vehicle isKindOf "B_Heli_Transport_01_F"): {200000 - (getMass _vehicle)};
			case (_vehicle isKindOf "Air"): {120000 - (getMass _vehicle)};
			default {85000 - (getMass _vehicle)};
		};

		_consumption = _speed/_modifier + 0.0001;

		if(_consumption > 0.002) then
		{
			_consumption = 0.002;
		};

		_newFuelLevel = (fuel _vehicle) - _consumption;
		_vehicle setFuel _newFuelLevel;
	};
	sleep 2;
};