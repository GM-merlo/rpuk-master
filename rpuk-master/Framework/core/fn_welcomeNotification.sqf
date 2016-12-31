/*
	File: fn_welcomeNotification.sqf

	Description:
	Called upon first spawn selection and welcomes our player.
*/
disableUserInput true;
endLoadingScreen;
_fadeIn = [] spawn BIS_fnc_VRFadeIn;
waitUntil {scriptDone _fadeIn};
8 cutRsc ["intro","PLAIN"];

_introNumber = [1,2,3,4] call BIS_fnc_selectRandom;
playSound format["intro%1",_introNumber];

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1250]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1250];
_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 2;
8 cutFadeOut 3;
waitUntil {camCommitted _introCam};

_introCam camSetFov 1;
_introCam camSetRelPos [0,-1,1.85];
_introCam camCommit 3;
waitUntil {camCommitted _introCam};
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;

life_spawnAnimDone = true;
disableUserInput false;

[] spawn {
	_onScreenTime = 4.1;
	_role1 = "Good day good sir/madam!";
	_role1names = ["Welcome to", "Roleplay.co.uk"];
	_role2 = "Chat with us on Teamspeak!";
	_role2names = ["ts.roleplay.co.uk"];
	_role3 = "We are number one!";
	_role3names = ["The biggest","Roleplay Community in the UK", "Roleplay.co.uk"];
	_role4 = "Twitter";
	_role4names = ["@AltisLifeUK"];
	_role5 = "Built from Altis Life";
	_role5names = ["by Ciaran, TinyBigJacko &amp; Wilco"];
	_role6 = "Exclusive Skins, Icons and Textures From";
	_role6names = ["Wilco","Ciaran","CI Xsum","Fuel","Killerabbit"];
	_role7 = "Support us";
	_role7names = ["Please support us by donating on Roleplay.co.uk"];
	_role8 = "Enjoy your stay";
	_role8names = ["Have fun and follow the rules<br/>posted on our website and the map-screen diary<br/>(press M for more info)"];
	_role9 = "Special thanks to";
	_role9names = ["All you guys that join us daily!<br/>Thank you!"];
	_role10 = "Mayor Status";
	_role10names = [format["Currently %1 is in office!",life_mayor_settings select 1]];

	{
		sleep 2;
		_memberFunction = _x select 0;
		_memberNames = _x select 1;
		_finalText = format ["<t size='0.40' color='#0033CC' align='right'>%1<br /></t>", _memberFunction];
		_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
		{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
		_finalText = _finalText + "</t>";
		_onScreenTime + (((count _memberNames) - 1) * 0.5);
		[
			_finalText,
			[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
			[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
			_onScreenTime,
			0.5
		] spawn BIS_fnc_dynamicText;
		sleep (_onScreenTime);
	} forEach [
	//The list below should have exactly the same amount of roles as the list above
		[_role1, _role1names],
		[_role2, _role2names],
		[_role10, _role10names],
		[_role3, _role3names],
		[_role4, _role4names],
		[_role5, _role5names],
		[_role6, _role6names],
		[_role7, _role7names],
		[_role8, _role8names],
		[_role9, _role9names]
	];
};
