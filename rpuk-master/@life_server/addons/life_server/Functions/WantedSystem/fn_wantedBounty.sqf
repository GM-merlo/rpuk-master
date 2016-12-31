/*
	File: fn_wantedBounty.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Checks if the person is on the bounty list and awards the cop for killing them.
*/
private["_civ","_cop","_id","_half"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_cop = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_half = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ OR isNull _cop) exitWith {};

_wanted = _civ getVariable["life_crimes",[[],0]];
if(_wanted select 1 > 0) then { //Cash in pocket!
	_cash = _wanted select 1;
	if(_half) then
	{
		[[_cash / 2,_cash],"life_fnc_bountyReceive",(owner _cop),false] spawn life_fnc_MP;
	}
		else
	{
		[[_cash,_cash],"life_fnc_bountyReceive",(owner _cop),false] spawn life_fnc_MP;
	};
};