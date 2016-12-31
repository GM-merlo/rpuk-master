/* 
	Name: fn_raceStart.sqf
	Author: Ciaran Langton
	Desc: Starts the race!
*/
//If it is the server (the man is local to the server)
if(isServer) then {

	_ai = life_race_ai;
	_ai setVariable["inoperation",true,true];
	_near = nearestObjects [position _ai,["Man"],100];

	_startengines = "<t color='#FF0000'><t size='2'>Start Your Engines!</t></t>";
	_begin = "<t color='#FF0000'><t size='2'>The Race Has Begun!</t></t>";

	{
		if(!isNull _x && isPlayer _x) then {[3,_startengines] remoteExecCall ["life_fnc_broadcast",_x];}
	} forEach _near;

	_ai = life_race_ai;
	_ai setAmmo ["hgun_Pistol_Signal_F", 1000000];
	_ai playMove "Acts_starterPistol_fire";
	sleep 3;
	_ai setAmmo [(currentWeapon _ai),6];
	_ai fire (currentWeapon _ai);

	{
		if(!isNull _x && isPlayer _x) then {[3,_begin] remoteExecCall ["life_fnc_broadcast",_x];}
	} forEach _near;
	_ai setVariable["inoperation",false,true];

} else {
	if(life_race_ai getVariable["inoperation",false]) exitWith {hint "I am already starting the race!";};
	_time = 0;
	if(isNil "life_race_cooldown") then {
		life_race_cooldown = time;
	} else {
		_time = time - life_race_cooldown;
	};
	if(_time < 15) exitWith {hint "I am not going to do this over and over for you sir! I will do it only once per 15 seconds.";};
	life_race_cooldown = time;
	
	[[],"life_fnc_raceStart",false,false] spawn life_fnc_MP;
};
