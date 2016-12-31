/*
	File: fn_professionMenu.sqf
	Author: Ciaran Langton
	Part of the Profession System by Ciaran
	
	Desc:
	Opens the main menu for the profession system. ----ALTISLIFE.CO.UK ONLY----
*/
if(!(createDialog "life_profession_sys")) exitWith {};
_dialog = findDisplay 1000;
_list = _dialog displayCtrl 1500;
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
	if(_x select 1 == _flag) then {
		_list lbAdd ([(_x select 0)] call life_fnc_varToStr);
		_list lbSetData[(lbSize _list)-1,_x select 0];
	};
} forEach life_professions;