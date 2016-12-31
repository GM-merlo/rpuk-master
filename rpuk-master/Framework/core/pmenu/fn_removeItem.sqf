/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind","_xpDeduct"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "You didn't select anything to remove.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format."};
if(parseNumber(_value) <= 0) exitWith {hint "You need to enter an actual amount you want to remove."};

if((player getVariable["restrained",false])) exitWith {hint "You can't remove items while you're restrained!";};
if((player getVariable["Revive",false])) exitWith {hint "You can't remove items while you're being revived!";};
if(life_istazed) exitWith {hint "You can't remove items while you're being tased!";}; //Tazed
if(life_isknockedout) exitWith {hint "You can't remove items while you're knocked out!";}; //Knockedout

_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits) && (playerSide != west)) exitWith {hint "This is an illegal item and cops are nearby, you cannot dispose of the evidence";};
if(player != vehicle player) exitWith {hint "You cannot remove an item when you are in a vehicle."}; //changed to hint, cos titletext is behind Y-menu otherwise - NDJ 21/07/16
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Couldn't remove that much of that item, maybe you don't have that amount?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;

_xpDeduct = switch (_data) do
{
	//NDJ 290716 - REMEMBER TO CROSS CHECK AGAINST fn_processAction.sqf to keep these XP deductions in line with the processed XP amounts!

  //Tier Zero
  case "tobacco": {-2};

  //Tier One - Takes 36 of these items to reach LVL 1
  case "lumber": {-5};
  case "bbanana": {-5};
  case "fries": {-5};
  case "cider": {-5};
  case "wood": {-5};
  case "cigarette": {-5};

  //Tier Two - Takes 18 of these items to reach LVL 1
  //case "crocshoes": {-10};
  case "chocolate": {-10};
  case "pearl": {-10};
  case "glass": {-10};
  case "salt_r": {-10};
  case "cement": {-10};

  //Tier Three - Takes 12 of these to reach LVL 1
  case "sugar": {-15};
  case "copper_r": {-15};

  //Tier Four - Takes 9 of these to reach LVL 1.
  case "oilp": {-20;};
  case "diamondc": {-20};
  case "iron_r": {-20};
  
  default {0};
};

if (_xpDeduct < 0 && (worldName == "Tanoa")) then {
	//take off XP equal to what they earned for processing this!
	[(parsenumber _value) * _xpDeduct] call life_fnc_addxp;
} else {
	hint format["You have successfully removed %1 %2 from your inventory.",(parseNumber _value), _type];
};
[] call life_fnc_p_updateMenu;