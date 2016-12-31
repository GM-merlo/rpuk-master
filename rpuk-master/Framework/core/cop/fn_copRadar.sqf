/*
	@Version: 1.0
	@Author: Tonic, TinyBigJacko
	@Edited: 30.03.2014
*/ 
if(playerSide != west) exitWith {};
private ["_speed","_vehicle"];
//systemchat "handheld radar triggered";
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if(!(currentWeapon player in ["hgun_P07_snds_F","hgun_Rook40_snds_F"])) exitWith {};

[[player, "RadarBleeps",10],"life_fnc_playSound",true,false] spawn life_fnc_MP; //Only play radar bleeps if weapon is out.

if(_vehicle isKindOf "Car") then
{
	switch (true) do 
	{
		case ((_speed > 50 && _speed <= 110)): 
		{	
			hint parseText format ["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#ffff00'><t align='center'><t size='1'>Vehicle Speed: %1 km/h",round _speed]; //amber
		};
		
		case ((_speed > 110)): 
		{	
			hint parseText format ["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#ff0000'><t align='center'><t size='1'>Vehicle Speed: %1 km/h",round _speed]; //red
		};
		
		default
		{
			hint parseText format ["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#00ff00'><t align='center'><t size='1'>Vehicle Speed: %1 km/h",round _speed]; //green
		};
	};
};