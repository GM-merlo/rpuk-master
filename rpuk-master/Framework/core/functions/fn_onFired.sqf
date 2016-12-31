/* 
	File: fn_onFired.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-26 16:10:52
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;
_weapon = _this select 2;

//Anti-Taze Spam
if(_weapon == "hgun_P07_snds_F" && playerSide == west) then {
	[] spawn {
		_time = time;
		while {time - _time < .75} do {
			player setWeaponReloadingTime [player, currentWeapon player, 2];
		};
	};
};

//Anti-Taze Spam for Black Tazer
if(_weapon == "hgun_Rook40_snds_F" && playerSide == west) then {
	[] spawn {
		_time = time;
		while {time - _time < .50} do {
			player setWeaponReloadingTime [player, currentWeapon player, 2];
		};
	};
};

//Launching a flashbang.
if(_ammoType == "GrenadeHand_stone" && playerSide == west) then {
	_sendTo = nearestObjects[player,["Man"],250];
	_sendToConfirmed = [];
	{if(isPlayer _x) then {_sendToConfirmed pushBack _x;};} forEach _sendTo;
	[[_projectile,player],"life_fnc_flashbangHandler",_sendToConfirmed,false] call life_fnc_MP;
};