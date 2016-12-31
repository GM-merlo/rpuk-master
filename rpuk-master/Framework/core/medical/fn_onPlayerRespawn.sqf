/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
//private["_containers"];
life_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{_x hideObjectGlobal true;} foreach life_containers; //Hide the containers.

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.

_unit spawn {
	_unit = _this;
		
	switch(playerSide) do
	{
		case west: {
			_handle = [] spawn life_fnc_copLoadout;
		};
		case civilian: {
			_handle = [] spawn life_fnc_civLoadout;
		};
		case independent: {
			_handle = [] spawn life_fnc_medicLoadout;
		};
		waitUntil {scriptDone _handle};
	};
	[] spawn SOCK_fnc_updateRequest;
	_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
	player playMoveNow "amovppnemstpsraswrfldnon";
	player enableFatigue false;
	[] call life_fnc_setupActions;
	[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
	if(call life_wilcorank > 0) then {[[player],"TON_fnc_adminChatJoin",false,false] spawn life_fnc_MP;}; //If admin then send a request to join adminchat channel.
};