/*
	File: fn_busdriveFinish.sqf
	Author: Bryan "Tonic" Boardwine, Ciaran Langton, TinyBigJacko

	Description:
	Finishes the bus mission leg and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_busdrive_in_progress = false;
life_busdrive_point = nil;
_dis = round((getPos life_busdrive_start) distance (getPos _dp));
_price = round(life_busdrive_pay_per_m * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
sleep 3;
[10] call life_fnc_addxp; //15 stops per round, 30mins per round, equiv abt 300XP per hour
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
RPUK_dosh = RPUK_dosh + _price;
