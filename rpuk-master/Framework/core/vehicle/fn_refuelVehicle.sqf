/*
	File: fn_refuelVehicle.sqf
	Author: Ciaran Langton
	Modded: TinyBigJacko 18/07/16
	
	Description:
	Manages refueling the nearest car.
*/
[private "_boughtFuelAmt"];
_pump = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _pump) exitWith {};

_vehicle = (nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) select 0;

if(!(playerSide == west)) then {

	_combinedAssets = RPUK_doshinbank + RPUK_dosh;
	if(_combinedAssets == 0) exitWith {hint "You're broke! We don't serve hobos. Go away!";};
	
	if((count nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) < 1) exitWith {};
	
	//grab our vehicle's fuelCapacity config - supposedly NOT litres, but looks bloody close and will do! NDJ
	_vehCapacityLitre = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
	_fuelNeededpc = 1 - (fuel _vehicle);
	
	_FillFuelCost = floor((life_refuel_litre_price * _vehCapacityLitre  * _fuelNeededpc));
	//diag_log format["_vehCapacity: %1, _fuelNeeded: %2, _FillFuelCost: %3", _vehCapacity, _fuelNeeded, _FillFuelCost];
	
	if (_FillFuelCost > _combinedAssets) then {
		//Too poor for the lot - spend it all and fill what we can.
		_boughtFuelAmt = (_combinedAssets / life_refuel_litre_price) / _vehCapacity; // how many ltr can you afford div by capacity
		hint format ["Your card has been declined for the full £%1 refuel amount.\n£%2-worth of fuel bought instead",_FillFuelCost, _combinedAssets ];
		RPUK_doshinbank = 0;
		RPUK_dosh = 0;
	} else {
		//we can afford it all; fill 'er up, Jacko!
		_boughtFuelAmt = 1;
		hint format ["There you go boss; you're full.\nThat'll be £%1 please.", _FillFuelCost];
		if (_FillFuelCost > RPUK_doshinbank) then {	
			//more than we have in bank, so take rest out of hand cash
			RPUK_dosh = RPUK_dosh - (_FillFuelCost - RPUK_doshinbank);
			RPUK_doshinbank = 0;
		} else {
			//can pay it all on card - rich bastard.
			RPUK_doshinbank = RPUK_doshinbank - _FillFuelCost;
		};
	};
} else {
	//cops
	hint "No problem officer, this one's on the Police account.\nYou're good to go. Drive safe, and we'll see you again, I hope!";
	_boughtFuelAmt = 1; //full
};	
	
//RPUK_doshinbank = RPUK_doshinbank - life_refuelvehicle_price;
if(!local _vehicle) then {
	[[_vehicle, _boughtFuelAmt],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
} else {
	_vehicle setFuel  _boughtFuelAmt;
};
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
cutText[format["Your %1 has been refueled. Thanks for your business!",_vehicleName],"PLAIN DOWN"];