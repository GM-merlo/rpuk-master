/* 
	File: fn_ncsmoke.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Creates a smoke canister, that then is constantly recreated and hidden to create a smoke machine effect.
*/
_obj = smokem;
if(_this select 3 == "MM") then {_obj = smoke_marmite;};
if((_obj getVariable["nightclub_smoke",false])) exitWith
{
	hint "Wait for the smoke to turn off.";
	_obj setVariable["nightclub_smoke",false,true];
};
_obj setVariable["nightclub_smoke",true,true];
hint "Smoke is On!";

while {(_obj getVariable["nightclub_smoke",false])} do
{
	_smoke = "SmokeShell" createVehicle position _obj;
	hideObject _smoke;
	sleep 60;
	
};