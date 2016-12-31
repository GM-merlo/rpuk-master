#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex & Modified by Ciaran
*/
private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Text to: %1",name life_smartphoneTarget]];
		if((__GETC__(life_wilcorank) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["No person selected!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["You sent %1 a message: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["There are no police online. Please try again later!"];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "The Police";
		hint format["You sent %1 a message: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "ALUK Administration Team";
		hint format["You sent %1 a message: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Sorry, there are no doctors on duty at this time."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "You must enter a message to send!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["You have sent a message to all EMS Units.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_wilcorank) < 1) exitWith {hint "You are not an admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Please select a player!"];};
		if(_msg == "") exitWith {hint "You must enter a message to send!";};
		[[life_smartphoneTarget,_msg,player,4],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Message Sent To: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_wilcorank) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_wilcorank) < 1) exitWith {hint "You are not an admin!";};
		if(_msg == "") exitWith {hint "You must enter a message to send!";};
		[[ObjNull,_msg,player,5],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Message Sent To All: %1",_msg];
		closeDialog 887890;
	};

	//taxirequest
	case 8:
	{
		if(_msg == "") exitWith {hint "You must enter a message to send!";};
		_msg = format["%1 - GRIDREF: %2",_msg,mapGridPosition player];
		[[ObjNull,_msg,player,6],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["You have sent a message to all online Taxi Drivers"];
		closeDialog 887890;
	};

	//aracrequest
	case 9:
	{
		if(_msg == "") exitWith {hint "You must enter a message to send!";};
		_msg = format["%1 - GRIDREF: %2",_msg,mapGridPosition player];
		[[ObjNull,_msg,player,7],"CELL_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["You have sent a message to all online ARAC units."];
		closeDialog 887890;
	};
};