/*
	File: fn_skinAnimal.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Skins the animal in question.
*/
private["_animal","_type"];
_animal = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(alive _animal) exitWith {};
switch(typeOf _animal) do
{
	case "Cock_random_F";
	case "Hen_random_F" : {_type = "chicken"};

	case "Goat_random_F" : {_type = "goat"};
 
	case "Sheep_random_F" : {_type = "sheep"};
 
	//case "Alsatian_Random_F" : {_type = "dog"}; //NOoooOOOooo
	default {_type = ""};
};

if(_type == "") exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _animal;
	titleText[format[(localize "STR_NOTF_Fishing"),_type],"PLAIN"];
};