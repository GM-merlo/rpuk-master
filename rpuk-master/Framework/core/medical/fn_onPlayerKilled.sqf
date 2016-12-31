/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
if (!(_unit getVariable["Revive",false])) then {_unit setVariable["Revive",FALSE,TRUE]}; //Set the corpse to a revivable state, if not already being revived! NDJ 01/08/16
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["medideadtime",serverTime,true];

//Medilog stuff
_text = "";
if(!isNull _killer) then {
	if(isPlayer _killer) then {
		if(_killer == player) then {
			_text = "Unconscious due to self induced damage.";
		} else {
			_text = format["Unconscious because of %1",name _killer];
		};
	} else {
		_text = "Unconscious due to unknown cause.";
	};
} else {
	_text = "Unconscious due to self induced damage.";
};
[_unit,_text] call life_fnc_medilogSubmit;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder FALSE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreenV2";
((findDisplay 7300) displayCtrl 1101) progressSetPosition 1;
//((findDisplay 7300) displayCtrl 1104) ctrlSetStructuredText parseText "Medics Online: Loading<br/>Nearest Medic: Loading<br/>";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	_unit = _this;
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 1101);
	_Title = ((findDisplay 7300) displayCtrl 1100);

	_RespawnBtn ctrlEnable false;
	_Timer ctrlSetTextColor [1,0,0,1];
	for "_i" from 0 to 100 do {
		if(isNull _this OR life_request_timer OR !isNull (_unit getVariable["Reviving",objNull])) exitWith {};
		uisleep ((life_respawn_timer * 60) / 100);
		_Timer progressSetPosition ((100 - _i) / 100);
	};

	if (life_request_timer && isNull (_unit getVariable["Reviving",objNull])) then {
		for "_i" from 0 to 100 do {
			if(isNull _this OR !isNull (_unit getVariable["Reviving",objNull])) exitWith {};
			uisleep ((life_respawn_timer * 220) / 100);
			_Timer progressSetPosition ((100 - _i) / 100);
		};
	};
	life_request_timer = false; //resets increased respawn timer
	_Timer progressSetPosition 1;
	_Timer ctrlSetTextColor [0,1,0,1];
	_Title ctrlSetStructuredText parseText "<t size='2' align='center'>Pending Revive</t>";
	_RespawnBtn ctrlEnable true;

	while {!isNull _unit} do {
		waitUntil {!isNull (_unit getVariable["Reviving",objNull]) || isNull _unit};
		if(isNull _unit) exitWith {};
		_current = 0.01;
		_Timer progressSetPosition 0;
		_Timer ctrlSetTextColor [1,0.825,0,1];
		_Title ctrlSetStructuredText parseText "<t size='2' align='center'>Revive in progress...</t>";

		while {!isNull (_unit getVariable["Reviving",objNull]) && !isNull _unit} do {
			sleep 0.10;
			_current = _current + 0.01;
			_Timer progressSetPosition _current;
		};
		sleep 0.5;
		if(isNull _Title || isNull _Timer || isNull _unit) exitWith {}; //Player was arrived or respawned.
		_Timer progressSetPosition 1;
		_Timer ctrlSetTextColor [0,1,0,1];
		_Title ctrlSetStructuredText parseText "<t size='2' align='center'>Pending Revive</t>";
	};
};

[] spawn life_fnc_deathScreen;

if(life_nlrtimer_running) then
{
	life_nlrtimer_stop = true;
	waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetPos (getPosATL player); life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {

	if (playerSide != west) then {
		//victim was not a cop...
		if(vehicle _killer isKindOf "LandVehicle") then {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	}
	else {
		//victim was a cop - use cop-killer penalties instead!
		if(vehicle _killer isKindOf "LandVehicle") then {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187VP"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187P"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {

	//don't give bounty if cop killed me with vehicle!
	if (vehicle _killer == _killer) then {
		life_copRecieve = _killer;
	};
	//Did I rob the federal reserve?
	if(!life_use_atm && {RPUK_dosh > 0}) then {
		[0,format[localize "STR_Cop_RobberDead",[RPUK_dosh] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];
		RPUK_dosh = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
RPUK_dosh = 0;
[false] spawn life_fnc_breakLeg;
if !(life_disableHUD) then
{
	[1] call life_fnc_hudSetup;
};
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
if(call life_wilcorank > 0) then {[[player],"TON_fnc_adminChatJoin",false,false] spawn life_fnc_MP;}; //If admin then send a request to join adminchat channel.

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
