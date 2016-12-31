/*
	File: fn_hudUpdate.sqf

    RolePlay.co.uk
    Author: Rathbone
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
disableSerialization;
private _ui = uiNameSpace getVariable ["playerHUD",displayNull];

try
{
	if (isNull _ui) then 
	{
		throw "HUD ERROR - DISPLAY IS NULL";
	};

	private _healthBar = _ui displayCtrl 1004;
	private _hungerBar = _ui displayCtrl 1002;
	private _thirstBar = _ui displayCtrl 1001;
	private _expBar = _ui displayCtrl 1003;
	private _expText = _ui displayCtrl 1100;
	private _expHeader = _ui displayCtrl 1008;

	_healthBar progressSetPosition (1 - damage player);
	_hungerBar progressSetPosition (life_hunger / 100);
	_thirstBar progressSetPosition (life_thirst / 100);

	if (worldName == "Tanoa") then { //XP bar only on Tanoa!
		
/*	if (playerSide isEqualTo civilian) then 
	{
*/	
		private _lvl = [] call life_fnc_getlevel;
		private _lvlDiff = [] call life_fnc_getXPProgress;
		_expBar progressSetPosition _lvlDiff;
		_expText ctrlSetStructuredText parseText format ["<t align='right' valign='middle' size='0.9'>LVL - %1 (%2%3)</t>",[_lvl] call life_fnc_numberText,[round(_lvlDiff * 100)] call life_fnc_numberText,"%"];
/*	}
	else
	{
		if (ctrlShown _expBar) then 
		{
			{
				_x ctrlShow false;
			} forEach [_expBar,_expText,_expHeader];
		};		
	};
*/
	};
}
catch
{
	diag_log _exception;
};
