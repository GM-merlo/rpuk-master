class life_profession_sys
{
	idd = 1000;
	name="life_profession_sys";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controls {
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = 0.276841 * safezoneW + safezoneX;
			y = 0.303988 * safezoneH + safezoneY;
			w = 0.446318 * safezoneW;
			h = 0.462029 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			sizeEx = 0.035;
			x = 0.283404 * safezoneW + safezoneX;
			y = 0.34599 * safezoneH + safezoneY;
			w = 0.105016 * safezoneW;
			h = 0.392025 * safezoneH;
			onLBSelChanged = "call life_fnc_selectProfession;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "<t align='center'>Current Level</t>"; //--- ToDo: Localize;
			x = 0.394984 * safezoneW + safezoneX;
			y = 0.317988 * safezoneH + safezoneY;
			w = 0.170651 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 1101;
			text = "<t align='center'>Professions</t>"; //--- ToDo: Localize;
			x = 0.283404 * safezoneW + safezoneX;
			y = 0.317988 * safezoneH + safezoneY;
			w = 0.105016 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 1102;
			text = "<t align='center'>Profession System</t>"; //--- ToDo: Localize;
			x = 0.276841 * safezoneW + safezoneX;
			y = 0.275986 * safezoneH + safezoneY;
			w = 0.446318 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1103: Life_RscStructuredText
		{
			idc = 1103;
			text = "<t align='center' size='10'>1</t>"; //--- ToDo: Localize;
			x = 0.394984 * safezoneW + safezoneX;
			y = 0.34599 * safezoneH + safezoneY;
			w = 0.170651 * safezoneW;
			h = 0.392025 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
			colorActive[] = {-1,-1,-1,0.6};
		};
		class RscStructuredText_1104: Life_RscStructuredText
		{
			idc = 1104;
			text = "<t align='center'>Current Points</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.317988 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1105: Life_RscStructuredText
		{
			idc = 1105;
			text = "<t align='center' size='3'>0</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.34599 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0980062 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
			colorActive[] = {-1,-1,-1,0.6};
		};
		class RscStructuredText_1106: Life_RscStructuredText
		{
			idc = 1106;
			text = "<t align='center'>Points For Level Up</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.457997 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1107: Life_RscStructuredText
		{
			idc = 1107;
			text = "<t align='center' size='3'>0</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.485999 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0980062 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
			colorActive[] = {-1,-1,-1,0.6};
		};
		class RscStructuredText_1108: Life_RscStructuredText
		{
			idc = 1108;
			text = "<t align='center'>Points Left</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.598006 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1109: Life_RscStructuredText
		{
			idc = 1109;
			text = "<t align='center' size='3'>0</t>"; //--- ToDo: Localize;
			x = 0.572199 * safezoneW + safezoneX;
			y = 0.626008 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0980062 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
			colorActive[] = {-1,-1,-1,0.6};
		};
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.276841 * safezoneW + safezoneX;
			y = 0.766117 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.04;
		};
	};
};