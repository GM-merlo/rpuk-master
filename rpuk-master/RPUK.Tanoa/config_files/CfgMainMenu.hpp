/*
* @File:   CfgMainMenu.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* LAYOUT:
* {"DisplayName","MarkerName","Logo","Conditional Statement"}
*/
class CfgMainMenu
{
  animations[] = {
    "HubBriefing_scratch",
    "HubBriefing_stretch",
    "HubBriefing_think",
    "HubBriefing_lookAround1",
    "HubBriefing_lookAround2",
    "HubBriefing_pointAtTable",
    "HubBriefing_pointLeft",
    "HubBriefing_pointRight",
    "HubBriefing_talkAround"
  };

    class Tanoa
    {
        mainmenuspawn[] = {1910.600,803.302,0,300.313};
        leftstructuredtext = "<t size='2' align='left'>Welcome, %1, to RPUK %2 Life</t><br/><t size='1.2' align='left'>RPUK Modpack: %3</t>";
        rightstructuredtext = "<t size='2' align='right'>RolePlay.co.uk</t><br/><t size='1.2' align='right'>Version 1.0.0</t>";
    };
};
