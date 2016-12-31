/*

	File: fn_hudSetup.sqf

    RolePlay.co.uk
    Author: Rathbone
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
    ["_mode",-1,[0]]
];

try
{
    if (_mode isEqualTo -1) then
    {
        throw "ERROR HUD INIT - MODE IS -1";
    };

    switch _mode do
    {
        case 0:
        {
            2 cutRsc ["playerHUD", "PLAIN", 1, false];
            [] call life_fnc_hudUpdate;
        };
        case 1:
        {
		        2 cutText ["", "PLAIN"];
        };
        default {};
    };
}
catch
{
    diag_log _exception;
};
