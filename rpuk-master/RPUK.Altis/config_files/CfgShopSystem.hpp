/*
    RolePlay.co.uk
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

/*
  EXAMPLE
  MISSION.SQM
  this addAction["Wilco's Jeans",life_fnc_shopMenuOpen,[civilian,"clothing","wilcosjeans"],0,false,false,"",'!life_action_inUse'];
*/

class CfgShopSystem {
  class clothing {
    class U_C_Driver_1_black
    {
      class price
      {
        civ = 100;
      };
    };
    class U_C_Driver_1_blue
    {
      class price
      {
        civ = 100;
      };
    };
    class H_RacingHelmet_1_black_F
    {
      class price
      {
        civ = 100;
      };
    };
    class G_Bandanna_oli
    {
      class price
      {
        civ = 100;
      };
    };
    class V_BandollierB_cbr
    {
      class price
      {
        civ = 100;
      };
    };
    class B_OutdoorPack_blk
    {
      class price
      {
        civ = 100;
      };
    };
    /*
    EXAMPLE:
    class arifle_SDAR_F //classname of item
    {
      class price //price for each side
      {
        guer = 0;
        west = 1050;
        civ = 15000;
      };
      class requirement //requirements to find item in shops
      {
        west = "(call life_coplevel) > 1";
        civ = "licence_civ_diver";
      };
      class displayName //Custom Display Name for item (Stun Grenade etc.)
      {
        west = "Taser Rifle";
      };
      class description //Custom Description for Item
      {
        west = "Taser Rifle";
      };
    };
    */
  };
  class weapons {

  };
};
