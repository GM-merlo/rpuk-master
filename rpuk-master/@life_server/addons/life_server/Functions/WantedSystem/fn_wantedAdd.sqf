/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Death by Dangerous Driving",6000]};
	case "187VP": {_type = ["Cop-Killer (by Vehicle)",10000]};
	case "187": {_type = ["Murder/Manslaughter",8000]};
	case "187P": {_type = ["Cop-Killer",10000]};
	case "901": {_type = ["Escaping Prison",10000]};
	case "215": {_type = ["Attempted Theft of Vehicle",500]};
	case "211": {_type = ["Armed Robbery",1000]};
	case "487": {_type = ["Vehicle Theft",1000]};
	case "481": {_type = ["Drug Possession",500]};
	case "482": {_type = ["Intent to Supply",500]};
	case "483": {_type = ["Drug Trafficking",5000]};
	case "148": {_type = ["Perverting Course of Justice",750]};
	case "148H": {_type = ["Resisting Arrest",100]};
	case "459": {_type = ["Burglary",1000]};
	case "460": {_type = ["Breaking and Entering",500]};

	//CUSTOM TYPES
	case "1": {_type = ["Dangerous Driving",200]};
	case "2": {_type = ["Resisting Arrest",100]};
	case "3": {_type = ["Failing to Stop",500]};
	case "4": {_type = ["Public Firearm Exposure",150]};
	case "5": {_type = ["Terrorism",10000]};
	case "6": {_type = ["Improper use of Aviation",2500]};
	case "7": {_type = ["Attempted Murder",4000]};
	case "8": {_type = ["GBH",1500]};
	case "9": {_type = ["ABH",1000]};
	case "10": {_type = ["Public Order Act",175]};
	case "11": {_type = ["Perverting course of Justice",150]};
	case "12": {_type = ["Possession of an illegal firearm",750]};
	case "13": {_type = ["Harbouring a fugitive",100]};
	case "14": {_type = ["Escaping custody",200]};
	case "15": {_type = ["Rioting",300]};
	case "16": {_type = ["Harassment",150]};
	case "17": {_type = ["Driving under the Influence",200]};
	case "18": {_type = ["Conspiring to Murder",1000]};
	case "19": {_type = ["Kidnapping",2000]};
	case "20": {_type = ["Threatening to Commit Murder",500]};
	case "21": {_type = ["Verbal Assault",75]};
	case "22": {_type = ["Speeding - populated",500]};
	case "23": {_type = ["Speeding - unpopulated",250]};
	case "24": {_type = ["Vandalism",75]};
	case "25": {_type = ["Driving without Headlights",75]};

	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_player = objNull;
{
	if(getPlayerUID _x == _uid) then {
		_player = _x;
	};
} forEach playableUnits;
if(isNull _player) exitWith {};

[[_type,_name,_uid],"life_fnc_addCrime",_player,false] spawn life_fnc_MP; //Tell the player they are now wanted.