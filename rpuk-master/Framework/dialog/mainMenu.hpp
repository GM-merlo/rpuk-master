/*
    RolePlay.co.uk
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
class RPUK_MainMenu 
{
    idd = 42500;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground 
    {
        class RscText_1001: Life_RscText
        {
            idc = -1;
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.027 * safezoneH + safezoneY;
            w = 0.959063 * safezoneW;
            h = 0.132 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls
    {   
        class RscButtonMenu_2400: Life_RscButtonMenu
        {
            idc = 2400;
            text = "Enter Tanoa"; //--- ToDo: Localize;
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_2401: Life_RscButtonMenu
        {
            idc = 2401;
            text = "My Stats"; //--- ToDo: Localize;
            x = 0.144219 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_2402: Life_RscButtonMenu
        {
            idc = 2402;
            text = "Back to Lobby"; //--- ToDo: Localize;
            x = 0.860935 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscPicture_1200: Life_RscPicture
        {
            idc = 1200;
            text = "menu.paa";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.154 * safezoneH;
        };
        class RscStructuredText_1100: Life_RscStructuredText
        {
            idc = 1100;
            text = ""; //--- ToDo: Localize;
            x = 0.0359375 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.088 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscStructuredText_1101: Life_RscStructuredText
        {
            idc = 1101;
            text = ""; //--- ToDo: Localize;
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.088 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscButtonMenu_2403: Life_RscButtonMenu
        {
            idc = 2403;
            text = "Current Server Stats"; //--- ToDo: Localize;
            x = 0.2525 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_2404: Life_RscButtonMenu
        {
            idc = 2404;
            text = "Credits"; //--- ToDo: Localize;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_2405: Life_RscButtonMenu
        {
            idc = 2405;
            text = "Additional Information"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_2406: Life_RscButtonMenu
        {
            idc = 2406;
            text = "------------------"; //--- ToDo: Localize;
            x = 0.70625 * safezoneW + safezoneX;
            y = 0.159 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class mystatspage: Life_RscStructuredText
        {
            idc = 1102;
            text = "";
            x = 0.144219 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.484 * safezoneH;
        };
        class currentserverstats: Life_RscStructuredText
        {
            idc = 1103;
            text = "";
            x = 0.2525 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.484 * safezoneH;
        };
        class credits: Life_RscStructuredText
        {
            idc = 1104;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.484 * safezoneH;
            text = "";
        };
        class additionalinfo: Life_RscStructuredText
        {
            idc = 1105;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.484 * safezoneH;
            text = "";
        };
    };
};            

