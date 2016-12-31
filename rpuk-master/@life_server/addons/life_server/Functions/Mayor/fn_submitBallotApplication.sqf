/* 
	File: fn_submitBallotApplication.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-02 00:03:02
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-18 21:07:02
*/
params [
	["_player",objNull,[objNull]],
	["_ballotText","",[""]]
];

if(isNull _player || _ballotText == "") exitWith {};
if([_ballotText] call KRON_StrLen < 10 || [_ballotText] call KRON_StrLen > 1000) exitWith {}; //Incase somehow client validation does not catch this, do it here.
_name = _player getVariable["realname",name _player];
_pid = getPlayerUID _player;

_result = [format["checkBallotApplication:%1",_pid],2,false] call DB_fnc_preparedCall;
if(_result select 0 > 0) exitWith {[1,format["You have already entered a ballot application this term, or are currently in office."]] remoteExecCall ["life_fnc_broadcast",_player]; life_mayor_entered = true; (owner _player) publicVariableClient "life_mayor_entered";};

//Some sensitive chars need replacing first, so they dont get wiped out by mresString. , and "" mainly.
_ballotText = [_ballotText, ",", "¬"] call KRON_Replace;
_ballotText = [_ballotText, """", "~"] call KRON_Replace;
_ballotText = [_ballotText] call DB_fnc_mresString;

[format["submitBallotApplication:""%1"":""%2"":%3",_name,_ballotText,_pid],1,false] call DB_fnc_preparedCall;

[1,format["Thank you for running for mayor! Your application has been processed and people are now able to vote for you."]] remoteExecCall ["life_fnc_broadcast",_player]; 
life_mayor_entered = true;
(owner _player) publicVariableClient "life_mayor_entered";
life_lastBallotQueryTime = -1;