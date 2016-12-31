#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.6
#define nameTagCfg missionConfigFile >> "CfgNameTags"
#define getNameTagIcon(SIDETYPE,RANKNUM) getText(nameTagCfg >> SIDETYPE >> RANKNUM >> "icon");
#define getNameTagText(SIDETYPE,RANKNUM) getText(nameTagCfg >> SIDETYPE >> RANKNUM >> "text");
#define getNameTag(SIDETYPE) case (!isNil {(_x getVariable (getText(nameTagCfg >> SIDETYPE >> "rankvar")))}): { \
					_var = getText(nameTagCfg >> SIDETYPE >> "rankvar"); \
					_rankPath = getText(nameTagCfg >> SIDETYPE >> "imgpath"); \
					_rankIcon = _rankPath + "\" + getText(nameTagCfg >> SIDETYPE >> format["R%1",(_x getVariable _var)] >> "icon"); \
					_rankText = getText(nameTagCfg >> SIDETYPE >> format["R%1",(_x getVariable _var)] >> "text"); \
				};
#define setNameTag(ICON,ICONTEXT) _rankIcon = ICON; _rankText = ICONTEXT;

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[
	(visiblePosition player),
	getArray(nameTagCfg >> "unitsToScan"),
	getNumber(nameTagCfg >> "unitsToScanDist")
];

//_units = _units - [player];

//Fix for hanging nametags on the screen
{
	_idc = _ui displayCtrl _x;
	_idc ctrlShow false;
} forEach life_nametags;
life_nametags = [];

//_units = _units - [player];

{
	private["_text"];
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	life_nametags pushBack (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {(!isNil {_x getVariable "realname"})}) then {
		_dist = 8;
		_pos = [
			visiblePosition _x select 0, 
			visiblePosition _x select 1, 
			((_x modelToWorld (_x selectionPosition "head")) select 2)+.65
		];
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < _dist}) then {
			_rankIcon = "";
			_rankText = "";
			_name = "";
			_hideName = false;
			_isP = isPlayer _x;
			switch (true) do {
				case (_isP && !alive _x): {_name = _x getVariable ["name", "Dead Body"]};
				case (_isP && {(uniform _x in life_noname_clothing)}): {_hideName = true;};
				case (_isP && {(headgear _x in life_hidden_clothing) || (goggles _x in life_hidden_clothing)}): {_name = "Unknown"; setNameTag("","Masked Player")};

				case (_isP && {getPlayerUID _x == life_mayor_settings select 0}): {setNameTag("","Altis Mayor")};
				case (_isP && {uniform _x in ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR"]}): {setNameTag("","<t color='#FF0000'>Admin on Duty</t>")};

				//DO NORMAL RANK DETAIL.
				getNameTag("POLICE");
				getNameTag("UNMC");
				getNameTag("NHS");

				case (_x in (units grpPlayer) && playerSide == civilian): {
					_name = format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];
					_rankText = (group _x) getVariable ["gang_name",""];
				};

				case (!isNil {(group _x) getVariable "gang_name"}): {
					_rankText = (group _x) getVariable ["gang_name",""];
				};

				case (!isNil {_x getVariable "rankText"} || !isNil {_x getVariable "rankIcon"}): {
					_rankIcon = _x getVariable["rankIcon",""];
					_rankText = _x getVariable["rankText",""];
				};
			};

			if(_name == "") then {_name = _x getVariable ["realname",name _x]};

			if(!(_hideName)) then {

				_text = [];
				_text pushBack "<t align='center'>";
				if(_rankIcon != "") then {_text pushBack format["<img image='%1' size='2.5'></img><br/>",_rankIcon];};
				_text pushBack format["<t size='1.8'>%1</t><br/>",_name];
				if(_rankText != "") then {_text pushBack format["<t size='1.3'>%1</t><br/>",_rankText];};	
				if(_x getVariable ["speaking",false]) then {_text pushBack "<t size='1.5' color='#B6B6B6'>[Speaking]</t><br/>"};
				_text pushBack "</t>";

				_textOut = "";
				{_textOut = _textOut + _x} forEach _text;

				_idc ctrlSetStructuredText parseText _textOut;
				_smallDist = 0.4;
				_smallDist = _smallDist + (_distance * 0.1);

				_idc ctrlSetPosition [(_sPos select 0) - 0.1, _sPos select 1, 0.4, 0.65];
				_idc ctrlSetScale scale;
				_idc ctrlSetFade 0;
				_idc ctrlCommit 0;
				_idc ctrlShow true;
			};
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;