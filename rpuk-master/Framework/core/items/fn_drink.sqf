/*
	File: fn_drink.sqf
	Author: Ciaran Langton
	Desc: Makes the player drink a bottle of x and then apply the appropriate BAC levels and effects.
*/
_item = [_this,0,"",[""]] call BIS_fnc_param; //Derp...
if(_item == "") exitWith {};

_bac = switch (_item) do {
	case "beer": {0.11};
	case "whisky": {0.08};
	case "shandy": {0.05};
	case "cider": {0.095};
};

[false,_item,1] call life_fnc_handleInv; //Take the item

life_thirst = 100; //even booze quenches thirst! NDJ 18-07-16

life_drinkypoo = life_drinkypoo + _bac;

if(life_drinkypoo > 0.11) then {
	//Oh dear, looks like we are very drunk !
	hint "You are over 0.11 BAC (Blood Alchohol Content). Please do not drive/operate machinery!";
	[player,format["Went over 0.11 BAC. Current BAC: %1",life_drinkypoo]] call life_fnc_medilogSubmit;
} else {

	//Hacky way to upper case the first letter.
	_charArr = toArray(_item);
	_firstChar = _charArr select 0;
	_firstChar = toString ([_firstChar]);
	_firstChar = toUpper (_firstChar);
	_firstChar = toArray (_firstChar);
	_charArr set[0,(_firstChar select 0)];

	_str = toString (_charArr);

	hint format["You take a drink of %1 in moderation. You are under the legal limit.",_str];
};
player setVariable["bac",life_drinkypoo,true];
//[] call life_fnc_hudUpdate;

/*
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

for "_i" from 0 to 59 do
{
	if(!alive player) exitWith {}; //IF THEY ARE DEAD ALREADY EXIT HERE
    if(life_drinkypoo > 0.12) then {
		"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
		"chromAberration" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
		"radialBlur" ppEffectCommit 1;

		_mod = (life_drinkypoo * 5);
		//They are really drunk, 10% chance they will drop dead.
		if(_mod > 9) then {
			if(random 100 < 90) exitWith {
			};
		};

		//TODO - RANDOM CHANCE OF GETTING KNOCKED OUT IF WE ARE SO DRUNK

		if(_mod < 1) then {_mod = 1;};
		if(_mod > 8) then {_mod = 7; hint "I feel really sick..";};
		addcamShake[_mod, _mod, _mod];
		sleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.05,random 0.05,true];
		"chromAberration" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.4,0.4];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 1, 1, random 1];
		sleep 1;
	};
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;
//END EFFECTS
resetCamShake;
*/
