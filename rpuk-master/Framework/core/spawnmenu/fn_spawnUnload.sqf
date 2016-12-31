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
    disableSerialization;
    private _display = findDisplay 42500;

    if (isNull _display) then
    {
        throw "ERROR MAIN MENU - DISPLAY DOESNT EXIST";
    };

    if (isNil "RPUKCAMERA") then
    {
        throw "ERROR MAIN MENU - CAMERA MISSING?";
    };

    if (isNil "RPUKDummy") then
    {
        throw "ERROR MAIN MENU - CHARACTER MISSING?";
    };

    private _returnB = _display displayCtrl 2401;
    private _continueB = _display displayCtrl 2400;

    RPUKCAMERA cameraEffect ["TERMINATE","BACK"];
    camDestroy RPUKCAMERA;
    RPUK_Cam_Degree = nil;

    //Bye Dummy!
    deleteVehicle RPUKDummy;

    _display displayRemoveAllEventHandlers "MouseButtonDown";
    _display displayRemoveAllEventHandlers "MouseButtonUp";
    _display displayRemoveAllEventHandlers "MouseMoving";
    _display displayRemoveAllEventHandlers "KeyDown";

    _continueB ctrlRemoveAllEventHandlers "ButtonClick";
    _returnB ctrlRemoveAllEventHandlers "ButtonClick";

    closeDialog 0;
}
catch
{
    diag_log _exception;
};
