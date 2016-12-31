/*
	File: fn_welcome.sqf
	Author: Ciaran Langton

	Description:
	Shows the welcome message.
*/
disableSerialization;
[
	"",
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='intrologo.paa' /></t><br /><br />";
_message = _message + "Welcome to <a href='https://Roleplay.co.uk' color='#5600FF'>Roleplay.co.uk</a> the #1 Roleplay server and community in the UK and Europe!<br /><br />";
_message = _message + "This is a serious roleplay server so before you spawn in please make sure you read our rules at <a href='https://www.roleplay.co.uk/rules' color='#5600FF'>Roleplay.co.uk/rules</a> otherwise you will end up banned and we dont want that!<br /><br />";

if(call life_alukmod_loaded) then {
	_message = _message + "You currently have the Altis Life UK Modpack <t color='#00FF00'>enabled</t> (VERSION: " + (call life_alukmod_version) + "), this modpack makes your gameplay better!<br />";
} else {
	_message = _message + "<t color='#FF0000'>You currently do not have the Altis Life UK Modpack enabled</t>, this modpack is a client side only addon that makes your gameplay better!<br />";
	_message = _message + "You can download the modpack by <a href='http://modpack.AltisLife.co.uk' color='#5600FF'>Clicking Here</a>. We highly recommend it!<br />";
};

_message = _message + "We are more than just an Altis life server, Our forums are extremely busy and no other Altis life server online is as committed as we are to making your experience a good one!<br />";
_message = _message + "Have fun!<br />";
_message = _message + "<t size='3' shadow='0'><img image='wilcosig.paa' /></t>";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;