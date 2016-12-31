/* 
	File: fn_jailBreakout.sqf
	Author: Ciaran Langton
	Date: 19/10/2014
	Desc: Initiates a prison breakout, this is our new way to break people out of Jail!
*/
params [
	["_unit",objNull,[objNull]]
];

//Series of checks.... (YAY)
if(isNull _unit) exitWith {};
if(!alive player) exitWith {};
if(playerSide != civilian) exitWith {hint "Only civilians can do this!";};
if(vehicle player != player) exitWith {hint "You need to be outside of your vehicle!";};
if(currentWeapon player == "" || currentWeapon player == "Binocular") exitWith {hint "The guards do not feel threatened in any way, go home hobo!";};
if(life_inv_boltcutter < 1) exitWith {hint "You need boltcutters to initiate a prison break!";};	
//if({side _x == west} count playableUnits < 4) exitWith {hint "There needs to be four or more cops online for you to initiate a robbery!";};
if(_unit getVariable["inbreakout",false]) exitWith {hint "Someone is already breaking out the prisoners!";};
if(time - (_unit getVariable["lastbreakout",-9000]) < 500) exitWith {hint "The jail is currently under lockdown and you are unable to get near to the walls."};
//Woo-We have everything we need and all is well. Lets start by setting some variables.
_unit setVariable["lastbreakout",time,true];
_unit setVariable["inbreakout",true,true];

[1,"Somebody is attempting to break prisoners out of the jail! Go and stop them fast!"] remoteExecCall ["life_fnc_broadcast",west]; //Give the cops a hint
[0,"Somebody is attempting to break prisoners out of the jail!"] remoteExecCall ["life_fnc_broadcast",-2]; //Give everyone a systemchat

hint "You are currently breaking prisoners out of the prison, you need to stay within 50 meters of your current location or you will stop the breakout. The breakout will take around four minutes to complete.";

[[_unit,player],"life_fnc_breakoutTimer",true] spawn life_fnc_MP; //Show the countdown to all prisoners, cops and the player.

//Alarm Bell
_unit spawn {
	for "_i" from 0 to 20 do {
		[[_this, "jailbreak",1000],"life_fnc_playSound",true,false] spawn life_fnc_MP;	
		sleep 2.087;
	};
};

_time = time + (4 * 60);

//Lazy loop to do some status checks on the breakout.
_ok = true;
for "_i" from 0 to 1 step 0 do 
{
	if(round(_time - time) < 1) exitWith {_ok = true;}; //Times up
	if(!alive player) exitWith {_ok = false;};
	if(player distance _unit > 50) exitWith {_ok = false;};
	if(life_istazed OR life_isknockedout) exitWith {_ok = false;};
	if(player getVariable["restrained",false]) exitWith {_ok = false;};
	sleep 1;
};
_unit setVariable["inbreakout",false,true]; //Stop the clock, and the breakout prevention aswell.

if(_ok) then {
	[1,"The jailbreak ended with people being broken out. They are now on the run from the law!"] remoteExecCall ["life_fnc_broadcast",west]; //Give the cops a hint
	[0,"The jailbreak ended with people being broken out. They are now on the run."] remoteExecCall ["life_fnc_broadcast",-2]; //Give everyone a systemchat
	[[profileName],"life_fnc_jailBreakoutCompleted",true,false] spawn life_fnc_MP;
} else {
	hint "You failed to break out any prisoners.";	
	[1,"The jailbreak ended with no people being broken out. Good work police!"] remoteExecCall ["life_fnc_broadcast",west]; //Give the cops a hint
	[0,"The jailbreak ended with no people being broken out."] remoteExecCall ["life_fnc_broadcast",-2]; //Give everyone a systemchat
};