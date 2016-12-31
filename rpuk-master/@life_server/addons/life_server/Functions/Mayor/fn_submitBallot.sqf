/* 
	File: fn_submitBallot.sqf
	
	Author: Ciaran Langton
	Date: 2015-01-29 18:52:14
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-18 20:44:50
*/
params [
	["_player",objNull,[objNull]],
	["_voteId",-1,[-1]]
];

if(isNull _player || _voteId == -1) exitWith {};

_result = [format["checkVoteStatus:%1",getPlayerUID _player],2,false] call DB_fnc_preparedCall;
_hasVoted = [_result select 0, 1] call DB_fnc_bool;
if(_hasVoted) exitWith {[1,format["You have already voted this term! Please wait for the next term to place another vote."]] remoteExecCall ["life_fnc_broadcast",_player]; life_mayor_voted = true; (owner _player) publicVariableClient "life_mayor_voted";};

[format["submitVote:%1:%2",getPlayerUID _player,_voteId],1] call DB_fnc_preparedCall;
[1,format["Vote completed."]] remoteExecCall ["life_fnc_broadcast",_player];

life_mayor_voted = true;
(owner _player) publicVariableClient "life_mayor_voted";