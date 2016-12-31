/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(RPUK_dosh < life_hospital_heal_cost) exitWith {hint format[localize "STR_NOTF_HS_NoCash",life_hospital_heal_cost];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;
RPUK_dosh = RPUK_dosh - life_hospital_heal_cost;
playSound "buy";