/*
    RolePlay.co.uk
    Author: Rathbone
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

private _displayIndex = param [1,0,[0]];
private _display = findDisplay 56100;
private _list = _display displayCtrl 1500;

try
{
    if (isNil "RPUKShopInfo") then
    {
        throw "Error!";
    };
    if (!isClass(missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1))) then
    {
        throw "Bad Clothing Config";
    };

    lbClear _list;

    RPUK_ClothingFilter = -1;
    RPUK_ClothingFilter = _displayIndex;

    private _option = switch (_displayIndex) do
    {
        case 0:
        {
            getArray (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "uniforms");
        };
        case 1:
        {
            getArray (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "headgear");
        };
        case 2:
        {
            getArray (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "goggles");
        };
        case 3:
        {
            getArray (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "vests");
        };
        case 4:
        {
            getArray (missionConfigFile >> "CfgClothing" >> (RPUKShopInfo select 1) >> "backpacks");
        };
        default {""};
    };

    if (_option isEqualType "") then
    {
        throw "Selection Error";
    };

    {
        private _className = _x;
        private _requirement = getText (missionConfigFile >> "CfgShopSystem" >> "clothing" >> _className >> "requirement" >> str (playerSide));
        if (_requirement isEqualTo "") then
        {
            _requirement = compile "true";
        }
        else
        {
            _requirement = compile _requirement;
        };
        if (call _requirement) then
        {
          (["Clothing",_className] call life_fnc_itemUnlocked) params [
		        ["_locked", false, [false]],
		        ["_level", 0, [0]]
	        ];

          private _classNameInfo = [_className] call life_fnc_fetchCfgDetails;
          private _displayName = getText (missionConfigFile >> "CfgShopSystem" >> "clothing" >> _className >> "displayName" >> str (playerSide));
          private _description = if (_displayName isEqualTo "") then
          {
              (_classNameInfo select 1)
          }
          else
          {
              _displayName
          };
          private _text = [_description, format["%1 [%2]",_description,_level]] select _locked;
          private _index = _list lbAdd _text;
          _list lbSetPicture [_index,(_classNameInfo select 2)];
          _list lbSetData [_index,_className];
          _list lbSetValue [_index,_forEachIndex];
          if (_locked) then
          {
            _list lbSetColor [_index,[0.55,0.05,0,1]];
          };
          _list lbSetCurSel 0;
        };
    } forEach _option;
}
catch
{
    hint _exception;
};
