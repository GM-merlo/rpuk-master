/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_time","_bail","_esc","_countDown"];
//_ret = [_this,0,[],[[]]] call BIS_fnc_param;
params [
	["_bad",false,[false]]
];
//if(_bad) then { _time = time + (20 * 60); } else { _time = time + (15 * 60); }; //NDJ 09Apr14: 20mins for respawners/quitters, 15mins for normal criminals

//NDJ 09Apr14 - explanation - if any wanted list crimes still unpaid, bail will equal the sum of all bounties on those crimes. If sent to jail without being wanted, bail is set at £10000, and sentence set to 10 mins.

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];

["U_C_Scientist",true] call life_fnc_handleItem;
waitUntil {uniform player == "U_C_Scientist"};
[player, true] call life_fnc_HandleUniforms;
removeVest player;
removeHeadgear player;

//Wilco's wanted system (Designed by Ciaran inc)
if(life_crimes select 1 > 0) then {
	life_bail_amount = (life_crimes select 1);

	_time = switch (true) do
	{
		case (life_bail_amount < 50000): {5};
		case (life_bail_amount < 100000): {10};
		default {15};
	};

	_time = (_time * 60);
} else {
	life_bail_amount = 10000;
	_time = (10 * 60);
};

//If they are "BAD" then do:
if(_bad) then {_time = _time + (5*60);};

_time = time + _time;

_esc = false;
_bail = false;

[_bad] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (10 * 60);
	}
		else
	{
		sleep (5 * 60);
	};
	life_canpay_bail = nil;
};

for "_i" from 0 to 1 step 0 do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " £%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};

	if(vehicle player != player) then {
		player action["Eject",vehicle player];
		if(driver (vehicle player) == player) then {vehicle player setFuel 0;};
	};

	//Changed so they could not escape through glitching or heli.
	if(player distance (getMarkerPos "jail_marker") > 260) then {
		player setPos (getMarkerPos "jail_marker");
	};

	if(life_escape) exitWith {
		_esc = true;
		life_escape = false;
	};

	if(life_bail_paid) exitWith {
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		player setPos (getMarkerPos "jail_release");
		[] spawn life_fnc_removeCrimes;
		[(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
		[5] call SOCK_fnc_updatePartial;
	};

	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,format[localize "STR_Jail_EscapeNOTF",profileName]] remoteExecCall ["life_fnc_broadcast",-2];
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
		player setPos (getMarkerPos "jail_release");
	};

	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[] spawn life_fnc_removeCrimes;
		player setPos (getMarkerPos "jail_release");
		[(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
		[5] call SOCK_fnc_updatePartial;
	};
};
