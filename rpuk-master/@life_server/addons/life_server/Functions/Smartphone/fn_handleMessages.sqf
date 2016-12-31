/*
	File: fn_handleMessages.sqf
	Author: Silex && Edits by Ciaran
*/	
	
private["_msg","_to","_target","_player","_type"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_msg = [_this,1,"",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,-1] call BIS_fnc_param;

switch(_type) do
{
	//normal message
	case 0:
	{
		if(isNULL _target) exitWith {};
		_to = call compile format["%1", _target];
		[[_msg,name _player,0],"CELL_fnc_clientMessage",_to,false] spawn life_fnc_MP;
		
		private["_query","_pid","_toID"];
		_pid = getPlayerUID _player;
		_toID = getPlayerUID _target;
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = name _player;
		_toName = name _target;
		//_query = format["INSERT INTO cellphone (fromID, toID, message, fromName, toName, remove) VALUES('%1', '%2', '""%3""', '%4', '%5', '0')",_pid,_toID,_msg,_fromName,_toName];
		waitUntil{!DB_Async_Active};
		[format["insertMessage:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName],1] call DB_fnc_preparedCall;
	};
	//message to cops
	case 1:
	{	
		[[_msg,name _player,1],"CELL_fnc_clientMessage",west,false] spawn life_fnc_MP;
	};
	//to admins
	case 2:
	{	
		[[_msg,name _player,2],"CELL_fnc_clientMessage",true,false] spawn life_fnc_MP;
	};
	//ems request
	case 3:
	{	
		[[_msg,name _player,5],"CELL_fnc_clientMessage",independent,false] spawn life_fnc_MP;
	};
	//adminToPerson
	case 4:
	{
		_to = call compile format["%1", _target];
		if(isNull _to) exitWith {};
	
		[[_msg,name _player,3],"CELL_fnc_clientMessage",_to,false] spawn life_fnc_MP;
	};
	//adminMsgAll
	case 5:
	{
		[[_msg,name _player,4],"CELL_fnc_clientMessage",true,false] spawn life_fnc_MP;
	};
	//Taxi Request
	case 6:
	{
		[[_msg,name _player,6],"CELL_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
	};
	//ARAC(Repair) Request
	case 7:
	{
		[[_msg,name _player,7],"CELL_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
	};
};