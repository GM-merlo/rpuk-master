class Slots
{
	idd = 8500;
	name = "Slots";
	movingEnabled = false;
	enableSimulation = true;

	class Controls
	{
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Altis Grand Casino Slots";
			x = 0.075;
			y = 0.16;
			w = 0.85;
			h = 0.04;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = 0.075;
			y = 0.2;
			w = 0.85;
			h = 0.68;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "icons\slots\bar.paa";
			x = 0.1;
			y = 0.24;
			w = 0.125;
			h = 0.2;
		};
		class RscPicture_1201: Life_RscPicture
		{
			idc = 1201;
			text = "icons\slots\bar.paa";
			x = 0.25;
			y = 0.24;
			w = 0.125;
			h = 0.2;
		};
		class RscPicture_1202: Life_RscPicture
		{
			idc = 1202;
			text = "icons\slots\bar.paa";
			x = 0.4;
			y = 0.24;
			w = 0.125;
			h = 0.2;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			x = -0.102961;
			y = 0.661765;
			w = 0.1;
			h = 0.1;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "Current Jackpot = [LOADING]";
			x = 0.1;
			y = 0.6;
			w = 0.4;
			h = 0.04;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 1101;
			text = "Cost Per Roll = [LOADING]";
			x = 0.1;
			y = 0.68;
			w = 0.4;
			h = 0.04;
		};
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 1102;
			text = "Highest Payout = [LOADING]";
			x = 0.1;
			y = 0.76;
			w = 0.4;
			h = 0.04;
		};
		class RscButton_1600: Life_RscButtonMenu
		{
			idc = 1600;
			text = "PLAY"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_slotPlay;";
			x = 0.525;
			y = 0.6;
			w = 0.375;
			h = 0.2;
			tooltip = "Rolls the slot machine."; //--- ToDo: Localize;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 5)";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 5)";
		};
		class RscButtonMenuCancel_2700: Life_RscButtonMenu
		{
			x = 0.075;
			y = 0.88;
			w = 0.1;
			text = "Exit";
			onButtonClick = "closeDialog 0;";
			h = 0.04;
			tooltip = "Exits the window."; //--- ToDo: Localize;
		};
	};
};
