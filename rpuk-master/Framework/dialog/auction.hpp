/* 
	File: auction.hpp
	
	Author: Ciaran Langton
	Date: 2015-02-27 18:14:36
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-08 14:31:54
*/
/* #Piqeke
$[
	1.063,
	["CarAuction",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"RscText_1000: Life_RscText",[1,"Auction Car Dialog",["0.296965 * safezoneW + safezoneX","0.261984 * safezoneH + safezoneY","0.40617 * safezoneW","0.028 * safezoneH"],[-1,-1,-1,-1],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],"","-1"],["idc = 1000;"]],
	[1001,"RscText_1001: Life_RscText",[1,"",["0.296965 * safezoneW + safezoneX","0.289986 * safezoneH + safezoneY","0.40617 * safezoneW","0.490001 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.8],[-1,-1,-1,0.8],"","-1"],["idc = 1001;"]],
	[1002,"RscButtonMenu_2400: Life_RscButtonMenu",[1,"Enlist my vehicle! (Cannot be reversed!)",["0.308789 * safezoneW + safezoneX","0.724015 * safezoneH + safezoneY","0.382319 * safezoneW","0.0420106 * safezoneH"],[1,1,1,1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],["idc = 2400;","onButtonClick = |[] call life_fnc_applyBallotApplicationMenu;|;"]],
	[1003,"RscButtonMenu_2401: Life_RscButtonMenu",[1,"Close",["0.296965 * safezoneW + safezoneX","0.780018 * safezoneH + safezoneY","0.0597309 * safezoneW","0.028 * safezoneH"],[1,1,1,1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],["idc = 2401;","onButtonClick = |closeDialog 0;|;"]],
	[1004,"RscText_1003: Life_RscText",[1,"Enter Your Description",["0.308908 * safezoneW + safezoneX","0.4972 * safezoneH + safezoneY","0.382319 * safezoneW","0.0280071 * safezoneH"],[-1,-1,-1,-1],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],"","-1"],["idc = 1003;"]],
	[1005,"TextShow: Life_RscControlsGroup",[1,"",["0.308908 * safezoneW + safezoneX","0.528002 * safezoneH + safezoneY","0.382184 * safezoneW","0.182012 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1006,"",[1,"Enter Auction Price: Â£",["0.308908 * safezoneW + safezoneX","0.415995 * safezoneH + safezoneY","0.119432 * safezoneW","0.0700046 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"",[1,"",["0.424758 * safezoneW + safezoneX","0.429995 * safezoneH + safezoneY","0.0895743 * safezoneW","0.0420027 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"",[1,"",["0.308908 * safezoneW + safezoneX","0.303987 * safezoneH + safezoneY","0.382184 * safezoneW","0.112007 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class auctionSubmitMenu {
	idd = 13750;
	name = "auctionSubmitMenu";
	movingEnable = false;
	enableSimulation = true;

	class controls {

		class RscText_1000: Life_RscText
		{
			idc = 1000;

			text = "Auction Car Dialog"; //--- ToDo: Localize;
			x = 0.296965 * safezoneW + safezoneX;
			y = 0.261984 * safezoneH + safezoneY;
			w = 0.40617 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;

			x = 0.296965 * safezoneW + safezoneX;
			y = 0.289986 * safezoneH + safezoneY;
			w = 0.40617 * safezoneW;
			h = 0.490001 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "[] call life_fnc_auctionEnlist;";

			text = "Enlist my vehicle! (Cannot be reversed!)"; //--- ToDo: Localize;
			x = 0.308789 * safezoneW + safezoneX;
			y = 0.724015 * safezoneH + safezoneY;
			w = 0.382319 * safezoneW;
			h = 0.0420106 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			onButtonClick = "closeDialog 0;";

			text = "Close"; //--- ToDo: Localize;
			x = 0.296965 * safezoneW + safezoneX;
			y = 0.780018 * safezoneH + safezoneY;
			w = 0.0597309 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;

			text = "Enter Your Description"; //--- ToDo: Localize;
			x = 0.308908 * safezoneW + safezoneX;
			y = 0.4972 * safezoneH + safezoneY;
			w = 0.382319 * safezoneW;
			h = 0.0280071 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class TextShow: Life_RscControlsGroup
		{
			idc = 1005;
			x = 0.308908 * safezoneW + safezoneX;
			y = 0.528002 * safezoneH + safezoneY;
			w = 0.382184 * safezoneW;
			h = 0.182012 * safezoneH;

			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class RscStructuredText_1100: Life_RscEdit
				{
					idc = 1600;
					text = "";
					x = 0;
					y = 0;
					w = 0.380319 * safezoneW;
					h = 1;//h = 2.15;

					type = 2; // CT_EDIT
					sizeEx = 0.045;
					style = 16; // ST_MULTI

					shadow = 0;
					colorBackground[] = {0.28,0.28,0.28,0.28};
				};
			};
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Enter Minimum Bid: £"; //--- ToDo: Localize;
			x = 0.308908 * safezoneW + safezoneX;
			y = 0.415995 * safezoneH + safezoneY;
			w = 0.119432 * safezoneW;
			h = 0.0700046 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			text = "10000";
			x = 0.424758 * safezoneW + safezoneX;
			y = 0.429995 * safezoneH + safezoneY;
			w = 0.0895743 * safezoneW;
			h = 0.0420027 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			x = 0.308908 * safezoneW + safezoneX;
			y = 0.303987 * safezoneH + safezoneY;
			w = 0.382184 * safezoneW;
			h = 0.112007 * safezoneH;
		};
		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "icons\abaylogo.paa";
			x = 0.608683 * safezoneW + safezoneX;
			y = 0.298387 * safezoneH + safezoneY;
			w = 0.0895743 * safezoneW;
			h = 0.0840055 * safezoneH;
		};
	};
};

class auctionMenu {
	idd = 13750;
	name = "auctionMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "_dialog = _this select 0; (_dialog displayCtrl 2400) ctrlShow false; (_dialog displayCtrl 1008) ctrlShow false; (_dialog displayCtrl 1400) ctrlShow false;";

	class controls {
		class RscText_1000: Life_RscText
		{
			idc = 1000;

			text = "aBay Online Auctions"; //--- ToDo: Localize;
			x = 0.296965 * safezoneW + safezoneX;
			y = 0.261984 * safezoneH + safezoneY;
			w = 0.40617 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;

			x = 0.296965 * safezoneW + safezoneX;
			y = 0.289986 * safezoneH + safezoneY;
			w = 0.40617 * safezoneW;
			h = 0.490001 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
		};
		class RscListbox_1500: Life_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[] call life_fnc_auctionMenuSelect;";

			x = 0.302937 * safezoneW + safezoneX;
			y = 0.331989 * safezoneH + safezoneY;
			w = 0.119432 * safezoneW;
			h = 0.420027 * safezoneH;
		};
		class TextShow: Life_RscControlsGroup
		{
			idc = 1003;
			x = 0.430729 * safezoneW + safezoneX;
			y = 0.429995 * safezoneH + safezoneY;
			w = 0.25678 * safezoneW;
			h = 0.224015 * safezoneH;

			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class RscStructuredText_1100: Life_RscStructuredText
				{
					idc = 1600;
					text = "";
					x = 0;
					y = 0;
					w = 0.380319 * safezoneW;
					h = 1;
				};
			};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "[] call life_fnc_auctionMenuBid;";

			text = "Make Bid"; //--- ToDo: Localize;
			x = 0.428341 * safezoneW + safezoneX;
			y = 0.710014 * safezoneH + safezoneY;
			w = 0.262816 * safezoneW;
			h = 0.0419999 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			onButtonClick = "closeDialog 0;";

			text = "Close"; //--- ToDo: Localize;
			x = 0.296965 * safezoneW + safezoneX;
			y = 0.780018 * safezoneH + safezoneY;
			w = 0.0597309 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;

			text = "Items"; //--- ToDo: Localize;
			x = 0.302937 * safezoneW + safezoneX;
			y = 0.303987 * safezoneH + safezoneY;
			w = 0.119432 * safezoneW;
			h = 0.0280018 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;

			text = "Information"; //--- ToDo: Localize;
			x = 0.428341 * safezoneW + safezoneX;
			y = 0.303987 * safezoneH + safezoneY;
			w = 0.262816 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.428341 * safezoneW + safezoneX;
			y = 0.331989 * safezoneH + safezoneY;
			w = 0.262751 * safezoneW;
			h = 0.0840055 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.494028 * safezoneW + safezoneX;
			y = 0.662411 * safezoneH + safezoneY;
			w = 0.197063 * safezoneW;
			h = 0.0420027 * safezoneH;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "Enter bid: £"; //--- ToDo: Localize;
			x = 0.428341 * safezoneW + safezoneX;
			y = 0.668011 * safezoneH + safezoneY;
			w = 0.0656878 * safezoneW;
			h = 0.0280018 * safezoneH;
		};
	};
};