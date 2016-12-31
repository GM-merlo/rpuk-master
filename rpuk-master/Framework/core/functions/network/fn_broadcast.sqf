/*
	File: fn_broadcast.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Broadcast system used in the life mission for multi-notification purposes.
*/
params [
	["_type",0,[[],0]],
	["_message","",[""]]
];

if(_message == "") exitwith {};

if(_type isEqualType []) then
{
	for "_i" from 0 to (count _type)-1 do
	{
		switch((_type select _i)) do
		{
			case 0: {systemChat _message};
			case 1: {hint format["%1", _message]};
			case 2: {titleText[format["%1",_message],"PLAIN"];};
			case 3: {hint parseText format["%1", _message];};
			case 4: {if(life_capture_point != -1) then {hintSilent parseText format["%1", _message];};};
		};
	};
}
	else
{
	switch (_type) do
	{
		case 0: {systemChat _message};
		case 1: {hint format["%1", _message]};
		case 2: {titleText[format["%1",_message],"PLAIN"];};
		case 3: {hint parseText format["%1", _message];};
		case 4: {if(life_capture_point != -1) then {hintSilent parseText format["%1", _message];};};
	};
};