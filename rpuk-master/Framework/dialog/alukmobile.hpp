/*
	File: alukmobile.hpp

	Author: Ciaran Langton
	Date: 2015-04-24 21:13:11
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 15:18:18
*/
class ALUKMobile
{
	idd = 8500;
	name = "ALUKMobile";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "_display = _this select 0;for ""_i"" from 0 to 8 do {_id = 4000 + _i;_ctrl = _display displayCtrl _id;_ctrl ctrlShow false;}; _myMessages = [1002, 1501, 1003, 2401, 1004, 2401]; {_ctrl = _display displayCtrl _x;_ctrl ctrlShow false;} forEach _myMessages;";

	/*class controlsBackground
	{
		class tablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\misc\menu.paa";
			x = -0.1;
			y = -0.22;
			w = 1.2;
			h = 1.46;
		};
	};

	class Controls
	{
		class Title: Life_RscText
		{
			idc = 1000;
			text = "ALUK Mobile Services"; //--- ToDo: Localize;
			x = 0.261016 * safezoneW + safezoneX;
			y = 0.234017 * safezoneH + safezoneY;
			w = 0.477968 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "All Contacts"; //--- ToDo: Localize;
			x = 0.264601 * safezoneW + safezoneX;
			y = 0.270413 * safezoneH + safezoneY;
			w = 0.129051 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.264601 * safezoneW + safezoneX;
			y = 0.298411 * safezoneH + safezoneY;
			w = 0.129051 * safezoneW;
			h = 0.439572 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			text = "Filter Contacts..."; //--- ToDo: Localize;
			x = 0.265796 * safezoneW + safezoneX;
			y = 0.743583 * safezoneH + safezoneY;
			w = 0.129051 * safezoneW;
			h = 0.0363977 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "My Messages"; //--- ToDo: Localize;
			x = 0.404406 * safezoneW + safezoneX;
			y = 0.270413 * safezoneH + safezoneY;
			w = 0.323836 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscListbox_1501: Life_RscListbox
		{
			idc = 1501;
			x = 0.404406 * safezoneW + safezoneX;
			y = 0.298411 * safezoneH + safezoneY;
			w = 0.323823 * safezoneW;
			h = 0.167988 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "<LOADING>"; //--- ToDo: Localize;
			x = 0.404406 * safezoneW + safezoneX;
			y = 0.474797 * safezoneH + safezoneY;
			w = 0.323836 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			x = 0.404406 * safezoneW + safezoneX;
			y = 0.502796 * safezoneH + safezoneY;
			w = 0.323823 * safezoneW;
			h = 0.235187 * safezoneH;
			text = "";
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class RscEdit_1401: Life_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.404406 * safezoneW + safezoneX;
			y = 0.502796 * safezoneH + safezoneY;
			w = 0.323823 * safezoneW;
			h = 0.235187 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Send Message"; //--- ToDo: Localize;
			x = 0.64578 * safezoneW + safezoneX;
			y = 0.740783 * safezoneH + safezoneY;
			w = 0.0824492 * safezoneW;
			h = 0.0279981 * safezoneH;
		};
	};*/

	class controls
	{
		class PlayerListHead : Life_RscText
		{
			idc = 1000;
			text = "Phone Book"; //--- ToDo: Localize;
			x = 0.129692 * safezoneW + safezoneX;
			y = 0.208817 * safezoneH + safezoneY;
			w = 0.1314 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class PlayerSelectorBackground : Life_RscText
		{
			idc = 2200;
			x = 0.129692 * safezoneW + safezoneX;
			y = 0.236817 * safezoneH + safezoneY;
			w = 0.1314 * safezoneW;
			h = 0.615961 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class PlayerList : Life_RscListBox
		{
			idc = 1500;
			x = 0.135665 * safezoneW + safezoneX;
			y = 0.245216 * safezoneH + safezoneY;
			w = 0.119454 * safezoneW;
			h = 0.534767 * safezoneH;
			sizeEx = 0.041;
		};
		class PlayerFilter: Life_RscEdit
		{
			idc = 1400;
			text = "Enter Filter..."; //--- ToDo: Localize;
			x = 0.135665 * safezoneW + safezoneX;
			y = 0.785581 * safezoneH + safezoneY;
			w = 0.119454 * safezoneW;
			h = 0.0279982 * safezoneH;
			onKeyUp = "[] spawn life_fnc_mobilePlayerFilter;";
		};
		class ScribeMessage : Life_RscButtonMenu
		{
			idc = 2400;
			text = "Send Message"; //--- ToDo: Localize;
			x = 0.135665 * safezoneW + safezoneX;
			y = 0.819181 * safezoneH + safezoneY;
			w = 0.119461 * safezoneW;
			h = 0.0279982 * safezoneH;
			onButtonClick = "[] call life_fnc_mobileStartMessage;";
		};
		class MyMessagesTitle : Life_RscText
		{
			idc = 1001;
			text = "My Messages"; //--- ToDo: Localize;
			x = 0.273037 * safezoneW + safezoneX;
			y = 0.206018 * safezoneH + safezoneY;
			w = 0.45405 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class MyMessagesBackground : Life_RscText
		{
			idc = 2201;
			x = 0.273037 * safezoneW + safezoneX;
			y = 0.234017 * safezoneH + safezoneY;
			w = 0.45405 * safezoneW;
			h = 0.590761 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class MyInboxTitle : Life_RscText
		{
			idc = 1002;
			text = "Inbox"; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.262015 * safezoneH + safezoneY;
			w = 0.43254 * safezoneW;
			h = 0.030798 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class MessageList : Life_RscListNBox
		{
			idc = 1501;
			//sizeEx = 0.04;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3,0.5, 0.85};
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.290013 * safezoneH + safezoneY;
			w = 0.432425 * safezoneW;
			h = 0.114784 * safezoneH;
			onLBSelChanged = "[] call life_fnc_mobileMessageSelect;";
		};
		class MessageViewerTitle : Life_RscText
		{
			idc = 1003;
			text = "Message Viewer"; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.430004 * safezoneH + safezoneY;
			w = 0.43254 * safezoneW;
			h = 0.030798 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class ReplyToMsg : Life_RscButtonMenu
		{
			idc = 2401;
			text = "Reply"; //--- ToDo: Localize;
			x = 0.649312 * safezoneW + safezoneX;
			y = 0.82198 * safezoneH + safezoneY;
			w = 0.0788393 * safezoneW;
			h = 0.0279982 * safezoneH;
		};
		class CloseMenu : Life_RscButtonMenu
		{
			idc = 2402;
			text = "Close"; //--- ToDo: Localize;
			x = 0.273037 * safezoneW + safezoneX;
			y = 0.82198 * safezoneH + safezoneY;
			w = 0.0788393 * safezoneW;
			h = 0.0279982 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
    class MessageViewerGroup : Life_RscControlsGroup {
      idc = -1;
      x = 0.284983 * safezoneW + safezoneX;
      y = 0.458003 * safezoneH + safezoneY;
      w = 0.432425 * safezoneW;
      h = 0.335979 * safezoneH;

      class Controls {
        class MessageViewer : Life_RscStructuredText
        {
          idc = 1004;
          x = 0;
          y = 0;
          w = 0.432420 * safezoneW;
          h = 1 * safezoneH;
        };
      };
    };
		//WRITING TO HEADER BELOW
		class WritingToHeader: Life_RscText
		{
			idc = 4000;
			text = "Writing to %1"; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.262015 * safezoneH + safezoneY;
			w = 0.43254 * safezoneW;
			h = 0.030798 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class YourMessageText: Life_RscEdit
		{
			idc = 4001;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.374008 * safezoneH + safezoneY;
			w = 0.430035 * safezoneW;
			h = 0.419974 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			text = "";

			type = 2; // CT_EDIT
			sizeEx = 0.030;
			style = 16; // ST_MULTI

			shadow = 0;

			onKeyUp = "[] call life_fnc_mobileMessageKeyUp;";
		};
		class CurrentCharactersUsedTitle : Life_RscText
		{
			idc = 4002;
			text = "Current Characters Used: "; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.318011 * safezoneH + safezoneY;
			w = 0.167236 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class CurrentCharactersUsed : Life_RscText
		{
			idc = 4003;
			text = "0/1500"; //--- ToDo: Localize;
			x = 0.452218 * safezoneW + safezoneX;
			y = 0.318011 * safezoneH + safezoneY;
			w = 0.167236 * safezoneW;
			h = 0.0279982 * safezoneH;
		};
		class SendGRIDREFTitle : Life_RscText
		{
			idc = 4004;
			text = "Send GRIDREF:"; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.290013 * safezoneH + safezoneY;
			w = 0.167236 * safezoneW;
			h = 0.0279982 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class SendGRIDREFCheckbox : Life_RscCheckbox
		{
			idc = 4005;
			x = 0.452218 * safezoneW + safezoneX;
			y = 0.290013 * safezoneH + safezoneY;
			w = 0.0131399 * safezoneW;
			h = 0.0279982 * safezoneH;
		};
		class YourMessageTextBackground: Life_RscText
		{
			idc = 4006;
			text = "";
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.374008 * safezoneH + safezoneY;
			w = 0.430035 * safezoneW;
			h = 0.419974 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class WriteYourMessageHeader: Life_RscText
		{
			idc = 4007;
			text = "Write your Message:"; //--- ToDo: Localize;
			x = 0.284983 * safezoneW + safezoneX;
			y = 0.34601 * safezoneH + safezoneY;
			w = 0.43254 * safezoneW;
			h = 0.030798 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};

		class CancelMessage : Life_RscButtonMenu
		{
			idc = 4008;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.5657 * safezoneW + safezoneX;
			y = 0.82198 * safezoneH + safezoneY;
			w = 0.0788393 * safezoneW;
			h = 0.0279982 * safezoneH;
			onButtonClick = "closeDialog 0; [] spawn life_fnc_mobileOpen;";
		};
	};
};
