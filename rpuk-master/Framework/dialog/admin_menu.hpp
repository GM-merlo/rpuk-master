class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.1,0.431943,0.825125,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (3 / 250);
		};
	};

	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "$STR_Admin_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class PlayerList_Admin : Life_RscListBox
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

			x = 0.11; 
			y = 0.26;
			w = 0.31; 
			h = 0.6  - (3 / 250);
		};

		class PlayerBInfoGroup : Life_RscControlsGroup { 
			idc = -1; 
			x = 0.42;
			y = 0.35;
			w = 0.45;
			h = 0.6  - (5 / 250);
 
			class Controls { 
				class PlayerBInfo : Life_RscStructuredText { 
					idc = 2903; 
					text = "";
					x = 0;
					y = 0;
					w = 0.35;
					h = 1; 
				}; 
			}; 
		}; 

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GcamButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Get GUID";
			//onButtonClick = "[] call life_fnc_admingetID;";
			x = -0.06 + (12.6 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class moneyEdit : Life_RscEdit {
			idc = 2904;
			text = "1";
			x = 0.44; 
			y = 0.26;
			w = 0.125; 
			h = 0.05;
		};

		class CameraButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Camera";
			onButtonClick = "closeDialog 0; hint ""Welcome to the Camera""; [] call BIS_fnc_camera;";
			x = -0.06 + (18.86 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class EquipAdminGear : Life_RscButtonMenu {
			idc = -1;
			text = "AdminGear";
			onButtonClick = "[] spawn life_fnc_adminGear;";
			x = -0.06 + (25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ToHand : Life_RscButtonMenu {
			text = "To Hand";
			onButtonClick = "[false] call life_fnc_adminComp;";
			x = 0.59; 
			y = 0.26;
			w = 0.15;
			h = 0.05;
		};

		class ToBank : Life_RscButtonMenu {
			text = "To Bank";
			onButtonClick = "[true] call life_fnc_adminComp;";
			x = 0.75; 
			y = 0.26;
			w = 0.15;
			h = 0.05;
		};

		class WantedMenuButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Wanted List";
			onButtonClick = "[false] spawn life_fnc_wantedMenu;";
			x = -0.06 + (31.3 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
