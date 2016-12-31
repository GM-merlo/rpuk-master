/*
	File: fn_spawnMenuSetup.sqf

    RolePlay.co.uk
    Author: Rathbone
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
try
{
    [
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
    ] spawn BIS_fnc_dynamicText;

    cutText ["","BLACK IN"];

    private _position = getArray (missionConfigFile >> "CfgMainMenu" >> worldName >> "mainmenuspawn");
    private _anims = getArray (missionConfigFile >> "CfgMainMenu" >> "animations");

    if ((count _position) isEqualTo 0) then
    {
        private _error = format ["ERROR MAIN MENU - NO POSITION ARRAY FOR %1 WORLD",worldName];
        throw _error;
    };

    //Create Dummy
    RPUKDummy = "C_man_1" createVehicleLocal [_position select 0,_position select 1,_position select 2];
    RPUKDummy allowDamage false;
    RPUKDummy setPos [_position select 0,_position select 1,_position select 2];
    RPUKDummy setDir (_position select 3);
    RPUKDummy setFace (face player);
    
    [RPUKDummy] joinSilent (group player); //NDJ 10Aug16 - put dummy into player's side/group so that textures can be mapped later

    RPUKDummy switchMove (selectRandom _anims);
    RPUKDummy addEventHandler ["AnimDone", {
      params [
        ["_unit", objNull, [objNull]]
      ];

      private _anims = getArray (missionConfigFile >> "CfgMainMenu" >> "animations");
      _unit switchMove (selectRandom _anims);
    }];

    //Apply Items
    if !(isNil 'life_gear') then {
      removeUniform RPUKDummy;
      removeVest RPUKDummy;
      removeBackpack RPUKDummy;
      removeGoggles RPUKDummy;
      removeHeadgear RPUKDummy;
      

      if(hmd RPUKDummy != "") then {
      	RPUKDummy unlinkItem (hmd RPUKDummy);
      };

      life_gear params [
        ["_uniform", "", [""]],
        ["_vest", "", [""]],
        ["_backpack", "", [""]],
        ["_goggles", "", [""]],
        ["_headgear", "", [""]]
      ];

      RPUKDummy forceAddUniform _uniform;
      RPUKDummy addVest _vest;
      RPUKDummy addBackpack _backpack;
      RPUKDummy addGoggles _goggles;
      RPUKDummy addHeadgear _headgear;
    };

	[RPUKDummy, false] call life_fnc_HandleUniforms;
    

    if !(daytime > 8 && {daytime < 17}) then {
        _chemlight = "Chemlight_yellow" createVehicleLocal (RPUKDummy modelToWorld [0,4,1]);
        _chemlight setPos (RPUKDummy modelToWorld [0,4,1]);
    };

    if (currentWeapon RPUKDummy isEqualTo "") then {
	    RPUKDummy action ["SwitchWeapon", RPUKDummy, RPUKDummy, 100];
    };

    RPUKCAMERA = "camera" camCreate (getPos RPUKDummy);
    showCinemaBorder false;
    RPUKCAMERA cameraEffect ["internal","back"];
    RPUKCAMERA camSetTarget (RPUKDummy modelToWorld [0,0,1]);
    RPUKCAMERA camSetPos (RPUKDummy modelToWorld [0,4,2]);
    RPUKCAMERA camSetFOV .65;
    RPUKCAMERA camSetFocus [50,0];
    RPUKCAMERA camCommit 0;

    sleep 1;

    disableSerialization;
    createDialog "RPUK_MainMenu";
    private _display = findDisplay 42500;
    private _continueB = _display displayCtrl 2400;
    private _statsB = _display displayCtrl 2401;
    private _returnB = _display displayCtrl 2402;
    private _serverB = _display displayCtrl 2403;
    private _creditB = _display displayCtrl 2404;
    private _additionB = _display displayCtrl 2405;
    private _unusedB = _display displayCtrl 2406;
    //
    private _statsT = _display displayCtrl 1102;
    private _serverT = _display displayCtrl 1103;
    private _creditT = _display displayCtrl 1104;
    private _additionT = _display displayCtrl 1105;
    private _leftT = _display displayCtrl 1100;
    private _rightT = _display displayCtrl 1101;

    private _message = getText (missionConfigFile >> "CfgMainMenu" >> worldName >> "leftstructuredtext");
    private _messageOne = getText (missionConfigFile >> "CfgMainMenu" >> worldName >> "rightstructuredtext");
    private _modPack = "";

    _display displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];

    if (isNil "RPUK_Cam_Degree") then
    {
        RPUK_Cam_Degree = 0;
    };

    _display displayAddEventHandler ["MouseButtonDown",
    	{
    		if (_this select 1 isEqualTo 0) then
            {
                life_mouseDown = true;
            };
    	}
    ];

    _display displayAddEventHandler ["MouseButtonUp",
    	{
    		if (_this select 1 isEqualTo 0) then
            {
                life_mouseDown = false;
            };
    	}
    ];

    _display displayAddEventHandler["MouseMoving",
    	{
    		if (life_mouseDown) then
            {
    			private _x = _this select 1;
    			private _y = _this select 2;
    			_x = (_x * 8);
    			private _dir = getDir RPUKDummy;
    			RPUKDummy setDir (_dir + _x);
    			RPUK_Cam_Degree = RPUK_Cam_Degree + _y;
    		};
    	}
    ];

    if (call life_alukmod_loaded) then
    {
	    _modPack = "<t color='#00FF00'>Enabled</t>";
    }
    else
    {
	    _modPack = "<a href='http://modpack.AltisLife.co.uk' color='#5600FF'>Disabled</a>";
    };

    _leftT ctrlSetStructuredText parseText format [_message,profileName,worldName,_modPack];
    _rightT ctrlSetStructuredText parseText _messageOne;

    {
        _x ctrlEnable false;
    } forEach [_statsB,_serverB,_creditB,_additionB,_unusedB];

    _continueB ctrlSetEventHandler ["ButtonClick","[] call life_fnc_spawnUnload"];
    _returnB ctrlSetEventHandler ["ButtonClick","['Aborted',true,false] spawn BIS_fnc_endMission"];
}
catch
{
    systemChat _exception;
    diag_log _exception;
    [] spawn life_fnc_spawnMenu;
};
