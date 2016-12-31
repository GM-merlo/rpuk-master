class licenseshop
{
	idd = 8500;
	name = "licenseshop";
	movingEnabled = false;
	enableSimulation = true;
	
	class Controls
	{
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "License Shop"; //--- ToDo: Localize;
			x = 0.303095 * safezoneW + safezoneX;
			y = 0.233983 * safezoneH + safezoneY;
			w = 0.39381 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = 0.303095 * safezoneW + safezoneX;
			y = 0.261985 * safezoneH + safezoneY;
			w = 0.39381 * safezoneW;
			h = 0.408028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.316222 * safezoneW + safezoneX;
			y = 0.303988 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.32202 * safezoneH;
			sizeEx = 0.030;
		};
		class RscListbox_1501: Life_RscListbox
		{
			idc = 1501;
			x = 0.545945 * safezoneW + safezoneX;
			y = 0.303988 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.32202 * safezoneH;
			sizeEx = 0.030;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Licenses"; //--- ToDo: Localize;
			x = 0.316222 * safezoneW + safezoneX;
			y = 0.275986 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Owned Licenses"; //--- ToDo: Localize;
			x = 0.545945 * safezoneW + safezoneX;
			y = 0.275986 * safezoneH + safezoneY;
			w = 0.137834 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Purchase"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_licenseShopBuy;";
			x = 0.454055 * safezoneW + safezoneX;
			y = 0.640009 * safezoneH + safezoneY;
			w = 0.091889 * safezoneW;
			h = 0.0280018 * safezoneH;
		};
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.303095 * safezoneW + safezoneX;
			y = 0.670509 * safezoneH + safezoneY;
			w = 0.091889 * safezoneW;
			h = 0.0280018 * safezoneH;
		};
	};
};