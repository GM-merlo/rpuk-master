/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49) || isServer
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	//[] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["Revive",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed) OR (life_isknockedout)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	//_abortButton buttonSetAction "[[player],""TON_fnc_cleanupRequest"",false,false] spawn life_fnc_MP";
	//Register an event handler to handle logging out, sometimes the buttonSetAction command does not work.
	_abortButton ctrlSetEventHandler [
		"ButtonClick",
		"[] spawn life_fnc_goodbye; (findDisplay 49) closeDisplay 2; true" 
	];
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	

	//Move continue over to button futher down
	_act = buttonAction ((findDisplay 49) displayCtrl 2);
	_txt = ctrlText ((findDisplay 49) displayCtrl 2);
	((findDisplay 49) displayCtrl 103) buttonSetAction _act;
	((findDisplay 49) displayCtrl 103) ctrlSetText _txt;
	((findDisplay 49) displayCtrl 103) ctrlEnable true;

	//Setup our name onto the escape menu!
	((findDisplay 49) displayCtrl 2) ctrlEnable true;
	((findDisplay 49) displayCtrl 2) ctrlSetEventHandler [
		"ButtonClick",
		"(findDisplay 49) closeDisplay 2; [] spawn life_fnc_welcome; true" 
	];
	((findDisplay 49) displayCtrl 2) ctrlSetText "HTTP://ROLEPLAY.CO.UK/";
	((findDisplay 49) displayCtrl 122) ctrlEnable false;
	((findDisplay 49) displayCtrl 122) ctrlShow false;
	((findDisplay 49) displayCtrl 523) ctrlSetText "Roleplay UK";


	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl && life_session_completed) then { //CL - Stop newbs from respawning and losing all cash+Data :///
		_respawnButton ctrlEnable true; //Enable the button.
	};
	if(!life_session_completed) then {
		_respawnButton ctrlSetText "Can't Login? Just Relog.";
	};
	waitUntil{isNull (findDisplay 49)};
};