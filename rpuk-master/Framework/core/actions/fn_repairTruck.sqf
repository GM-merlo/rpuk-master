/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if(life_action_inUse) exitWith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if( ("ToolKit" in (ItemCargo _veh)) ||  {"ToolKit" in (items player)}) then
	{
		//inside your car, trying to repair? Fuck off!
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};

		life_action_inUse = true; //start the ball rolling
		
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%1",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		_delay = 0.27; //Default delay.

		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				sleep 0.4;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep _delay;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%1",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {life_interrupted = true;};
			if(player != vehicle player) exitWith {life_interrupted = true;};
			if(life_interrupted) exitWith {};
		};

		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

		if(random 100 > 75) then { //25% chance of keeping toolbox.
			
			if("ToolKit" in (ItemCargo _veh)) then {
				private ["_contents","_ptr","_count"];
				_contents = getItemCargo _veh;
				clearItemCargoGlobal _veh; //get rid of it all now, to stop glitchers
				uiSleep 1; //wait one second in the hope that the clearout will be over by the time we reload the contents...
				_ptr = (_contents select 0) find "Toolkit";
				_count = ((_contents select 1) select _ptr);
				_count = _count - 1; //god help us if there already zero toolkits due to some exploiting scumbag
				(_contents select 1) set [_ptr, _count];
				{
					_veh addItemCargoGlobal [_contents select 0, _contents select 1]; //shove it all back in (and hope that ["Toolbox",0] will work!
				} forEach _contents;
					
			} else {
				player removeItem "Toolkit"; //take a toolkit off the player instead
			};
			titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		} else {
			titleText[localize "STR_NOTF_RepairedVehicleKeep","PLAIN"]; 
		};
		_veh setDamage 0;
		life_action_inUse = false; //stop the ball rolling!
	};
};
