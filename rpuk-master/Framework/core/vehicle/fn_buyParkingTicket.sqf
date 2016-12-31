/*
	File: fn_buyParkingTicket.sqf
	Author: Ciaran Langton
	
	Description:
	Buys a parking ticket..
*/
if(RPUK_dosh < 500) exitWith {hint "You do not have £500 to buy a ticket!"};
if(([true,"parkingticket",1] call life_fnc_handleInv)) then
{
	RPUK_dosh = RPUK_dosh - 500;
	titleText["You have bought a parking ticket, please go and place it on your car!","PLAIN DOWN"];
};