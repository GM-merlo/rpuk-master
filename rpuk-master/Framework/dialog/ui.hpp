/*
#define COLOR_HALF_BLACK { 0, 0, 0, 0.5 }

class playerHUD
	{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 1e+011;
  	fadeout=0;
	name="playerHUD";
	onLoad="((_this select 0) displayCtrl 1299) ctrlShow false; uiNamespace setVariable ['playerHUD',_this select 0];";
	objects[]={};

	class controlsBackground
	{
		class foodHIcon : life_RscPicture
		{

			idc = 23531;
			text = "icons\food.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.575;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class waterHIcon : life_RscPicture
		{

			idc = 23532;
			text = "icons\water.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.510;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class healthHIcon : life_RscPicture
		{

			idc = 23533;
			text = "icons\health.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.445;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class bountyHIcon : life_RscPicture
		{

			idc = 23521;
			text = "icons\bounty.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.380;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class boneIcon: life_RscPicture
		{
			idc = 23522;
			text = "icons\bone.paa";
			x = 0.959297 * safezoneW + safezoneX;
			y = 0.92568 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};

		class painIcon: life_RscPicture
		{
			idc = 23523;
			text = "icons\muted.paa";
			x = 0.919937 * safezoneW + safezoneX;
			y = 0.92568 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};

		class drunkIcon: life_RscPicture
		{
			idc = 23524;
			text = "icons\drunk.paa";
			x = 0.879255 * safezoneW + safezoneX;
			y = 0.925679 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};
	};

	class controls
	{
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class bountytext
		{
			type=0;
			idc=23520;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class wantedList : Life_RscStructuredText {
			idc = 23525;
			x = safeZoneX+0.01;
			y = safeZoneY+0.5;
			w = 0.3;
			h = 0.7;
			colorBackground[] = {0.5, 0.5, 0.5, 0.5};
			text = "";
			show = 0;
		};

	};
};
*/
class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 1e+011;
  	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0];";
	onUnload="uiNamespace setVariable ['playerHUD',displayNull];";

	class controlsBackground
	{
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
	class controls
	{	
		class thirstbar: Life_RscProgress
		{
			idc = 1001;
			x = 0.860938 * safezoneW + safezoneX;
			y = 0.814 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBar[] = {0.2,0.2,0.2,0.8};
			colorFrame[] = {0,0,0,0.5};
			colorBackground[] = {0.2,0.2,0.2,0.5};
		};
		class hungerbar: Life_RscProgress
		{
			idc = 1002;
			x = 0.860938 * safezoneW + safezoneX;
			y = 0.842 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBar[] = {0.2,0.2,0.2,0.8};
			colorFrame[] = {0,0,0,0.5};
			colorBackground[] = {0.2,0.2,0.2,0.5};
		};
		class expbar: Life_RscProgress
		{
			idc = 1003;
			x = 0.860938 * safezoneW + safezoneX;
			y = 0.87 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBar[] = {0.2,0.2,0.2,0.8};
			colorFrame[] = {0,0,0,0.5};
			colorBackground[] = {0.2,0.2,0.2,0.5};
		};
		class healthbar: Life_RscProgress
		{
			idc = 1004;
			x = 0.860938 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBar[] = {0.2,0.2,0.2,0.8};
			colorFrame[] = {0,0,0,0.5};
			colorBackground[] = {0.2,0.2,0.2,0.5};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Health"; //--- ToDo: Localize;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Thirst"; //--- ToDo: Localize;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.814 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: Life_RscText
		{
			idc = 1007;
			text = "Hunger"; //--- ToDo: Localize;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "EXP"; //--- ToDo: Localize;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.87 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.907343 * safezoneW + safezoneX;
			y = 0.87 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};		
