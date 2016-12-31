/* 
	File: fn_addWantedPlayer.sqf
	Desc: Adds the player to the wanted list.
	Author: Ciaran Langton
	Date: Cant remember. Was about xx/06/2014
*/
private["_display","_list","_offencelist","_chosenOffence","_chosenPlayer"];

disableSerialization;
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
_offencelist = _display displayCtrl 2903;

_chosenPlayer = lbData[2902,(lbCurSel 2902)];
_chosenOffence = lbData[2903,(lbCurSel 2903)];
if(_chosenPlayer == "" || _chosenOffence == "") exitWith {hint "Please select a player and a crime."};
_chosenPlayer = call compile format["%1", _chosenPlayer];
if(isNull _chosenPlayer || _chosenOffence == "") exitWith {hint "Please select a player and a crime."};

[[getPlayerUID _chosenPlayer, _chosenPlayer getVariable["realname",name _chosenPlayer], _chosenOffence],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
hint format["Added %1 to wanted list for %2.",_chosenPlayer getVariable["realname",name _chosenPlayer], (lbText[2903,(lbCurSel 2903)])];