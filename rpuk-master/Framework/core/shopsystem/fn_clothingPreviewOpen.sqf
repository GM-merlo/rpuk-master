/*
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
    if (isNil "RPUKShopInfo") then 
    {
        throw "Error!";
    };
    
    disableSerialization;
    private _display = findDisplay 56100;
    private _index = lbCurSel 1500;
    private _className = lbData [1500,_index];
    
    RPUK_ClothingCurrent = -1;

    if !(_index isEqualTo -1) then 
    {
        RPUK_ClothingCurrent = _index;
    };

    private _prevArray = [
        1009,
        1010,
        1101,
        2405
    ];

    private _shopArray = [
        2404,
        1501,
        2403,
        2402,
        2401,
        2400,
        1100,
        2100,
        1500,
        1008,
        1007,
        1003,
        1006,
        1005,
        1004,
        1002,
        1001,
        1000
    ];

    {
        ctrlShow [_x,false];
    } forEach _shopArray;

    RPUK_ShopCam = "CAMERA" camCreate getPos player;
    showCinemaBorder false;
    RPUK_ShopCam cameraEffect ["Internal", "Back"];
    RPUK_ShopCam camSetTarget (player modelToWorld [0,0,1]);
    RPUK_ShopCam camSetPos (player modelToWorld [1,4,2]);
    RPUK_ShopCam camSetFOV .33;
    RPUK_ShopCam camSetFocus [50,0];
    RPUK_ShopCam camCommit 1;

    if (isNil "RPUK_ShopCam_Degree") then 
    {
        RPUK_ShopCam_Degree = 0;
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
    			private _dir = getDir player;
    			player setDir (_dir + _x);
    			RPUK_ShopCam_Degree = RPUK_ShopCam_Degree + _y;
    		};
    	}
    ];

    {
        ctrlShow [_x,true];
    } forEach _prevArray;

    private _previewText = _display displayCtrl 1101;

    [_className,true,nil,nil,nil,nil,nil,true] call life_fnc_handleItem;

    private _basePrice = getNumber (missionConfigFile >> "CfgShopSystem" >> "clothing" >> _className >> "price" >> str (playerSide));
    private _classInfo = [_className] call life_fnc_fetchCfgDetails;

    _previewText ctrlSetStructuredText parseText format [
        "Name: <t color='#ffae2b'>%1</t><br/><img image=%2 /><br/>Price: <t color='#27e640'>£%3</t>",
        (_classInfo select 1),
        (_classInfo select 2),
        [_basePrice] call life_fnc_numberText
    ];
}
catch
{
    hint _exception;
};


