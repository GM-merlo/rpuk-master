class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
	};

	class Controls
	{
		/*class MedicsOnline : Life_RscText
		{
			idc = 7304;
			colorBackground[] = {0,0,0,0};
			text = "Medics Online: 1";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};

		class MedicsNearby : Life_RscText
		{
			idc = 7305;
			colorBackground[] = {0,0,0,0};
			text = "Medics Nearby: No";
			x = 0.00190622 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};*/

		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			text = "Respawn";
			onButtonClick = "closeDialog 0; life_respawned = true; [] spawn life_fnc_spawnMenu;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};

		/*class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.0292 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "Request Medic";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};*/

		class respawnTime : Life_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Ciaran, v1.063, #Qiduke)
////////////////////////////////////////////////////////
class DeathScreenV2
{
	idd = 7300;
	name = "Life_Death_ScreenV2";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
	};

	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Ciaran, v1.063, #Bipinu)
		////////////////////////////////////////////////////////

		class RscText_1000: Life_RscText
		{
			idc = 1000;
			x = -0.00162184 * safezoneW + safezoneX;
			y = 0.780037 * safezoneH + safezoneY;
			w = 1.00323 * safezoneW;
			h = 0.182024 * safezoneH;
			colorText[] = {-1,-1,-1,0.5};
			colorBackground[] = {-1,-1,-1,0.5};
			colorActive[] = {-1,-1,-1,0.5};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = -0.00281039 * safezoneW + safezoneX;
			y = 0.0463402 * safezoneH + safezoneY;
			w = 1.00323 * safezoneW;
			h = 0.182024 * safezoneH;
			colorText[] = {-1,-1,-1,0.5};
			colorBackground[] = {-1,-1,-1,0.5};
			colorActive[] = {-1,-1,-1,0.5};
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "<t size='2' align='center'>Wait to Respawn</t>"; //--- ToDo: Localize;
			x = 0.261135 * safezoneW + safezoneX;
			y = 0.0575806 * safezoneH + safezoneY;
			w = 0.47773 * safezoneW;
			h = 0.0700092 * safezoneH;
		};
		class RscProgress_1000: Life_RscProgress
		{
			idc = 1101;
			x = 0.308908 * safezoneW + safezoneX;
			y = 0.144354 * safezoneH + safezoneY;
			w = 0.382184 * safezoneW;
			h = 0.0700092 * safezoneH;
		};
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 1102;
			x = 0.261135 * safezoneW + safezoneX;
			y = 0.794038 * safezoneH + safezoneY;
			w = 0.47773 * safezoneW;
			h = 0.0700092 * safezoneH;
		};
		class RscStructuredText_1103: Life_RscStructuredText
		{
			idc = 1103;
			x = 0.261135 * safezoneW + safezoneX;
			y = 0.878049 * safezoneH + safezoneY;
			w = 0.47773 * safezoneW;
			h = 0.0700092 * safezoneH;
		};
		/*class RscStructuredText_1104: Life_RscStructuredText
		{
			idc = 1104;
			x = 0.00555021 * safezoneW + safezoneX;
			y = 0.0575419 * safezoneH + safezoneY;
			w = 0.244836 * safezoneW;
			h = 0.15402 * safezoneH;
		};*/
		class RscStructuredText_1105: Life_RscStructuredText
		{
			idc = 1105;
			x = 0.00554987 * safezoneW + safezoneX;
			y = 0.793961 * safezoneH + safezoneY;
			w = 0.244836 * safezoneW;
			h = 0.15402 * safezoneH;
		};
		class RscStructuredText_1106: Life_RscStructuredText
		{
			idc = 1106;
			x = 0.747224 * safezoneW + safezoneX;
			y = 0.0575419 * safezoneH + safezoneY;
			w = 0.244836 * safezoneW;
			h = 0.15402 * safezoneH;
		};
		/*class RscButton_1600: Life_RscButtonMenu
		{
			idc = 7303;
			text = "Request Medic"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_requestMedic;";
			x = 0.749614 * safezoneW + safezoneX;
			y = 0.794038 * safezoneH + safezoneY;
			w = 0.244836 * safezoneW;
			h = 0.0700092 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};*/
		class RscButton_1601: Life_RscButtonMenu
		{
			idc = 7302;
			text = "Respawn"; //--- ToDo: Localize;
			x = 0.749614 * safezoneW + safezoneX;
			y = 0.878048 * safezoneH + safezoneY;
			w = 0.244836 * safezoneW;
			h = 0.0700092 * safezoneH;
			onButtonClick = "closeDialog 0; life_respawned = true; [] spawn life_fnc_spawnMenu;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
