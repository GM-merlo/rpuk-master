/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if(life_is_processing) exitWith {};
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	//NDJ 290716 - REMEMBER TO CROSS CHECK AGAINST fn_removeItem.sqf to keep these XP processed XP amounts in line with the removal deductions!


  //Tier Zero - Takes 90 of these for level 1
  case "tobacco": {["tobaccoleaves","tobacco",0,"Drying Tobacco...", 2]};

  //Tier One - Takes 36 of these items to reach LVL 1
  case "lumber": {["log","lumber",0,"Sawing Logs...", 5]};
  case "bbanana": {["sbanana","bbanana",0,"Bending Bananas...", 5]};
  case "fries": {["potato","fries",0,"Frying Fries...", 5]};
  case "cider": {["apple","cider",0,"Making Cider...", 5]};
  case "wood": {["wood","woodp",0,"Processing Wood into Planks", 5]};
  case "cigarettes": {["tobacco","cigarette",0,"Rolling Cigarettes...", 5]};

  //Tier Two - Takes 18 of these items to reach LVL 1
  case "chocolate": {["cocoa","chocolate",0,"Mixing Chocolate...", 10]};
  case "pearl": {["clam","pearl",0,"Opening Clams...", 10]};
  case "sand": {["sand","glass",650,(localize "STR_Process_Sand"), 10]};
  case "salt": {["salt","salt_r",450,(localize "STR_Process_Salt"), 10]};
  case "cement": {["rock","cement",350,(localize "STR_Process_Cement"), 10]};

  //Tier Three - Takes 12 of these to reach LVL 1
  case "sugar": {["sugarcane","sugar",0,"Refining Sugar...", 15]};
  case "copper": {["copperore","copper_r",18,(localize "STR_Process_Copper"), 15]};

  //Tier Four - Takes 9 of these to reach LVL 1.
  case "iron": {["ironore","iron_r",17,(localize "STR_Process_Iron"), 20]};
  case "oil": {["oilu","oilp",1200,(localize "STR_Process_Oil"), 20];};
  case "diamond": {["diamond","diamondc",23,(localize "STR_Process_Diamond"), 20]};

  //Illegal - Minus XP, takes 36 of these items to level down from LVL 1 to LVL 0.
  case "heroin": {["heroinu","heroinp",2100,(localize "STR_Process_Heroin"), -5]};
  case "meth": {["ephedrine","crystalmeth",4000,"Mixing Chemicals...", -5]};
  case "lsd": {["frogleg","lsd",0,"Cooking Hermit LSD...", -5]};
  case "marijuana": {["cannabis","marijuana",29,(localize "STR_Process_Marijuana"), -5]};
  case "cocaine": {["cocaine","cocainep",45,(localize "STR_Process_Cocaine"), -5]};
  case "crocodile": {["crocodile","crocshoes",0,"Skinning Crocodiles...", -5]};


	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
private _xp = _itemInfo select 4;

//Cooking!
if(_type == "meth" && uniform player != "") exitWith {hint "You must have no clothes on to cook meth! Take them off!";};
if(_type == "meth") then {
	_vendor spawn {
		_smk = "SmokeShellBlue" createVehicle (position _this);
		sleep 60;
		deleteVehicle _smk;
	};
};

if(_type in ["wood","lsd","cider","pearl","chocolate","lumber","sugar","bbanana","tobacco","cigarettes","crocodile"]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_olditemName = [([_oldItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

_profType = switch (_type) do
{
	case "cocaine": {"coke"};
	default {_type};
};

_speedUp = [format["profession_%1",_profType]] call life_fnc_getProfessionlevel;

_time = 0.3 - (_speedUp / 300);
if(!(_hasLicense)) then {_time = 0.9 - (_speedUp / 300);};
if(_time < 0.001) then {_time = 0.001;};


if(_hasLicense) then
{
	for "_i" from 0 to 1 step 0 do
	{
		sleep _time;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName,_olditemName],"PLAIN"];

	if (worldName == "Tanoa") then {
		//Issue XP - positive XP all the time, negative XP only between 7am and 7pm
		if (( _xp > 0 ) || {(_xp < 0) && (daytime > 7) && (daytime < 19)} ) then {
			[_xp * _oldVal] call life_fnc_addXP;
		};
	};
	
	life_is_processing = false;
}
	else
{
	if(RPUK_dosh < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	for "_i" from 0 to 1 step 0 do
	{
		sleep _time;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(RPUK_dosh < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText,_olditemName],"PLAIN"];
	RPUK_dosh = RPUK_dosh - _cost;

	if (worldName == "Tanoa") then {
		//Issue XP - positive XP all the time, negative XP only between 7am and 7pm
		if (( _xp > 0 ) || {(_xp < 0) && (daytime > 7) && (daytime < 19)} ) then {
			[_xp * _oldVal] call life_fnc_addXP;
		};
	};

	life_is_processing = false;
};
