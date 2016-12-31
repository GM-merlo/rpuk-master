/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(RPUK_dosh < life_ticket_val) exitWith
{
	if(RPUK_doshinbank < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,format[localize "STR_Cop_Ticket_NotEnoughNOTF",profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	RPUK_doshinbank = RPUK_doshinbank - life_ticket_val;
	life_ticket_paid = true;
	[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west]; //NDJ 08Apr14 - added lawyer/bank info
	[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop]; //NDJ 08Apr14 Added cash info
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
	[] call life_fnc_removeCrimes; //NDJ 08Apr14 Added because was missing! -- CL CHANGED TO NEW SYSTEM
	closeDialog 0;
};

RPUK_dosh = RPUK_dosh - life_ticket_val;
life_ticket_paid = true;

[] call life_fnc_removeCrimes; //CL Changed to new callback system.
[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west]; //NDJ 08Apr14 Added cash info
closeDialog 0;
[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop]; //NDJ 08Apr04 Added cash info
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;