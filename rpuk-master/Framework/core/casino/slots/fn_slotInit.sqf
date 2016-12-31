/* 
	File: fn_slotInit.sqf
	Desc: Opens our slot menu.

	Author: Ciaran Langton
*/
disableSerialization;
life_slot_current = _this select 3;
createDialog "slots";
_cost = 0;
switch (life_slot_current) do
{
	case 0:{_cost = 2000;};
	case 1:{_cost = 5000;};
	case 2:{_cost = 10000;};
};

//Setup some things we aready know about.
_ui = findDisplay 8500;
_slotText = _ui displayCtrl 1101;
_slotText ctrlSetStructuredText parseText format["Cost Per Roll = £%1",[_cost] call life_fnc_numberText];


_highPayout = [8,8,8,life_slot_current] call life_fnc_slotRewards;
_slotMax = _ui displayCtrl 1102;
_slotMax ctrlSetStructuredText parseText format["Highest Payout = £%1",[_highPayout] call life_fnc_numberText];
//Send the stat request to populate the dialog.
[[player,life_slot_current],"TON_fnc_slotStat",false,false] spawn life_fnc_MP;