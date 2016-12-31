class life_market_prices
{
	idd = 1000;
	name="life_market_prices";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Ciaran, v1.063, #Fepele)
		////////////////////////////////////////////////////////
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Roleplay.co.uk Market"; //--- ToDo: Localize;
			x = 0.308786 * safezoneW + safezoneX;
			y = 0.262045 * safezoneH + safezoneY;
			w = 0.382428 * safezoneW;
			h = 0.0279947 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = 0.308786 * safezoneW + safezoneX;
			y = 0.29004 * safezoneH + safezoneY;
			w = 0.382428 * safezoneW;
			h = 0.447915 * safezoneH;
			colorText[] = {-1,-1,-1,0.8};
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.314762 * safezoneW + safezoneX;
			y = 0.304037 * safezoneH + safezoneY;
			w = 0.113533 * safezoneW;
			h = 0.41992 * safezoneH;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_marketPricesUpdate;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			x = 0.440245 * safezoneW + safezoneX;
			y = 0.304037 * safezoneH + safezoneY;
			w = 0.244993 * safezoneW;
			h = 0.41992 * safezoneH;
		};
		class RscButton_1600: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.308786 * safezoneW + safezoneX;
			y = 0.737955 * safezoneH + safezoneY;
			w = 0.0836561 * safezoneW;
			h = 0.0279947 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};