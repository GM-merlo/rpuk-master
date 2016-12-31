/*
* @File:   initServer.sqf
* @Author: Tonic and Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!(_this select 0) || !isServer) exitWith {}; //Not server
[] execVM "\life_server\init.sqf";

//Spawn the new hospitals.
{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
} foreach ["hospital_2"];

//[8,true,true,12] execFSM "core\fsm\keepingTime.fsm";
[8,true,12] execFSM "core\fsm\timeModule.fsm";

life_fed_hacked = false;
publicVariable "life_fed_hacked";
