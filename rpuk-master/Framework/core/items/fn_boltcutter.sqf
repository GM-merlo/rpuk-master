/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closest door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_home","_uid","_bank","_barracks","_fail"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //CURSOR TARGET WHEN USE BUTTON PRESSED
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F") &&  !((typeOf _building) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) ) exitWith {hint "You are not looking at door or storage crate ."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};


_fail = false;
_home = false;
_bank = false;

//HOUSES OR FED BANK
if(_building isKindOf "House_F") then {
	_doors = 1;
	while {true} do {
		if(!isClass(configFile >> "CfgVehicles" >> (typeOf _building) >> "AnimationSources" >> format["Door_%1_source",_doors])) exitWith {};
		_doors = _doors + 1;
	};

	_door = 0;
	//Find the nearest door
	for "_i" from 1 to _doors do {
		_selPos = _building selectionPosition format["Door_%1_trigger",_i];
		_worldSpace = _building modelToWorld _selPos;
			if(player distance _worldSpace < 2) exitWith {_door = _i;};
	};
	if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor";_fail = true;}; //Not near a door to be broken into.
	if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked";_fail = true;};


	if (worldName == "Tanoa") then {
		_barracks = nearestObjects [[10018.373, 11792.511,0], ["Land_Barracks_01_grey_F"], 200]; //find all barracks with 200m
		if ( ((_barracks select 0) == _building) OR ((_barracks select 1) == _building) ) then {_bank = true} else {_bank = false};
	} else { //it's Altis, we hope
		if ((nearestObject [[7912.02,16148.6,0.396378],"Land_i_Barracks_V2_F"]) == _building) then {_bank = true} else {_bank = false};
	};


	if(_bank) then {
		[[1,2],localize "STR_ISTR_Bolt_AlertFed"] remoteExec ["life_fnc_broadcast",west];
		[[_building, "shopalarm",40],"life_fnc_playSound",true,false] spawn life_fnc_MP; //Lets send out a little sound to alert near by people.
	} else { //not the bank, probably a house (maybe even someone's home)
		if(count ([(typeOf _building)] call life_fnc_houseConfig) == 0) exitWith {_fail = true;};

		_uid = (_building getVariable ["house_owner",["",""]]) select 0;
		if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"; _fail = true;};

		private _housegridpos = [_building] call life_fnc_toGridRef; 

		[0,format[localize "STR_ISTR_Bolt_AlertHouse",_housegridpos]] remoteExecCall ["life_fnc_broadcast",-2];
		[[_building, "shopalarm",40],"life_fnc_playSound",true,false] spawn life_fnc_MP; //Lets send out a little sound to alert near by people.

		if (playerSide == west) then {
			[2,format[localize "STR_House_Raid_NOTF",(_building getVariable "house_owner") select 1]] remoteExecCall ["life_fnc_broadcast",_uid call BIS_fnc_getUnitByUid];
		} else {
			[2,format[localize "STR_House_Burgled_NOTF",(_building getVariable "house_owner") select 1]] remoteExecCall ["life_fnc_broadcast",_uid call BIS_fnc_getUnitByUid];
		};
		_home = true;
	};
};
if(_fail) exitWith {};



//DO THE PROGRESS BAR THING (all types of building/storage)

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_i_Barracks_V2_F": {_cpRate = 0.005;};
	case "Land_Barracks_01_grey_F": {_cpRate = 0.005;};
	default {_cpRate = 0.0092;}
};

for "_i" from 0 to 1 step 0 do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed OR life_isknockedout) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknockedout) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};

//IF HOUSE/BANK, UNLOCK DOORS
if (_building isKindOf "House_F") then {
	_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
};
if ((typeOf _building) in ["Land_i_Barracks_V2_F","Land_Barracks_01_grey_F"]) exitWith{}; //if it's the bank, we're done with this now, leave.

//IF STORAGE, UNLOCK CRATES
if((typeOf _building) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {

	_building = ( (getPosATL player) call life_fnc_getBuilding ); //find out what player-home we're in

	if((_building getVariable["housestoragelocked",false])) then {
		_building setVariable["housestoragelocked",false,true];
	};
};

//set correct wanted status for respective acts
if ( playerSide != west) then {
	if(_home) then {
		[[getPlayerUID player,profileName,"460"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; //Breaking & Entering
	} else {
		[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; //Burglary
	};
};