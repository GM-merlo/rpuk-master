/*
    File: fn_drugUse.sqf
    Author: Ciaran Langton

    Description:
    Applys effects on using heroin.
*/
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};
closeDialog 0;

hint "Winners don't use drugs! (They do really!)";

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;


switch (_item) do
{
	case "marijuana":
	{
		[] spawn {
			if(isNull life_smoke) then
			{
				life_smoke = "SmokeShell" createVehicle getPos player;
				life_smoke attachTo[player,[0,0,0],"Pelvis"];
				sleep 60;
				deleteVehicle life_smoke;
			};
		};
		for "_i" from 0 to 44 do
		{
		    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
		    "chromAberration" ppEffectCommit 1;
		    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
		    "radialBlur" ppEffectCommit 1;
		    addcamShake[random 3, 1, random 3];
		    sleep 1;
		};
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
	};

	case "heroinp":
	{
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		sleep 44;
		"colorCorrections" ppEffectAdjust [0, 0, 0, [0,0,0,0], [0,0,0,0], [0,0,0,0]];
		"colorCorrections" ppEffectEnable false;
	};

	case "cocainep":
	{
		hint "You feel terrific!!";
		addcamShake[random 3, random 3, random 3];
	};

	default {};
};