/* 
	File: fn_jobCentre.sqf
	Desc: Shows the message for the jobcentre
	Author: Ciaran Langton
*/
_job = [_this,0,"",[""]] call BIS_fnc_param;
if(_job == "") exitWith {}; //Error

_ret = switch(_job)do
{
	case "nhs":
	{
		[
			"The Altis NHS services provide medical services to the island of Altis!",
			"In order to join into the NHS you must go onto the forums and apply there.",
			"There are only three restrictions:
			You must be active
			You must be able to RP well.
			You must be Mature",
			"Apply at Roleplay.co.uk"
		]
	};

	case "cop":
	{
		[
			"TO BE WRITTEN"
		]
	};

	default {"Job Centre Error"};
};

"Job Centre" hintC _ret;