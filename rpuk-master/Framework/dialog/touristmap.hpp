/* 
	File: touristmap.hpp
	
	Author: Ciaran Langton
	Date: 2015-03-27 23:30:48
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-28 14:16:32
*/
class ALUK_touristmap
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	onUnload = "[] spawn {{if(markerType _x != ""Empty"") then {_x setMarkerAlphaLocal 1;};} forEach allMapMarkers;};";


	class controlsBackground {
		class Map: Life_RscMapControl
		{
			idc = 1200;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;

			x = -0.00161606 * safezoneW + safezoneX;
			y = 0.0407398 * safezoneH + safezoneY;
			w = 1.0092 * safezoneW;
			h = 0.980128 * safezoneH;
		};
	};

	class controls
	{	
		class FilterList: Life_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[] call life_fnc_mapSelectFilter;";

			x = 0.0139101 * safezoneW + safezoneX;
			y = 0.205961 * safezoneH + safezoneY;
			w = 0.107489 * safezoneW;
			h = 0.616081 * safezoneH;
			tooltip = "Select a filter to show the map markers relating to the filter."; //--- ToDo: Localize;
		};
		class FilterText: Life_RscText
		{
			idc = 1001;

			text = "Filters"; //--- ToDo: Localize;
			x = 0.0115215 * safezoneW + safezoneX;
			y = 0.163956 * safezoneH + safezoneY;
			w = 0.112266 * safezoneW;
			h = 0.0420055 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class MapView: Life_RscText
		{
			idc = 1000;

			text = "ALUK Tourist Map"; //--- ToDo: Localize;
			x = -0.00161606 * safezoneW + safezoneX;
			y = -0.00126566 * safezoneH + safezoneY;
			w = 1.0092 * safezoneW;
			h = 0.0420055 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		/*class FilterList:Life_RscListBox
		{
			idc = 1500;
			x = 0.153646 * safezoneW + safezoneX;
			y = 0.231165 * safezoneH + safezoneY;
			w = 0.107489 * safezoneW;
			h = 0.616081 * safezoneH;
			tooltip = "Select a filter to show the map markers relating to the filter."; //--- ToDo: Localize;
			onLBSelChanged = "[] call life_fnc_mapSelectFilter;";
		};
		class MapView : Life_RscText
		{
			idc = 1000;
			text = "ALUK Tourist Map"; //--- ToDo: Localize;
			x = 0.261135 * safezoneW + safezoneX;
			y = 0.149954 * safezoneH + safezoneY;
			w = 0.47773 * safezoneW;
			h = 0.0420055 * safezoneH;
			colorBackground[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class FilterText:Life_RscText
		{
			idc = 1001;
			text = "Filters"; //--- ToDo: Localize;
			x = 0.153646 * safezoneW + safezoneX;
			y = 0.189159 * safezoneH + safezoneY;
			w = 0.107489 * safezoneW;
			h = 0.0420055 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {0.10196078431372,0.10196078431372,0.10196078431372,0.937124};
		};
		class Map: Life_RscMapControl
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.261135 * safezoneW + safezoneX;
			y = 0.19196 * safezoneH + safezoneY;
			w = 0.47773 * safezoneW;
			h = 0.658086 * safezoneH;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};*/
	};
};

/* #Tubipy
$[
	1.063,
	["test",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1500,"FilterList:Life_RscListBox",[1,"",["0.153646 * safezoneW + safezoneX","0.231165 * safezoneH + safezoneY","0.107489 * safezoneW","0.616081 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Select a filter to show the map markers relating to the filter.","-1"],[]],
	[1000,"MapView : Life_RscText",[1,"ALUK Tourist Map",["0.261135 * safezoneW + safezoneX","0.149954 * safezoneH + safezoneY","0.47773 * safezoneW","0.0420055 * safezoneH"],[-1,-1,-1,-1],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],"","-1"],[]],
	[1001,"FilterText:Life_RscText",[1,"Filters",["0.153646 * safezoneW + safezoneX","0.189159 * safezoneH + safezoneY","0.107489 * safezoneW","0.0420055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[0.10196078431372,0.10196078431372,0.10196078431372,0.937124],"","-1"],[]],
	[1200,"Map : Life_RscMapControl",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.261135 * safezoneW + safezoneX","0.19196 * safezoneH + safezoneY","0.47773 * safezoneW","0.658086 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
