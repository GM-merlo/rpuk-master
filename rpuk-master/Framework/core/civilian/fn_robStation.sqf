/*
	File: fn_robStation.sqf
	Desc: Robs the station.

	Author: Ciaran Langton.
	For: AltisLife.co.uk and only AltisLife.co.uk.
*/
private["_pump","_station","_ALUKmarkername","_colour","_money","_moneyStr"];
_pump = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _pump) exitWith {}; //Error.

if (worldName != "Tanoa") then {
	_station = [_this,3,"",[""]] call BIS_fnc_param;
	if(_station == "") exitWith {}; //Error.
};

if(_pump getVariable ["rob_empty",false]) exitWith {hint "This shop was robbed recently and cannot be robbed again for a while as security is high!";};
if(_pump getVariable ["rob_ip",false]) exitWith {hint "This shop is already being robbed!";};
if(side player != civilian) exitWith {};
if(!alive player) exitWith {};
if({side _x == west} count playableUnits < 5) exitWith {hint "There are not enough cops online for you to rob this! (5 Minimum)"}; //And less than 5 cops on!
if((currentWeapon player) in ["","binocular","Rangefinder"]) exitWith {hint "You do not threaten me!";};
if(vehicle player != player) exitWith {hint "You cannot rob this shop from your car!";};

//Alright, rob is a go! lets begin shall we!!
_pump setVariable ["rob_ip",true,true];

if(worldName != "Tanoa") then {
	_ALUKmarkername = markerText _station;
	_colour = markerColor _station;
	//Set the marker to ROBBING state.
	_station setMarkerColor "ColorRed";
	_station setMarkerText format["-ROBBERY IN PROGRESS- %1",_ALUKmarkername];
} else {
		
	_ALUKmarkername = [_pump] call life_fnc_toGridRef; 
	
	diag_log format["ALUKmarkername is: %1", _ALUKmarkername];
	if (isNil "_ALUKmarkername") then {_ALUKmarkername = "INCIDENT_" + str(floor(random 500))}; 
	_station = createMarker [_ALUKmarkername, position _pump];
	_station setMarkerShape "ICON";
	_station setMarkerType "hd_warning";
	_station setMarkerText format["-ROBBERY IN PROGRESS- %1",_ALUKmarkername];
	_station setMarkerColor "ColorRed";
};


//Now to send it out to give people a hint that a station is being robbed...
[1,format["CCTV reports that a store at gridref %1 is being robbed!",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",west]; //Hint for cops
[0,format["CCTV reports that a store at gridref %1 is being robbed!",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",-2]; //Systemchat message for everyone!!
hint format["Robbing %1 - please stay near the till in order to receive the money.",_ALUKmarkername];
[[_pump, "shopalarm",40],"life_fnc_playSound",true,false] spawn life_fnc_MP; //Lets send out a little sound to alert near by people.
[[getPlayerUID player,profileName,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

_upp = "Robbing Shop";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)... You're %3m away!","%",_upp,round(player distance _pump)];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do
{
	sleep 1;
	_cP = _cP + 0.0035;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)... You're %4m away!",round(_cP * 100),"%",_upp, round(player distance _pump)];
	//Some progress updates for the Popo!
	if(round(_cP * 100) == 75) then {[1,format["The robber at gridref %1 is currently preparing to leave! (75% Complete)",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",west];};
	if(round(_cP * 100) == 50) then {[1,format["The robber at gridref %1 is currently stuffing the money bags! (50% Complete)",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",west];};
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if((player distance _pump) > 5) exitWith {};
	if(life_istazed OR life_isknockedout) exitWith {};
	if(currentWeapon player == "") exitWith {};
};

5 cutText ["","PLAIN"];

if(_cP >= 1) then {
	
	if (worldName != "Tanoa") then {
		_money = 15000 + floor(round(random 5000));
	} else {
		_money = 1500 + floor(round(random 500)); //smaller amounts for Tanoa
	};
	RPUK_dosh = RPUK_dosh + _money;

	_moneyStr = [_money] call life_fnc_numberText;
	hint format["You gained £%1 from robbing %2.",_moneyStr,_ALUKmarkername];
	[1,format["CCTV reports the robber at gridref %1 has run away after stealing around £%2!",_ALUKmarkername,_moneyStr]] remoteExecCall ["life_fnc_broadcast",west]; //Hint for cops
	[0,format["CCTV reports the robber at gridref %1 has run away after stealing around £%2!",_ALUKmarkername,_moneyStr]] remoteExecCall ["life_fnc_broadcast",-2]; //Systemchat message for everyone!!
} else {
	[1,format["CCTV reports the store at gridref %1 is no longer being robbed!",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",west]; //Hint for cops
	[0,format["CCTV reports the store at gridref %1 is no longer being robbed!",_ALUKmarkername]] remoteExecCall ["life_fnc_broadcast",-2]; //Systemchat message for everyone!!

	if((player distance _pump) > 5) then {hint "You went more than 5 meters away from the till.";};
};

if (worldName != "Tanoa") then {
	_station setMarkerColor _colour;
	_station setMarkerText _ALUKmarkername;
} else {
	deleteMarker _ALUKmarkername;
};
[[_pump,_ALUKmarkername],"TON_fnc_stationTimer",false,false] spawn life_fnc_MP;

_pump setVariable ["rob_ip",false,true];
