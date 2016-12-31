/*
	File: fn_houseMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Building interaction menu
*/
private ["_barracks","_bank","_curTarget","_output","_houseCfg"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //CURSORTARGET AT TIME OF CALL... type of HOUSE_F and player less than 12m away (or some shit to do with bank)
if(isNull _curTarget) exitWith {}; //Bad target

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	_bank = false;
	if (worldName == "Tanoa") then {
		_barracks = nearestObjects [[10018.373, 11792.511,0], ["Land_Barracks_01_grey_F"], 200]; //find all barracks with 200m
		if ( ((_barracks select 0) == _curTarget) OR ((_barracks select 1) == _curTarget) ) then { _bank = true} else {_bank = false};
	} else { //it's Altis, we hope
		if ((nearestObject [[7912.02,16148.6,0.396378],"Land_i_Barracks_V2_F"]) == _curTarget) then {_bank = true} else {_bank = false};
	};

	if(_bank) then { 

		[
			"Bank Interaction",
			[
				[localize "STR_pInAct_Repair","[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;"],
				[localize "STR_pInAct_CloseOpen","[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;"]
			]
		] call life_fnc_interactionMenuOpen;

	} else {
		if(_curTarget getVariable ["isBank", false]) then { // IS BANK (But not Fed Bank?)
			[
				"Bank Interaction",
				[
					[localize "STR_pInAct_Repair","[life_pInact_curTarget] spawn life_fnc_fixBankDoor; closeDialog 0;"],
					[localize "STR_pInAct_CloseOpen","[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;"]
				]
			] call life_fnc_interactionMenuOpen;
		} else {
			if(!isNil {_curTarget getVariable "house_owner"}) then { //COP TO PLAYER HOUSES INTERACTIONS
				_output = [];

				_output pushBack[localize "STR_House_Raid_Owner","[life_pInact_curTarget] call life_fnc_copHouseOwner;"]; //COPS CAN ENQUIRE WHO IS HOUSE OWNER
				_output pushBack[localize "STR_pInAct_BreakDown","[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;"]; //COPS CAN BREAK IN

				if(player distance _curTarget <= 3.6) then {
					_output pushBack[localize "STR_pInAct_SearchHouse","[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;"]; //COPS CAN SEARCH
				};
				_output pushBack[localize "STR_pInAct_LockHouse","[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;"]; //COPS CAN LOCK UP HOUSE

				["House Interaction",_output] call life_fnc_interactionMenuOpen;
			};
		};
	};
};

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {};
if(_curTarget getVariable["disallowbuy",false]) exitWith {};

_output = [];

if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then { //NOT PLAYER'S HOUSE, OR NOT OWNED BY ANYONE
	if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];}; //REMOVE IT FROM PLAYER'S OWNERSHIP IF NOT OWNED BY ANYONE

	if(isNil {_curTarget getVariable "house_owner"}) then { //NOT OWNED BY ANYONE
		_output pushBack[localize "STR_pInAct_BuyHouse","[life_pInact_curTarget] spawn life_fnc_buyHouse;"]; //OPTION TO BUY HOUSE
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then { //GARAGES

		if(((_curTarget getVariable "house_owner") select 0) == (getPlayerUID player)) then {
			_output pushBack[localize "STR_pInAct_SellGarage","[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;"];
		};

		_output pushBack[localize "STR_pInAct_AccessGarage","[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;"];
		_output pushBack[localize "STR_pInAct_StoreVeh","[life_pInact_curTarget,player,'',true] spawn life_fnc_storeVehicle; closeDialog 0;"];

	} else {

		if(((_curTarget getVariable "house_owner") select 0) == (getPlayerUID player)) then { //ALLOW HOUSE OWNER TO SELL HOUSE
			_output pushBack[localize "STR_pInAct_SellHouse","[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;"];
		};

		if(_curTarget getVariable ["housestoragelocked",false]) then { //HOUSE (STORAGE) IS CURRENTLY MARKED LOCKED (doors can be any old bollox state though!)
			_output pushBack[localize "STR_pInAct_UnlockStorage","[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;"];
		} else {
			_output pushBack[localize "STR_pInAct_LockStorage","[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;"];
		};

		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then { //TOGGLE HOUSE LIGHT
			_output pushBack[localize "STR_pInAct_LightsOn","[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
		} else {
			_output pushBack[localize "STR_pInAct_LightsOff","[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;"];
		};
	};
};
["House Interaction",_output] call life_fnc_interactionMenuOpen;