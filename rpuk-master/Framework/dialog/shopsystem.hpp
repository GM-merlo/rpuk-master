/*
  RolePlay.co.uk
  Copyright (c) RolePlay.co.uk 2014 - 2016

  The usage of this file is restricted to RolePlay.co.uk
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
class RPUK_ClothingStore {
    idd = 56100;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {

        class RscText_1000: Life_RscText
        {
            idc = 1000;
            x = 0.257656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.517 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1001: Life_RscText
        {
            idc = 1001;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.517 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1002: Life_RscText
        {
            idc = 1002;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.517 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls {    
        class RscText_1004: Life_RscText
        {
            idc = 1004;
            text = "Shop Name Title Here"; //--- ToDo: Localize;
            x = 0.257656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1005: Life_RscText
        {
            idc = 1005;
            text = "Additional Item Information"; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1006: Life_RscText
        {
            idc = 1006;
            text = "Your Shopping Cart"; //--- ToDo: Localize;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1003: Life_RscStructuredText
        {
            idc = 1003;
            text = "Cash on Hand: $11"; //--- ToDo: Localize;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1007: Life_RscStructuredText
        {
            idc = 1007;
            text = "Total Cart Cost:"; //--- ToDo: Localize;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1008: Life_RscText
        {
            idc = 1008;
            text = "0/20"; //--- ToDo: Localize;
            x = 0.711407 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class shoplist: Life_RscListbox
        {
            idc = 1500;
            sizeEx = 0.035;
            text = "";
            onLBSelChanged = "_this call life_fnc_clothingSelect";            
            x = 0.257656 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.407 * safezoneH;
        };
        class RscCombo_2100: Life_RscCombo
        {
            idc = 2100;
            text = "";            
            sizeEx = 0.035;
            onLBSelChanged = "_this call life_fnc_clothingMenuFilter";
            x = 0.257656 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscStructuredText_1100: Life_RscStructuredText
        {
            idc = 1100;
            text = "";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.429 * safezoneH;
        };
        class RscButtonMenu_2400: Life_RscButtonMenu
        {
            idc = 2400;
            text = "Add To Cart"; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_shopAddCart;";
        };
        class RscButtonMenu_2401: Life_RscButtonMenu
        {
            idc = 2401;
            text = "Preview"; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] spawn life_fnc_clothingPreviewOpen;";
        };
        class RscButtonMenu_2402: Life_RscButtonMenu
        {
            idc = 2402;
            text = "Remove from Cart"; //--- ToDo: Localize;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_shopRemoveCart;";
        };
        class RscButtonMenu_2403: Life_RscButtonMenu
        {
            idc = 2403;
            text = "Finalise and Purchase"; //--- ToDo: Localize;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] spawn life_fnc_shopCheckOut;";
        };
        class cartlist: Life_RscListbox
        {
            idc = 1501;
            text = "";
            sizeEx = 0.035;
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.352 * safezoneH;
        };
        class RscButtonMenu_2404: Life_RscButtonMenu
        {
            idc = 2404;
            text = "Exit Shop"; //--- ToDo: Localize;
            x = 0.257656 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_shopMenuClose;";
        };
        //
        class itempreviewbackgr: Life_RscText
        {
            idc = 1009;
            text = "";
            x = 0.025625 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.242 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1010: Life_RscText
        {
            idc = 1010;
            text = "Item Preview"; //--- ToDo: Localize;
            x = 0.025625 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class itempreview: Life_RscStructuredText
        {
            idc = 1101;
            text = "";
            x = 0.025625 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.176 * safezoneH;
        };
        class RscButtonMenu_2405: Life_RscButtonMenu
        {
            idc = 2405;
            text = "Exit Preview"; //--- ToDo: Localize;
            x = 0.0256248 * safezoneW + safezoneX;
            y = 0.907 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] spawn life_fnc_clothingPreviewClose;";
        }; 
    };
};               
