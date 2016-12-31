/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/

if(player getVariable["Revive",FALSE]) exitWith {}; //no soup for you, if you're in mid revive-worship mode! NDJ 01/08/16


private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_sirenState","_nearcars","_fobrange"]; //NDJ 25Mar14 _sirenstate added for multi-tone siren, nearcars & fobrange for ranged vehicle-locks
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

//--- Prev Channel Switch
if(_code in actionKeys "PrevChannel") exitWith {

	if(currentChannel <= 3) then {

		//--- Return the mic status
		ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa"

	}

};

//--- Next Channel Switch
if(_code in actionKeys "NextChannel") exitWith {

	if(currentChannel >= 5) then {

		//--- Return the mic status
		ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa"

	}

};

//--- Speaking Key for Either selected channel, direct, side or VON was pressed. Process it
if(_code in actionKeys "PushToTalk" || _code in actionKeys "PushToTalkSide" || _code in actionKeys "PushToTalkDirect" || _code in actionKeys "VoiceOverNet") exitWith {

	if(currentChannel > 5 || currentChannel < 3) then {

		setCurrentChannel 5;

	};

	//--- Return
	false

};

if((_code in (actionKeys "Gear")) && (!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR alive cursorTarget))) then
{
	closeDialog 0;
	closeDialog 0;
	_handled = true;
};

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false]) || (player getVariable ["Revive",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//How About GET OFF SIDE CHAT NOW!
if (_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide")) exitWith
{
	_chan = "";
	disableSerialization;
	_chan = ctrlText ((findDisplay 63) displayCtrl 101);
	if (_chan == "OOC Channel") then {
		systemChat format["Please do not attempt to speak in %1 on our server.", _chan];
		_handled = true;
	};
	_handled;
};

if ( _code in ( actionKeys "TacticalView" ) ) exitWith {

	hint "Tactical view is not allowed to be used.";
	true

};

//Hotfix for Interaction key not being able to be bound on some operating systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Random keybinds
	case 2: //1 key (not numpad)
	{
		[false] spawn life_fnc_animMenu;
		_handled = true;
	};

	case 3: //2 key (not numpad)
	{
		if(dialog) exitWith {true};
		[] spawn life_fnc_mobileOpen;
		_handled = true;
	};

	case 4: //3 key (not numpad)
	{
		if(dialog) exitWith {true};
		//[] spawn life_fnc_skillMenu;
		_handled = true;
	};

	case 5: //4 key (not numpad)
	{
		if(dialog) exitWith {true};
		createDialog "Life_key_management";
		_handled = true;
	};

	case 6: //5 key (not numpad)
	{
		if(dialog) exitWith {true};
		switch (playerSide) do
		{
			case west: {[false] call life_fnc_wantedMenu;};
			case civilian: {
				//Gang Menu
				if(call life_fnc_isRebel) exitWith {_handled = true;};
				if(isNil "life_action_gangInUse") then {
					if(isNil {(group player) getVariable "gang_owner"}) then {
						createDialog "Life_Create_Gang_Diag";
					} else {
						[] spawn life_fnc_gangMenu;
					};
				};
			};

			case independent: {hint "This keybind does nothing for NHS!";};
		};
		_handled = true;
	};

	case 7: //6 key (not numpad)
	{
		if(dialog) exitWith {TRUE};
		[] call life_fnc_settingsMenu;
		_handled = true;
	};

	//Animations
	case 59: //F1 key
	{
		if(player getVariable ["restrained",false]) exitWith {_handled = true;};
		if(player getVariable ["escorting",false]) exitWith {_handled = true;};
		if(animationState player == "incapacitated") exitWith {_handled = true;};
		if(life_istazed OR life_isknockedout) exitWith {_handled = true;};
		if(life_action_inUse) exitWith {_handled = true;};
		if(!alive player) exitWith {_handled = true;};
		player playAction "gestureGo";
		_handled = true;
	};

	case 60: //F2 key
	{
		if(player getVariable ["restrained",false]) exitWith {_handled = true;};
		if(player getVariable ["escorting",false]) exitWith {_handled = true;};
		if(animationState player == "incapacitated") exitWith {_handled = true;};
		if(life_istazed OR life_isknockedout) exitWith {_handled = true;};
		if(life_action_inUse) exitWith {_handled = true;};
		if(!alive player) exitWith {_handled = true;};
		player playAction "gestureFreeze";
		_handled = true;
	};

	case 61: //F3 key //Point Forward
	{
		if(player getVariable ["restrained",false]) exitWith {_handled = true;};
		if(player getVariable ["escorting",false]) exitWith {_handled = true;};
		if(animationState player == "incapacitated") exitWith {_handled = true;};
		if(life_istazed OR life_isknockedout) exitWith {_handled = true;};
		if(life_action_inUse) exitWith {_handled = true;};
		if(!alive player) exitWith {_handled = true;};
		player playAction "GesturePoint";
		_handled = true;
	};

	case 62: //F4 key //Follow
	{
		if(player getVariable ["restrained",false]) exitWith {_handled = true;};
		if(player getVariable ["escorting",false]) exitWith {_handled = true;};
		if(animationState player == "incapacitated") exitWith {_handled = true;};
		if(life_istazed OR life_isknockedout) exitWith {_handled = true;};
		if(life_action_inUse) exitWith {_handled = true;};
		if(!alive player) exitWith {_handled = true;};
		player playAction "GestureFollow";
		_handled = true;
	};

	case 63: //F5 key //Hi
	{
		if(player getVariable ["restrained",false]) exitWith {_handled = true;};
		if(player getVariable ["escorting",false]) exitWith {_handled = true;};
		if(animationState player == "incapacitated") exitWith {_handled = true;};
		if(life_istazed OR life_isknockedout) exitWith {_handled = true;};
		if(life_action_inUse) exitWith {_handled = true;};
		if(!alive player) exitWith {_handled = true;};
		player playAction "GestureHi";
		_handled = true;
	};





	/*
	case 24: //O key (conflicts with ARMA3 Watch)
	{
		if(playerSide == west) then
		{
			hint "Toggled wanted HUD.";
			life_wantedhud = !life_wantedhud;
			[] spawn life_fnc_hudUpdate;
			_handled = true;
		};
	};
	*/
	
	//P key - cops opening bar gate, other players Shift+P earplugs
	case 25: 
	{
		if(playerSide == west && !(_shift)) then
		{
			{
				if (_x animationPhase "Door_1_rot" == 1) then {
					_x animate ["Door_1_rot", 0];
				}
				else
				{
					_x animate ["Door_1_rot", 1];
				};
			} forEach (nearestObjects [vehicle player, ["Land_BarGate_F"], 20]);
			_handled = true;
		};

		if(_shift) then
	    {
		    if (soundVolume != 1) then
		    {
				1 fadeSound 1;
			  	titleText ["You remove the earplugs.", "PLAIN"];
		    }
		    else
		    {
				1 fadeSound 0.2;
				titleText ["You put in your noise filtering earplugs.", "PLAIN"];
		    };
		    [] spawn life_fnc_hudUpdate;
		    _handled = true;
	    };
	};

	//Map Key - M usually
	case _mapKey:
	{
		/*if(_shift && ("ItemMap" in assignedItems player) && !dialog) then {
			_handled = true;
			[] spawn life_fnc_openMap;
		} else {*/
			if(_ctrlKey && ("ItemGPS" in assignedItems player || "B_UavTerminal" in assignedItems player) && !dialog) then {
				if(!visibleGPS) then {
					[true] spawn life_fnc_handleMapMarkers;
				};
			} else {
				if(!visibleMap) then {
					[false] spawn life_fnc_handleMapMarkers;
				};
			};
		//};
	};

	//Sound Bullhorn (H - cops only) - also holster & recall weapon. (Shift+H and Ctrl+H - all players)
	case 35:
	{

		if(playerSide in [west,independent] && (((vehicle player) getVariable["side",sideUnknown]) in [west,independent]) && vehicle player != player && !life_horn_active) then
		{
			//Rewrote so no network requests for the siren is needed apart from the play.
			[] spawn {
				_vehicle = vehicle player;
				[[_vehicle, "CencomHorn",30],"life_fnc_playSound",true,false] spawn life_fnc_MP;
				life_horn_active = true;
				sleep 2.1;
				life_horn_active = false;
			};
		};

		if(vehicle player == player) then {
			if(_shift && !_ctrlKey && currentWeapon player != "") then {
				life_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
			};

			if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
				if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
					player selectWeapon life_curWep_h;
				};
			};
		};
	};


	//Surrendering (Shift + J)
	case 36:
	{
		if(_shift && !(player getVariable ["restrained", false]) && (animationState player) != "incapacitated" && !life_istazed && !life_isknockedout && vehicle player == player) then {
			if (player getVariable ["surrender", false]) then
			{
				player setVariable ["surrender", false, true];
			}
				else
			{
				[] spawn life_fnc_surrender;
			};
			_handled = true;
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn {
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
		_handled = true;
	};

	//Restraining (Shift + R)
	case 19:
	{
		//if(!(_shift) && (vehicle player) isKindOf "LandVehicle" && driver (vehicle player) == player) exitWith {[vehicle player,"hazards"] call life_fnc_initIndicators; true};
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && animationState cursorTarget in ["incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]) then
		{
			if(license_civ_bounty || call life_fnc_isRebel) then
			{
				[] call life_fnc_restrainAction;
			}
				else
			{
				if([false,"zipties",1] call life_fnc_handleInv) then {
					[] call life_fnc_restrainAction;
				} else {
					hint "You have no zipties!";
				};
			}
		};
	};

	//Shift+G - Knock out 
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockingout && !(player getVariable["restrained",false]) && !life_istazed && !life_isknockedout) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		}
		else
		{
			if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
			{
				if((animationState cursorTarget) != "incapacitated" && !life_knockingout && !(player getVariable["restrained",false]) && !life_istazed && !life_isknockedout) then
				{
					[cursorTarget] spawn life_fnc_knockoutAction;
				};
			}
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player != player && alive vehicle player && !life_is_processing) then { // IN AN ALIVE VEHICLE, NOT PROCESSING
				if((vehicle player) in life_vehicles) then {
					[vehicle player] spawn life_fnc_openInventory;
				};
			} else {
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Cargo_base_F" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && vehicle player == player && alive cursorTarget && !life_knockingout && !(player getVariable["restrained",false]) && !life_istazed && !life_isknockedout) then { 
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["housestoragelocked",true])}) then {
						[cursorTarget] spawn life_fnc_openInventory;
					};
				} else {
					if(cursorTarget isKindOf "Land_Sack_F") then { //Player inventory sack.
						[cursorTarget] spawn life_fnc_openInventory;
					};
				};
			};
			_handled = true;
		};
	};

	//L Key - cop lights
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Boat_Civil_01_rescue_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Van_01_box_F"]) then {
				if(((vehicle player) getVariable["side",sideUnknown]) in [west,independent]) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					[] spawn life_fnc_hudUpdate;
					_handled = true;
				};
			};
		};
	};

	// NUMPAD '/' forward-slash key? ANPR/radar system
	case 181:
	{
		if (!_alt && !_ctrlKey && playerSide == west) then {
			//systemchat "radar key pressed";
			if(vehicle player != player) then {
				if(((vehicle player) getVariable["side",sideUnknown]) in [west]) then {
					//do in-car radar/ANPR
					[] spawn life_fnc_copANPR_Radar;
				};
			} else {
				//do roadside radar gun
				[] spawn life_fnc_copRadar;
			};
			_handled = true;
		};

	};

	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
			[] call life_fnc_p_openMenu;
			_handled = true;
		};
	};

	//+ key (timeInc)
	case 13:
	{
		if(!_alt && !_ctrlKey && !_shift && !dialog && !life_is_processing && (call life_wilcorank > 0)) then {
			[] spawn life_fnc_adminGear;
			_handled = true;
		};
	};
	

	//F Key  - Cop Sirens
	case 33:
	{
		if(playerSide in [west,independent] && (((vehicle player) getVariable["side",sideUnknown]) in [west,independent]) && vehicle player != player && !life_siren_active && ((driver vehicle player) == player) && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Van_01_box_F","B_Boat_Armed_01_minigun_F","C_Boat_Civil_01_police_F","B_Boat_Transport_01_F","B_T_LSV_01_unarmed_F","C_Boat_Civil_01_rescue_F"]) then {
			[] spawn {
				life_siren_active = true;
				if (playerside == west) then {
					sleep 6.4;
				} else {
					sleep 5.774; //NDJ medic siren is shorter
				};
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
			[] spawn life_fnc_hudUpdate;
			_handled = true;
		};
	};

	//U Key - Vehicle Locks
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(time - life_unlock_time < .25) exitWith {true}; //Prevent Spammage
			life_unlock_time = time;
			if(vehicle player == player) then { //PLAYER OUTSIDE VEHICLE
				//NDJ 27Mar13 - remote keyfob 20m range with no requirement to look/target the vehicle. Car class Vehicles only.
				//Player is outside a vehicle

				//Is the current cursorTarget one of our vehicles and less than 8m away?
				_fobrange = 8;
				if(cursorTarget in life_vehicles && ((player distance cursorTarget) < _fobrange)) then { //TARGETED VEHICLE OK AND IN RANGE
					//yes, so use that vehicle as our locking subject (it might be our car or our house though)
					_veh = cursorTarget;
				} else { //TARGET BAD OR OUT OF RANGE
					//we weren't looking at one of our vehicles or it wasn't in range

					//grab all cars and suchlike in 20m range
					_nearcars = nearestObjects [player, ["Car"], 20];

					if(count _nearcars == 0) exitWith {}; //nothing to see, move along, "_veh is null" will catch this later!

					// we have some nearby cars. Test them...;
					{
						if((alive _x) && (_x in life_vehicles)) then {
							_veh = _x;
							_fobrange = 20;
							// note - does nearestObjects lie? Sometimes seems the first item in they array is the furthest away!
							//NDJ 070816 - this may just be because the exitwith only exited the IF scope and it went continued round the ForEach again!
							if(!isNull _veh) exitWith {};
						};
						if(!isNull _veh) exitWith {}; //add a second check here to exit the foreach if we found a valid vehicle!
					} forEach _nearcars;
				};
			} else { //PLAYER IN A VEHICLE
				//the vehicle that player is currently *in*
				_veh = vehicle player;
				_fobrange = 8;
			};
			
			//by now, we'll have the nearest owned vehicle in veh, or it'll be null, in which case give up completely
			if(isNull _veh) exitWith {systemChat localize "STR_MISC_VehLock_NotInRange";};


			if(_veh in life_vehicles && ((player distance _veh) < _fobrange)) then { //GOT A VALID SUBJECT IN RANGE
				if(_veh isKindOf "House_F" && playerSide == civilian) then { //IT'S A HOUSE
					_door = [_veh] call life_fnc_nearestDoor; //NB - this is calling CLIENT SIDE version of this function, not the TON server side!!
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then { //IT'S UNLOCKED, LOCK IT
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else { //IT'S LOCKED, UNLOCK IT
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				} else { //NOT A HOUSE
					_locked = locked _veh;
					if(_locked != 0) then { //IT'S LOCKED, UNLOCK IT
						if(local _veh) then { //LOCALITY CHECK
							_veh lock 0;
						} else {
							[[_veh,0], "life_fnc_lockVehicle", _veh,false] spawn life_fnc_MP;
						};
						[[_veh, "car_unlock",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
						systemChat localize "STR_MISC_VehUnlock";
					} else { //IT'S UNLOCKED, LOCK IT
						if(local _veh) then { //LOCALITY CHECK
							_veh lock 2;
						} else {
							[[_veh,2], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};

						if(_shift) then {
							[[_veh, "car_lock_stealthy",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
							systemChat localize "STR_MISC_VehLock_Stealth";
						} else {
							[[_veh, "car_lock",50],"life_fnc_playSound",true,false] spawn life_fnc_MP;
							systemChat localize "STR_MISC_VehLock";
						};
					};
				};
			} else { //FAILSAFE - SHOULDN'T GET HERE IF VEH IS NOT NULL, BUT POSSIBLE IF PLAYER MOVED
				systemChat localize "STR_MISC_VehLock_NotInRange";
			};
			_handled = true;
		};

	};
};

_handled;
