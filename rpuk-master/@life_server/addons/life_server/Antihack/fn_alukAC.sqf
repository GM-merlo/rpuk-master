/*
	File: fn_alukAC.sqf

	Author: Ciaran
	Date: 2015-12-18 20:17:19
	Last Modified by: Ciaran
	Last Modified time: 2015-12-29 02:18:41
*/
private _randomNumberGenerator = {
	_var = "";
	_randomLength = random(40);
	if(_randomLength < 10) then {_randomLength = 25};
	_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","GFY"];
	for "_i" from 0 to _randomLength do {
		_var = _var + (_letters call BIS_fnc_selectRandom);
	};
	ALUKAC_VARS pushBack _var;
	_var
};

private _antiHackVar = call _randomNumberGenerator; [format["_antiHackVar = %1",_antiHackVar],"SYSLOG"] call console;
private _kickMeVar = call _randomNumberGenerator; [format["_kickMeVar = %1",_kickMeVar],"SYSLOG"] call console;
private _stashReport = call _randomNumberGenerator; [format["_stashReport = %1",_stashReport],"SYSLOG"] call console;
private _broadcastAlert = call _randomNumberGenerator; [format["_broadcastAlert = %1",_broadcastAlert],"SYSLOG"] call console;
private _acIsActivated = call _randomNumberGenerator; [format["_acIsActivated = %1",_acIsActivated],"SYSLOG"] call console;
private _badVars = call _randomNumberGenerator; [format["_badVars = %1",_badVars],"SYSLOG"] call console;
private _scripts = call _randomNumberGenerator; [format["_scripts = %1",_scripts],"SYSLOG"] call console;
private _displayList = call _randomNumberGenerator; [format["_displayList = %1",_displayList],"SYSLOG"] call console;
private _allowedChildren = call _randomNumberGenerator; [format["_allowedChildren = %1",_allowedChildren],"SYSLOG"] call console;
private _adminMenu = call _randomNumberGenerator; [format["_adminMenu = %1",_adminMenu],"SYSLOG"] call console;
private _safeVars = call _randomNumberGenerator; [format["_safeVars = %1",_safeVars],"SYSLOG"] call console;
private _completedScans = call _randomNumberGenerator; [format["_completedScans = %1",_completedScans],"SYSLOG"] call console;
private _skipScan = call _randomNumberGenerator; [format["_skipScan = %1",_skipScan],"SYSLOG"] call console;

private _alreadyKnownVars = allVariables missionNamespace + allVariables uiNamespace;

{_alreadyKnownVars pushBack (_x select 0);} forEach (call life_professionCfg);

_alreadyKnownVars = _alreadyKnownVars + ALUKAC_VARS;

[format["Safe var count: %1",count ALUKAC_VARS],"SYSLOG"] call console;
[format["No Scan Var count: %1",count _alreadyKnownVars],"SYSLOG"] call console;

call compile('
	ALUKAC_fnc_'+_stashReport+' = ALUKAC_fnc_stashReport;

	'+_adminMenu+' = toArray(str(ALUKAC_fnc_adminCode));
	'+_adminMenu+' = compileFinal str('+_adminMenu+');
	publicVariable "'+_adminMenu+'";

	'+_skipScan+' = compileFinal(''' + str(_alreadyKnownVars) + ''');
	publicVariable "'+_skipScan+'";

	'+_antiHackVar+' = {

		bis_menu_groupcommunication = compileFinal ''true'';

		_'+_badVars+' = [
			"JxMxE_hide","JME_Keybinds","JME_has_yet_to_fuck_this_shit","JME_deleteC","JME_Tele","JME_ANAL_PLOW","JME_M_E_N_U_initMenu",
			"JME_M_E_N_U_hax_toggled","W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE",
			"JxMxE_Veh_M","JxMxE_LifeCash500k","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu",
			"W_O_O_K_I_E_FuckUp_GunStore_a","JME_KillCursor","JME_OPTIONS","JME_M_E_N_U_fill_TROLLmenu","ASSPLUNGE","FOXBYPASS","POLICE_IN_HELICOPTA",
			"JxMxE_EBRP","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","E_X_T_A_S_Y_Atm","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon",
			"W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl",
			"JxMxEsp","JxMxE_GOD","JxMxE_Heal","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337",
			"lkjhgfuyhgfd","E_X_T_A_S_Y_M_E_N_U_funcs_inited","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL",
			"Wookie_List","JxMxE_TP","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR",
			"atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
			"JxMxE_Infect","hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","E_X_T_A_S_Y_Keybinds","Menulocations",
			"Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
			"JxMxE_secret","Monky_initMenu","player_zombieCheck","E_X_T_A_S_Y_Recoil","godlol","playericons","abcdefGEH","wierdo",
			"go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
			"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC","E_X_T_A_S_Y_FuckUp_GunStore_a","E_X_T_A_S_Y_Cash_1k_t",
			"E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_LicenseDrive","E_X_T_A_S_Y_Menu_LOOOOOOOOOL","Metallica_vehicleg0dv3_infiSTAR",
			"JJJJ_MMMM___EEEEEEE_INIT_MENU","JJJJ_MMMM___EEEEEEE_GAPER","JJJJ_MMMM___EEEEEEE_SMOKExWEEDxEVERYDAY_BUM_RAPE",
			"JJJJ_MMMM___EEEEEEE_OPTIONS","JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_Target","E3p",
			"Jesus_MODE","ESP","MissileStrike","AL_Liscenses","NoIllegal","NoWeight","m0nkyaatp_sadksadxa","m0nkyaatp_RANDSTR",
			"myvar23","player_adminlevel","TNK","I_like_turtles",
			"BIGM","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS","Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTAR1",
			"GMod","No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode",
			"Sload","T3le","Tonic_has_a_gaping_vagina","my_anus_hurtz","aKFerm","aKMMenu","aKTitans","aKLikeaG0d",
			"riasgremory_G0d_Mode","aKCarG0d","riasgremory_Car_Jesus","aKE5p","riasgremory_isseilol","aKPMark",
			"riasgremory_Noobs","riasgremory_Bitches","riasgremory_Map_Markers","aKUnMmo","jenesuispasuncheateur_unamo",
			"aKVoit","Loljesaispasquoiecriremdr","isseigremory","gremorysama","aKTaCu","aKCardetroy","aKGetKey","aKKillcursor",
			"aKNoEscort","aKEscort","aKtroll","aKTPall","aKUnrestrain","aKNoEscortMe","aKNoTaze","aKJailplayer","aKLisense",
			"riasgremory_titans_shit_reold","Tonic_merde","jaimepaslepoisin_HLEAL","TTTT_IIII___TTTTTTT_RAP_FR","TTTT_IIII___TTTTTTT_REPGA",
			"TTTT_IIII___TTTTTTT_REPGAs","RGB_ESP_LOOP","jaimepaslepoisin_HLEAL","Root_Main4","Root_Pistol4","Root_Rifle4","Root_Machinegun4",
			"Root_Sniper4","Root_Launcher4","Root_Attachement4"
		];

		_'+_scripts+' = [
			"for hacking.sqf","JM3.sqf","JM3.png","wookie.sqf","wookie_wuat\start.sqf","lystoarma3\start.sqf","help.sqf","hack.sqf","cheat.sqf",
			"JxMxE.sqf","JME.sqf","wookiev5.sqf","menu.sqf"
		];

		_'+_displayList+' = [
			["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",''IGUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayInventory"",''IGUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",''Loading''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayLoading"",''Loading''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayInterrupt"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayOptionsVideo"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",''IGUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayAVTerminal"",''IGUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayConfigureAction"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayConfigureControllers"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayControlSchemes"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayCustomizeController"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayDebriefing"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDiary"",''MpMarkDisplays''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayGameOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",''Loading''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayLoading"",''Loading''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayOptionsAudio"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayOptionsLayout"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayStart","[2] call compile preprocessfilelinenumbers gettext (configfile >> ''CfgFunctions'' >> ''init''); [''onLoad'',_this,''RscDisplayLoading'',''Loading''] call (uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayLoading"",''Loading''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"],
			["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')","[""onUnload"",_this,""RscDisplayInsertMarker"",''GUI''] call 	(uinamespace getvariable ''BIS_fnc_initDisplay'')"]
		];

		_'+_allowedChildren+' = [
			"Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE",
			"ButtonSkip","ButtonRespawn","ButtonOptions","ButtonVideo",
			"ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints",
			"ButtonAbort","DebugConsole","Version","TraffLight","Feedback","MessageBox"
		];

		comment "The ALUK mod files are loaded into the game, we are now going to add the CBA addon to the allowedChildren of our mpinterrupt menu.";
		if(isClass(configFile >> "CfgPatches" >> "aluk_init")) then {
			_'+_allowedChildren+' = _'+_allowedChildren+' + ["CBA_CREDITS_CONT_C","CBA_CREDITS_M_P"];
		};

		_'+_kickMeVar+' = compileFinal "
			while {dialog} do {
				closeDialog 0;
			};

			[""ALUKAC"",false,false] spawn compile PreProcessFileLineNumbers ""\a3\functions_f\Misc\fn_endMission.sqf"";
			endMission ""ALUK"";
			endMission ""LOSER"";
			failMission ""ALUK"";
			failMission ""LOSER"";

			[] spawn {
				sleep 7;
					while {dialog} do {
					closeDialog 0;
				};
				[] call BIS_fnc_guiMessage;
				for ""_i"" from 0 to 100 do {
					(findDisplay _i) closeDisplay 0;
					closeDialog _i;
				};

				ALUKAC_FLAGGED = ""ALUKAC Anticheat Flagged"";
				publicVariableServer ""ALUKAC_FLAGGED"";
			};
		";

		[_'+_badVars+',_'+_kickMeVar+'] spawn {
			while {true} do {
				{
					_key = _x;
					{
						_var = _x getVariable _key;
						if(!isNil "_var") exitWith {
							_x setVariable[_key,nil];
							[[profileName,getPlayerUID player,format["BadVar:%1",_key]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
							[[profileName,format["Variable: %1",_key]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
							sleep 0.5;
							call (_this select 1);
						};
					} forEach [missionNamespace, uiNamespace, profileNamespace, parsingNamespace];
				} foreach (_this select 0);
				sleep 60;
			};
		};

		[_'+_scripts+',_'+_kickMeVar+'] spawn {
			_name = name player;
			_uid = getplayeruid player;
			loadFile "";

			{
				_text = loadFile _x;
				_numLetters = count(toArray(_text));
				if(_numLetters > 0) exitWith {
					[[profileName,getPlayerUID player,"Script_Detection:%1",_x],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,"Script Detection"],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
					sleep 0.5;
					call (_this select 1);
				};
			} foreach (_this select 0);
		};

		ALUKAC_fnc_'+_broadcastAlert+' = compileFinal "
			_pName = _this select 0;
			_pReason = _this select 1;
			if(isServer && !hasInterface) exitWith {};
			if(isNil ''life_wilcorank'') exitWith {};
			if((call life_wilcorank) < 1) exitWith {};
			hint parseText format[""<t align=''center''><t color=''#FF0000''><t size=''2''>Altis Life UK</t></t><br/>Cheater Flagged</t><br/><br/>Name: %1<br/>Detection: %2"",_pName,_pReason];
		";

		_'+_kickMeVar+' spawn {
			waitUntil {!isNil "RPUK_dosh"};
			waitUntil {!isNil "RPUK_doshinbank"};
			while {true} do
			{
				if(typeName RPUK_dosh != "SCALAR" || typeName RPUK_doshinbank != "SCALAR") exitWith {
					[[profileName,getPlayerUID player,"ChangedMoneyVar"],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,format["Changed the money var to something other than a number!",_x]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
					sleep 0.9;
					call _this;
				};
				sleep 60;
			};
		};

		_'+_kickMeVar+' spawn {
			_moneyInjectVars = ["life_cash","life_atmcash","life_clams","life_boxedclams","life_bankedwonga","life_wonga","aluk_wonga","aluk_bankedwonga"];
			{missionNamespace setVariable[_x,0];} forEach _moneyInjectVars;

			while {true} do {
				{
					_var = missionNamespace getVariable _x;
					if(!isNil ''_var'' && {_var > 0}) then {
						missionNamespace setVariable[_x,nil];
						[[profileName,getPlayerUID player,"MoneyInjection"],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
						[[profileName,"Money Injection detected."],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
						sleep 0.5;
						call _this;
					};
				} foreach ["life_cash","life_atmcash","life_clams","life_boxedclams","life_bankedwonga","life_wonga","aluk_wonga","aluk_bankedwonga"];
				sleep 60;
			};
		};

		[] spawn {
			waitUntil {!isNil ''AH_AdminCheck''};
			if(player call AH_AdminCheck) exitWith {};
			while{true} do {
				onMapSingleClick "_cat = true;";
				player allowDamage true;
				vehicle player allowDamage true;
				sleep 1;
			};
		};

		_'+_kickMeVar+' spawn {
			life_no_injection = false;
			while {true} do {
				waitUntil {sleep 4; (isNil ''life_no_injection'' || {life_no_injection})};
				[[profileName,getPlayerUID player,"CashInjectAttempt"],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
				[[profileName,"Cash Injection Attempt"],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
				sleep 0.5;
				call _this;
			};
		};

		[] spawn {
			waitUntil {!(isNull (findDisplay 46))};
			while{true} do {
				if(!isNil ''life_lowDetail'') then {
					if(life_lowDetail) then {
						setTerrainGrid 50;
					} else {
						setTerrainGrid 25;
					};
				} else {
					setTerrainGrid 25;
				};

				_nearObjects = vehicle player nearObjects 50;
				{
					vehicle player enableCollisionWith _x;
				} forEach _nearObjects;
				sleep 5;
				_nearObjects = player nearObjects 50;
				{
					player enableCollisionWith _x;
				} forEach _nearObjects;
				sleep 5;
			};
		};

		[] spawn {
			waitUntil {!isNil "'+_adminMenu+'"};
			[] spawn (call compile(toString(call '+ _adminMenu +')));
		};

		_'+_kickMeVar+' spawn {
			waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
			while {true} do {
				if((unitRecoilCoefficient player) < 1) then {
					[[profileName,getPlayerUID player,"No_recoil_hack"],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,"No recoil hack"],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
					sleep 0.5;
					call _this;
				};
				sleep 1.5;
			};
		};

		_'+_kickMeVar+' spawn {
			waitUntil {!isNil ''life_fnc_moveIn''};
			_lastCashVariable = RPUK_dosh;
			_lastBankVariable = RPUK_doshinbank;
			while {true} do {
				_alertCashVariable = _lastCashVariable + 3000000;
				_alertBankVariable = _lastBankVariable + 5000000;
				_maxCashVariable = _lastCashVariable + 6000000;
				_maxBankVariable = _lastBankVariable + 10000000;
				if(RPUK_dosh > _alertCashVariable) then {
					if(RPUK_dosh > _maxCashVariable) exitWith {
						[[profileName,getPlayerUID player,format["Cash_Inject_LargeChange_%1",[(RPUK_dosh - _lastCashVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
						[[profileName,format["Large Cash Change: %1",[(RPUK_dosh - _lastCashVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
						sleep 0.5;
						call _this;
					};
					[[profileName,getPlayerUID player,format["Cash_Inject_SmallChange_%1",[(RPUK_dosh - _lastCashVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,format["Small Cash Change (Do not ban for this, just keep a eye out!): %1",[(RPUK_dosh - _lastCashVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
				};
				if(RPUK_doshinbank > _alertBankVariable) then {
					if(RPUK_doshinbank > _maxBankVariable) exitWith {
						[[profileName,getPlayerUID player,format["Bank_Inject_LargeChange_%1",[(RPUK_doshinbank - _lastBankVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
						[[profileName,format["Large Bank Change: %1",[(RPUK_doshinbank - _lastBankVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
						sleep 0.5;
						call _this;
					};
					[[profileName,getPlayerUID player,format["Bank_Inject_SmallChange_%1",[(RPUK_doshinbank - _lastBankVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,format["Small Bank Change (Do not ban for this, just keep a eye out!): %1",[(RPUK_doshinbank - _lastBankVariable)] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
				};
				if(isNil ''RPUK_dosh'' || isNil ''RPUK_doshinbank'' || typeName RPUK_dosh != "SCALAR" || typeName RPUK_doshinbank != "SCALAR") then {
					_lastCashVariable = 100000;
					_lastBankVariable = 100000;
				} else {
					_lastCashVariable = RPUK_dosh;
					_lastBankVariable = RPUK_doshinbank;
				};
				sleep 0.25;
			};
		};

		[] spawn {
			waitUntil {!isNil ''AH_AdminCheck'';};
			waitUntil {!(isNull (findDisplay 46))};
			while {true} do {
				sleep 10;
				onEachFrame {};
				if(life_tagson) then {LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;};

				if(!(player call AH_AdminCheck)) then {
					removeAllMissionEventHandlers "Draw3D";
				};
			};
		};

		_'+_kickMeVar+' spawn {
			if(isServer) exitWith {};
			while {true} do {
				_localMoneyCount = {local _x && !( _x getvariable [ "scenery", false ] ) } count allMissionObjects "Land_Money_F";
				if(_localMoneyCount > 5) then {
					if(_localMoneyCount > 20) then {
						[[profileName,getPlayerUID player,format["Local_Money_Count_Large_%1",[_localMoneyCount] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
						[[profileName,format["Owns a large amount (%1) of money piles in the world.",[_localMoneyCount] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
						call _this;
					};
					[[profileName,getPlayerUID player,format["Local_Money_Count_%1",[_localMoneyCount] call life_fnc_numberText]],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
					[[profileName,format["Owns %1 money piles in the world. (Do not ban for this, unless number is bigger than 10!)",[_localMoneyCount] call life_fnc_numberText]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
				};
				sleep 8;
			};
		};

		_'+_kickMeVar+' spawn {
			waitUntil {sleep 20; !isNil "license_civ_hackerpwner"};
			while {true} do {
				waitUntil {sleep 20; license_civ_hackerpwner};
				[[profileName,getPlayerUID player,"License_Trap"],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
				[[profileName,"Player triggered license trap, using some sort of all licenses function."],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
				call _this;
				waitUntil {!license_civ_hackerpwner};
			};
		};

		_'+_kickMeVar+' spawn {
			private _inString = {
			    comment "INSTRING FUNCTION BY KILLZONEKID -- FASTER THAN DEFAULT BIS_FNC_INSTRING";
			    private ["_needle","_haystack","_needleLen","_hay","_found"];
			    _needle = [_this, 0, "", [""]] call BIS_fnc_param;
			    _haystack = toArray ([_this, 1, "", [""]] call BIS_fnc_param);
			    _needleLen = count toArray _needle;
			    _hay = +_haystack;
			    _hay resize _needleLen;
			    _found = false;
			    for "_i" from _needleLen to count _haystack do {
			        if (toString _hay == _needle) exitWith {_found = true};
			        _hay set [_needleLen, _haystack select _i];
			        _hay set [0, "x"];
			        _hay = _hay - ["x"]
			    };
			    _found
			};


			private _'+_safeVars+' = compileFinal (''' + str(ALUKAC_VARS) + ''');
			waitUntil {!isNil "'+_skipScan+'"};
			private _'+_completedScans+' = call '+_skipScan+';
			sleep 10;

			while {true} do
			{
				{
					private _ns = _x;
					private _nsReal = switch (_ns) do
					{
						case "missionNamespace": {missionNamespace};
						case "uiNamespace": {uiNamespace};
						case "parsingNamespace": {parsingNamespace};
					};

					{
						_var = _x;
						if(!(_var in _'+_completedScans+')) then {
							_'+_completedScans+' pushBack _var;
							if(!(isNil {call compile format["%1 getVariable ''%2''",_ns,_var]}) && typeName (call compile format["%1 getVariable ''%2''",_ns,_var]) == "CODE") then
							{
								private _flag = true;
								{
									if([_x,_var] call _inString) exitWith {_flag = false;};
								} forEach (call _'+_safeVars+');

								if(_flag) then {
									[[profileName,getPlayerUID player,format["UNKNOWNVAR: %1 Type: %2 NS: %4 Value: %3",_var,typeName (call compile format["%1 getVariable ''%2''",_ns,_var]),str(call compile format["%1 getVariable ''%2''",_ns,_var]),_ns],true],"ALUKAC_fnc_'+_stashReport+'",false,false] spawn life_fnc_MP;
									[[profileName,format["Unknown var(Maybe Hack?): %1 Type: %2 NS: %4 Value: %3",_var,typeName (call compile format["%1 getVariable ''%2''",_ns,_var]),str(call compile format["%1 getVariable ''%2''",_ns,_var]),_ns]],"ALUKAC_fnc_'+_broadcastAlert+'",true,false] spawn life_fnc_MP;
									call _this;
								};
								sleep 0.5;
							};
							sleep 0.025;
						};
					} forEach allVariables _nsReal;
				} forEach ["missionNamespace", "uiNamespace", "parsingNamespace"];
				waitUntil {sleep 15; (({!(_x in _'+_completedScans+')} count allVariables missionNamespace) + ({!(_x in _'+_completedScans+')} count allVariables uiNamespace) + ({!(_x in _'+_completedScans+')} count allVariables parsingNamespace)) > 0};
			};
		};
	};

	'+_antiHackVar+' = toArray(str('+_antiHackVar+'));
	'+_antiHackVar+' = compileFinal str('+_antiHackVar+');
	publicVariable "'+_antiHackVar+'";
');

[_acIsActivated,_antiHackVar] spawn {

	params [
		[ "_acIsActivated", "", [ "" ] ],
		[ "_antiHackVar", "", [ "" ] ]
	];

	private _payload = compile format [

		'if (
			!isDedicated && {hasInterface} &&
			{!isNull player} && {player == player} &&
			{getPlayerUID player != ""} && {!(isNull (findDisplay 46))}
		) then {
			if(isNil "%1") then {
				%1 = compileFinal "true";
				[] spawn (call compile(toString(call %2)));
				systemChat "Starting ALUKAC...";
			};
		};',
		_acIsActivated,
		_antiHackVar

	];

	while {true} do {

		//--- Sleep
		uiSleep 15;

		//--- Execute on everyone but server
		_payload remoteExecCall [ "BIS_fnc_call", -2 ];

	};

};

[] spawn {
	while {true} do {
		private _money = allMissionObjects "Land_Money_F";
		private _moneyCount = {!(_x getVariable["bankItem",false])} count _money;
		if(_moneyCount > 25) then {
			{if(!(_x getVariable["bankItem",false])) then {deleteVehicle _x;};} forEach _money;
		};
		sleep 10;
	};
};

[] spawn {
	if(!isDedicated) exitWith {};
	private _inString = {
	    private ["_needle","_haystack","_needleLen","_hay","_found"];
	    _needle = [_this, 0, "", [""]] call BIS_fnc_param;
	    _haystack = toArray ([_this, 1, "", [""]] call BIS_fnc_param);
	    _needleLen = count toArray _needle;
	    _hay = +_haystack;
	    _hay resize _needleLen;
	    _found = false;
	    for "_i" from _needleLen to count _haystack do {
	        if (toString _hay == _needle) exitWith {_found = true};
	        _hay set [_needleLen, _haystack select _i];
	        _hay set [0, "x"];
	        _hay = _hay - ["x"]
	    };
	    _found
	};

	waitUntil {sleep 0.25; count allMapMarkers > 0};
	private _allowedMarkers = allMapMarkers;
	private _count = count _allowedMarkers;
	while {true} do {
		waitUntil {sleep 2; count allMapMarkers > _count};
		{
			if(
				!(_x in _allowedMarkers) && //Prevent mission marker delete.
				!(["house_",_x] call _inString) && //Prevent house marker delete.
				!(["Bank_",_x] call _inString) && //Prevent bank marker delete.
				!(["Captured by: ",markerText _x] call _inString) && //Prevent gang base marker delete.
				!(markerText _x in ["Boat Wreck","HM Treasury Shipwreck"]) //Prevent boat wreck delete.
			) then {
				deleteMarker _x;
			};
		} forEach allMapMarkers;
		sleep 0.05;
	};
};