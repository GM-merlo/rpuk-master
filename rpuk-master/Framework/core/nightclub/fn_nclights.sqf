/* 
	File: fn_nclights.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Enables/Disables the nightclub lights, then sends it to all clients.
*/
_obj = nc_light;
if(_this select 3 == "MM") then {_obj = nearestObject [position player, "Land_i_Shed_Ind_F"];};
_trueorfalse = nc_light getVariable["nclights",FALSE];

if(_trueorfalse) then {
	_obj setVariable["nclights",FALSE,TRUE];
	hint "Turning off lights. This may take a second.";
} else {
	_obj setVariable["nclights",TRUE,TRUE];
	[[_obj,0.22],"life_fnc_ncLightsOn",true,false] call life_fnc_MP;
};