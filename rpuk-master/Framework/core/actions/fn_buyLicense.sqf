/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

_action = true;

if(RPUK_dosh < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

if((_license select 0) in ["license_civ_bounty","license_civ_rebel"]) then {_action = [false] call life_fnc_licenseSwap;}; //If its a rebel or bounty license, send message
if((_license select 0) in ["license_civ_taxi","license_civ_arac"]) then {_action = [true] call life_fnc_licenseSwap;}; //If its a taxi or arac license, send message
if(!_action) exitWith {};
RPUK_dosh = RPUK_dosh - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];
playSound "buy";
