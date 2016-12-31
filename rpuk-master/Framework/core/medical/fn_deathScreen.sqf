/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsText = ((findDisplay 7300) displayCtrl 1104);

waitUntil {!isNil 'life_corpse'};

waitUntil {
	/*_nearby = 99999;
	{
		if (side _x == independent && alive _x && _x != player) then
		{
			_distance = (getPosATL life_corpse) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;*/
	if(!(life_bloodActionPlaying)) then {life_bloodActionPlaying = true; [(floor(random (85))) + 5] call life_fnc_deadBloodEffect;};
	/*_output = format["Medics Online: %1<br/>",[independent] call life_fnc_playerCount];
	if (_nearby == 99999) then { _output = _output +  format["Nearest Medic: None Near<br/>",_nearby]; }
	else { _output = _output + format["Nearest Medic: %1m<br/>",[(round _nearby)] call life_fnc_numberText]; };
	_medicsText ctrlSetStructuredText parseText _output;*/
	sleep 1;
	(isNull (findDisplay 7300))
};
