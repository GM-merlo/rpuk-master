/* 
	File: fn_auctionCar.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-27 17:45:32
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-10 15:38:40
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(playerSide != civilian) exitWith {}; //Not a civi, we dont want the people who are not civilians auctioning cars*9.
ctrlEnable[2812,false];
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"; ctrlEnable[2812,true];};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;

if(_vehicle in ["B_Quadbike_01_F","I_MRAP_03_F","B_MRAP_01_F"]) exitWith {hint "The vehicle you selected is not allowed to be auctioned."; ctrlEnable[2812,true];};

_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"; ctrlEnable[2812,true];};
closeDialog 0;

if(!createDialog "auctionSubmitMenu") exitWith {}; 
_display = findDisplay 13750;
_text = _display displayCtrl 1100;
_vehicleInfo = [_vehicle] call life_fnc_fetchVehInfo;
_text ctrlSetStructuredText parseText format["<t size='1.1'><img image='%1' size='1.5'/> Creating listing for: %2</t><br/>Please note that aBay will deduct 5%3 from the winning bid.",_vehicleInfo select 2, _vehicleInfo select 3,"%"];
life_auctioning_car_data = [_vid,_vehicle]; //Store the VID