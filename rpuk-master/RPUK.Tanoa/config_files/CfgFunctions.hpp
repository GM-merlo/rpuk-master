/*
* @File:   CfgFunctions.hpp
* @Author: Tonic + Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
class CfgFunctions {
  class Socket_Reciever {
  	tag = "SOCK";

  	class SQL_Socket {
  		file = "core\session";
  		class requestReceived {};
  		class dataQuery {};
  		class insertPlayerInfo {};
  		class updateRequest {};
  		class syncData {};
  		class updatePartial {};
  	};
  };

  class Life_Client_Core {
  	tag = "life";

  	class Master_Directory {
  		file = "core";
  		class setupActions {};
  		class setupEVH {};
  		class initCiv {};
  		class initCop {};
  		class initMedic {};
  		class welcomeNotification {};
  		class markerBlock {preInit = 1;};
  		class init;
  	};

  	class Slots {
  		file = "core\casino\slots";
  		class slotInit {};
  		class slotPlay {};
  		class slotRandom {};
  		class slotRewards {};
  		class slotStat {}; //---MP VERIFIED
  	};

  	class Banks {
  		file = "core\banks";
  		class bankLoot {};
  		class fixBankDoor {};
  		class launderMoney {};
  		class stashWeapons {};
  	};

  	class ProfessionSystem {
  		file = "core\professionssystem";
  		class professionMenu {};
  		class selectProfession {};
  		class addProfessionPoints {};
  		class getProfessionLevel {};
  		class getProfessionNextLevel {};
  		class getProfessionXp {};
  	};

  	class Mobile {
  		file = "core\mobile";
  		class mobileOpen {};
  		class mobilePlayerFilter {};
  		class mobileReply {};
  		class mobileSendMessage {};
  		class mobileSwitchDialog {};
  		class mobileMessageKeyUp {};
  		class mobileStartMessage {};
  		class mobileMessageReceived {};
  		class mobileMessageShow {};
  		class mobileMessageSelect {};
  	};

  	class Modshop {
  		file = "core\modshop";
  		class modShopClose {};
  		class modShopInit {};
  		class modShopSave {};
  		class modShopUpdate {};
  	};

  	class Mayor {
  		file = "core\mayor";
  		class openBallotMenu {};
  		class populateBallotMenu {};
  		class selectBallotMenu {};
  		class voteBallotMenu {};
  		class applyBallotApplicationMenu {};
  		class openBallotApplicationMenu {};
  		class openBallotApplicationMenuClient {};
  	};

  	class WantedList {
  		file = "core\wantedlist";
  		class addCrime {};
  		class removeCrimes {};
  		class initWantedAdd {};
  		class addWantedPlayer {};
  	};

  	class Auction {
  		file = "core\auction";
  		class auctionCar {};
  		class auctionEnlist {};
  		class auctionMenuReceive {};
  		class auctionMenu {};
  		class auctionMenuSelect {};
  		class auctionMenuBid {};
  	};

  	class BountyHunter {
  		file = "core\bountyhunter";
  		class licenseSwap {};
  		class bountySelect {};
  	};

  	class Admin {
  		file = "core\admin";
  		class admininfo {};
  		class adminid {};
  		class adminMenu {};
  		class adminQuery {};
  		class adminComp {}; //CL - Add admin compensation.
  		class adminGear {};
  	};

  	class Medical_System {
  		file = "core\medical";
  		class onPlayerKilled {};
  		class onPlayerRespawn {};
  		class respawned {};
  		class revivePlayer {};
  		class revived {};
  		class requestMedic {};
  		class medicRequest {};
  		class deathScreen {};
  		class medicLoadout {};
  		class medicSirenLights {};
  		class medicLights {};
  		class medicSiren {};
  		class medicInteractionMenu {};
  		class medicDrag {};
  		class medicDragFrameUpdate {};
  		class openMedipad {};
  		class medilogSubmit {};
  		class deadBloodEffect {};
  		class newLifeRule {};
  		class breakLeg {};
  	};

  	class Racetrack {
  		file = "core\racetrack";
  		class raceStart {};
  	};

  	class Actions {
  		file = "core\actions";
  		class skinAnimal {};
  		class animMenu {};
  		class buyLicense {};
  		class healHospital {};
  		class pushVehicle {};
  		class repairTruck {};
  		class serviceChopper {};
  		class catchFish {};
  		class catchTurtle {};
  		class dpFinish {};
		class busdriveFinish {};
  		class surrender {}; //Surrendering CL - 14/08/2014
  		class searchBoatWreck {}; //Searching boats CL - 13/08/2014
  		class dropFishingNet {};
  		class getDPMission {};
  		class getbusdriveMission {};
 		class postBail {};
  		class processAction {};
  		class arrestAction {};
  		class escortAction {};
  		class impoundAction {};
  		class pulloutAction {};
  		class putInCar {};
  		class stopEscorting {};
  		class restrainAction {};
  		class searchAction {};
  		class searchVehAction {};
  		class unrestrain {};
  		class pickupItem {};
  		class pickupMoney {};
  		class ticketAction {};
  		class packupSpikes {};
  		class storeVehicle {};
  		class robAction {};
  		class captureHideout {};
  		class gather {};
  		class CrushAction {}; //NDJ 15May14
  		class skyDiving {};
  		class collectPlanks {};
  		class collectWood {};
  		class jailBreakout {};
  		class jailBreakoutCompleted {};
  		class hackFedCam {};
  	};

  	class Nightclub {
  		file = "core\nightclub";
  		class nclights {};
  		class ncLightsOn {};
  		class ncmusic {};
  		class ncstage {};
  		class ncsmoke {};
  		class ncflash {};
  		class ncFlashOn {};
  	};

  	class Housing {
  		file = "core\housing";
  		class buyHouse {};
  		class getBuilding {};
  		class getBuildingPositions {};
  		class houseMenu {};
  		class lightHouse {};
  		class lightHouseAction {};
  		class sellHouse {};
  		class initHouses {};
  		class copBreakDoor {};
  		class raidHouse {};
  		class lockupHouse {};
  		class copHouseOwner {};
  		class lockHouse {};
  	};

  	class Config {
  		file = "core\config";
  		class licensePrice {};
  		class vehicleColorCfg {};
  		class vehicleColorStr {};
  		class vehicleListCfg {};
  		class licenseType {};
  		class eatFood {};
  		class varHandle {};
  		class varToStr {};
  		class impoundPrice {};
  		class itemWeight {};
  		class taxRate {};
  		class vehShopLicenses {};
  		class vehicleAnimate {};
  		class weaponShopCfg {};
  		class vehicleWeightCfg {};
  		class houseConfig {};
  		class itemImage {};
  	};

  	class Player_Menu {
  		file = "core\pmenu";
  		class wantedList {};
  		class wantedInfo {};
  		class wantedMenu {};
  		class pardon {};
  		class giveItem {};
  		class giveMoney {};
  		class p_openMenu {};
  		class p_updateMenu {};
  		class removeItem {};
  		class useItem {};
  		class cellphone {};
  		class keyMenu {};
  		class keyGive {};
  		class keyDrop {};
  		class s_onSliderChange {};
  		class updateViewDistance {};
  		class settingsMenu {};
  		class settingsInit {};

  		//CL - ADDING NEW PHONE
  		class smartphone {};
  		class newMsg {};
  		class showMsg {};
  		class changeFPS {};
  		class changeEnvironment {};
  	};

  	class Functions {
  		file = "core\functions";
  		class calWeightDiff {};
  		class fetchCfgDetails {};
  		class handleInv {};
  		class hudSetup {};
  		class hudUpdate {};
  		class fetchGear{};
  		class tazeSound {};
  		class animSync {};
  		class simDisable {};
  		class keyHandler {};
  		class dropItems {};
  		class handleDamage {};
  		class numberText {};
  		class handleItem {};
  		class accType {};
  		class receiveItem {};
  		class giveDiff {};
  		class receiveMoney {};
  		class playerTags {};
  		class clearVehicleAmmo {};
  		class pullOutVeh {};
  		class nearUnits {};
  		class actionKeyHandler {};
  		class playerCount {};
  		class fetchDeadGear {};
  		class loadDeadGear {};
  		class isnumeric {};
  		class escInterupt {};
  		class onTakeItem {};
  		class fetchVehInfo {};
  		class pushObject {};
  		class onFired {};
  		class onPutItem {};
  		class revealObjects {};
  		class nearestDoor {};
  		class inventoryClosed {};
  		class inventoryOpened {};
  		class isUIDActive {};
  		class playSound {}; //NDJ Mar14
  		class HandleUniforms {}; //NDJ 03May14
  		class ReTexUniform {}; //NDJ 03May14
  		class ReTexBackpack {}; //CL 16/08/2014
  		class saveGear {};
  		class stripDownPlayer {};
  		class loadGear {};
  		class speaking {}; //CL 13/09/2014
  		class ropeBlock {};
  		class goodbye {}; //CL 08/01/2015
  		class welcome {};
  		class nearATM {};
  		class nearPhone {};
  		class flashbangHandler {};
  		class hideObjects {};
  		class loadMap;
  		class toGridRef; //NDJ 11/08/2016
  	};

  	class Network {
  		file = "core\functions\network";
  		class broadcast {};
  		class MP {};
  		class MPexec {};
  		class netSetVar {};
  		class corpse {};
  		class jumpFnc {};
  		class soundDevice {};
  		class setFuel {};
  		class setTexture {};
  		class say3D {};
  		class bountyTaze {};
  		class earthquake {};
  		class findTransactionMethod {};
  	};

  	class GUI {
  		file = "core\functions\gui";
  		class handleMapMarkers {};
  		class showNotification {};
  	};

  	class Civilian {
  		file = "core\civilian";
  		class jailMe {};
  		class jail {};
  		class tazed {};
  		class civInteractionMenu {};
  		class knockedOut {};
  		class jobCentre {};
  		class knockoutAction {};
  		class rbRecv{}; //NDJ Mar14
  		class robPerson {};
  		class removeLicenses {};
  		class zoneCreator {};
  		class civLoadout {};
  		class demoChargeTimer {};
  		class breakoutTimer {};
  		class isRebel {};
  		class huntingAreaSetup {};
  		class robStation {};
  	};

  	class Vehicle {
  		file = "core\vehicle";
  		class colorVehicle {};
  		class openInventory {};
  		class lockVehicle {};
  		class vehicleOwners {};
  		class vehStoreItem {};
  		class vehTakeItem {};
  		class vehInventory {};
  		class vInteractionMenu {};
  		class vehicleWeight {};
  		class deviceMine {};
  		class addVehicle2Chain {};
  		class fuelManager {};
  		class refuelVehicle {};
  		class parkingTicket {};
  		class buyParkingTicket {};
  		class spawnIndicator {};
  		class vehSync {};
  	};

  	class VehicleIndicators {
  		file = "core\vehicle\indicators";
  		class indicators {};
  		class initIndicators {};
  	};

  	class Cop {
  		file = "core\cop";
  		//class copMarkers {};
  		class copLights {};
  		class vehInvSearch {};
  		class copSearch {};
  		class seizeWeapons {};
  		class seizeWeaponsClient {};
  		class searchClient {};
  		class restrain {};
  		class copLoadout {};
  		class ticketGive {};
  		class ticketPay {};
  		class ticketPrompt {};
  		class copSiren {};
  		class spikeStripEffect {};
  		class questionDealer {};
  		class copInteractionMenu {};
  		class sirenLights {};
  		class licenseCheck {};
  		class licensesRead {};
  		class repairDoor {};
  		class doorAnimate {};
  		class fedCamDisplay {};
  		class copRadar {}; //NDJ Mar14
  		class copANPR_Radar{}; //NDJ Mar14
  		class ticketPaid {};
  		class breathalyse {};
  		class toggleAlarm {};
  		class isAR {};
  		class isMPU {};
  		class isNPAS {};
  		class isNIU {};
  	};

  	class Gangs {
  		file = "core\gangs";
  		class initGang {};
  		class createGang {};
  		class gangCreated {};
  		class gangMenu {};
  		class gangKick {};
  		class gangLeave {};
  		class gangNewLeader {};
  		class gangUpgrade {};
  		class gangInvitePlayer {};
  		class gangInvite {};
  		class gangDisband {};
  		class gangDisbanded {};
  		class gangFundAdd {};
  		class gangSetRank {};
  		class updateGangRank {};
  	};

  	class CaptureZones {
  		file = "core\gangs\capture";
  		class areaCapture {};
  		class areaCaptureUpdate {};
  		class gangCapturePaycheck {};
  	};

  	class Shops {
  		file = "core\shops";
  		class atmMenu {};
  		class buyClothes {};
  		class changeClothes {};
  		class clothingMenu {};
  		class clothingFilter {};
  		class vehicleShopMenu {};
  		class vehicleShopLBChange {};
  		class vehicleShopBuy {};
  		class weaponShopFilter {};
  		class weaponShopMenu {};
  		class weaponShopSelection {};
  		class weaponShopBuySell {};
  		class virt_buy {};
  		class virt_menu {};
  		class virt_update {};
  		class virt_sell {};
  		class chopShopMenu {};
  		class chopShopSelection {};
  		class chopShopSell {};
  	};

  	class Items {
  		file = "core\items";
  		class pickaxeUse {};
  		class lockpick {};
  		class spikeStrip {};
  		class jerryRefuel {};
  		class boltcutter {};
  		class blastingCharge {};
  		class defuseKit {};
  		class storageBox {};
  		class placeObject {};
  		class drink {};
  		class removeObject {};
  		class druguse {};
  		class codebreaker {};
  	};

  	class Dialog_Controls {
  		file = "dialog\function";
  		class setMapPosition {};
  		class displayHandler {};
  		//class spawnConfirm {};
  		//class spawnMenu {};
  		//class spawnPointSelected {};
  		class progressBar {};
  		class impoundMenu {};
  		class unimpound {};
  		class sellGarage {};
  		class bankDeposit {};
  		class bankWithdraw {};
  		class bankTransfer {};
  		class garageLBChange {};
  		class safeInventory {};
  		class safeOpen {};
  		class safeTake {};
  		class safeFix {};
  		class vehicleGarage {};
  		class gangDeposit {};
  		class licenseShopOpen {};
  		class licenseShopBuy {};
  		class marketPricesOpen {};
  		class marketPricesUpdate {};
  		class interactionMenuOpen {};
  		class setLoadingText;
  	};

	class SpawnMenu {
		file = "core\spawnmenu";
		class spawnConfirm;
		class spawnCreateCam;
		class spawnMenu;
		class spawnPointSelected;
		class spawnMenuSetup;
		class spawnUnload;
	};

	class ShopSystem {
        file = "core\shopsystem";
        class clothingMenuFilter;
        class clothingMenuOpen;
        class clothingPreviewOpen;
        class clothingPreviewClose;
        class clothingSelect;
        class shopAddCart;
        class shopCheckOut;
        class shopMenuOpen;
        class shopMenuClose;
        class shopRemoveCart;
    };

    class XP {
  		file = "core\xp";
  		class getLevel;
  		class addXP;
  		class itemUnlocked;
  		class getXPProgress;
      class getItemsForLevel;
    };
  };
};
