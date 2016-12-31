/*
	File: functions.sqf

	Author: Tonic, Ciaran Langton
	Date: 2015-03-15 01:40:11
	Last Modified by: Ciaran
	Last Modified time: 2015-11-24 18:13:04
*/
life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};
	[[player,life_sidechat,playerSide],""TON_fnc_managesc"",false,false] spawn life_fnc_MP;
	if(call life_wilcorank > 0) then {[[player],""TON_fnc_adminChatJoin"",false,false] spawn life_fnc_MP;};
	[] call life_fnc_settingsMenu;
";

publicVariable "life_fnc_sidechat";

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack"",""_return""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[[RPUK_doshinbank,RPUK_dosh,owner player,player,license_civ_rebel,call life_fnc_getLevel,round((call life_fnc_getXPProgress) * 100)],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(isNil '_val' || isNil '_from') exitWith {hint ""ALERT - A malformed money transfer was sent to you, please report this to an admin ASAP!""};
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	if(_val < 0 || _val > 999999) exitWith {hint ""ALERT - A malformed money transfer was sent to you, please report this to an admin ASAP!""};
	RPUK_doshinbank = RPUK_doshinbank + _val;
	hint format[""%1 has wire transferred £%2 to you."",_from,[_val] call life_fnc_numberText];
	[[_from,player,_val, ""atmreceive""],""TON_fnc_MoneyRecord"",false,false] spawn life_fnc_MP;

";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		life_my_gang_rank = 1;
		player setVariable['gangrank',life_my_gang_rank,true];
		[] call SOCK_fnc_updateRequest;
		[player] joinSilent (createGroup civilian);
		hint ""You have been kicked out of the gang. / You left the gang."";

	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 has given you keys for a %2"",_giver,_name];
		life_vehicles pushBack _vehicle;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""You have been made the new leader."";
		life_my_gang_rank = 4;
		player setVariable['gangrank',life_my_gang_rank,true];
		[] call SOCK_fnc_updateRequest;
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging
/*
	-TON_fnc_cell_textmsg
	-TON_fnc_cell_textcop
	-TON_fnc_cell_textadmin
	-TON_fnc_cell_adminmsg
	-TON_fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3022,true];};

	[[_msg,name player,5],""CELL_fnc_clientMessage"",independent,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""You have sent a message to all EMS Units."",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""You must select a player you are sending the text to!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3015,true];};

	[[_msg,name player,0],""CELL_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3016,true];};

	[[_msg,name player,1],""CELL_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3017,true];};

	[[_msg,name player,2],""CELL_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isDedicated) exitWith {};
	if((call life_wilcorank) < 1) exitWith {hint ""You are not an admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";};

	[[_msg,name player,3],""CELL_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Admin Message Sent To: %1 - Message: %2"",name _to,_msg];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isDedicated) exitWith {};
	if((call life_wilcorank) < 1) exitWith {hint ""You are not an admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";};

	[[_msg,name player,4],""CELL_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Admin Message Sent To All: %1"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
CELL_fnc_clientMessage =
compileFinal "
	if(isDedicated) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = ""You have received a new message, press Y and go to your mobile to read it!"";
			hint parseText format[""<t color='#FFCC00'><t size='2'><t align='center'>New Message</t></t>""];
			systemChat _message;
			playSound ""message"";
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""---999 EMERGENCY CALL FROM %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>999 Emergency Call<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Officers<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			playSound ""message"";
			[""PoliceDispatch"",[format[""999 Emergency Call From: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2 :
		{
			if(isNil 'life_wilcorank') exitWith {};
			if((call life_wilcorank) < 1) exitWith {};
			private[""_message""];
			_message = format[""???ADMIN REQUEST FROM %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			playSound ""message"";
			[""AdminDispatch"",[format[""%1 Has Requested An Admin!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""!!!ADMIN MESSAGE: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			playSound ""message"";
			[""AdminMessage"",[""You Have Received A Message From An Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_wilcorank) > 0) then {systemChat _admin;};
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN MESSAGE: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			playSound ""message"";
			[""AdminMessage"",[""You Have Received A Message From An Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_wilcorank) > 0) then {systemChat _admin;};
		};

		case 5: {
			private[""_message""];
			_message = format[""!!!EMS REQUEST: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			playSound ""message"";
			[""TextMessage"",[format[""EMS Request from %1"",_from]]] call bis_fnc_showNotification;
		};

		case 6: {
			if(isNil 'license_civ_taxi') exitWith {};
			if(!(license_civ_taxi)) exitWith {};
			private[""_message""];
			_message = format[""---TAXI REQUEST FROM %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Taxi Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Taxi Drivers<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			playSound ""message"";
			systemChat _message;
		};

		case 7: {
			if(isNil 'license_civ_arac') exitWith {};
			if(!(license_civ_arac)) exitWith {};
			private[""_message""];
			_message = format[""---ARAC Repair REQUEST FROM %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>ARAC Repair Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Repair Trucks<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			playSound ""message"";
			systemChat _message;
		};
	};
";
publicVariable "CELL_fnc_clientMessage";
