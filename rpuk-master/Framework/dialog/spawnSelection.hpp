/*
class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
		class life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.8; h = (1 / 25);
		};

		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.8; h = 0.6 - (22 / 250);
		};

		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.1; y = 0.2;
			w = 0.8; h = (1 / 25);
		};

		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
		};

		class MapView : Life_RscMapControl
		{
			idc = 38502;
			x = 0.328; y = 0.26;
			w = 0.56;
			h = 0.56 - (22 / 250);
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};

	class controls
	{
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.105; y = 0.26;
			w = (8.8 / 40);
			h = (10 / 25);
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};

		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] spawn life_fnc_spawnConfirm";
			x = 0.11; y = 0.69;
			w = (8 / 40);
			h = (1 / 25);
		};
	};
};
*/
class life_spawn_selection
{
	idd = 38500;
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Available Spawns"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
  };
	class controls
	{
		class RscListbox_1500: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.422657 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.22 * safezoneH;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_spawnConfirm";
			class Attributes
			{
				align = "center";
			};
		};
		class RscText_1002: Life_RscText
		{
			idc = 38501;
			text = ""; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};
