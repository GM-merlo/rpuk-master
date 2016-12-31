/*
* @File:   config.cpp
* @Author: Tonic + Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
class DefaultEventhandlers;
class CfgPatches
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic","Ciaran"};
	};
};

#include "\life_server\remote_exec.h"

class alukac_anticheatcfg
{
	#include "\@life_server\alukac_anticheatcfg.hpp"
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};

	class AntiCheat
	{
		tag = "ALUKAC";
		class AC
		{
			file = "\life_server\Antihack";
			class serverSideAC {};
			class broadcastAlert {};
			class stashReport {};
			class alukAC {};
			class alukAdminMenu {};
		};
	};

	class Police
	{
		tag = "POLICE";
		class POLICE
		{
			file = "\life_server\Functions\Police";
			class stationAlarm {};
		};
	};

	class CellphoneSystem
	{
		tag = "CELL";
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class deleteMsg {};
		};
	};

	class Mayor
	{
		tag = "MAYOR";
		class Mayor
		{
			file = "\life_server\Functions\Mayor";
			class getBallotEntries {};
			class submitBallot {};
			class submitBallotApplication {};
			class checkBallotApplication {};
		};
	};

	class Auction
	{
		tag = "AUCTION";
		class Mayor
		{
			file = "\life_server\Functions\auction";
			class auctionEnlist {};
			class getAuctions {};
			class auctionBid {};
		};
	};

	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class preparedCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
		};
	};

	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedBounty {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
		};

		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
		};

		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};
	};

	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class bankServerSetup {};
			class managesc {};
			class adminChatJoin {}; //Join admin chat.
			class cleanup {};
			class vehicleCreate {};
			class vehicleDead {};
			class vehicleCrushed {}; //Ciaran 14/08/2014 Crushed function instead of leeching off the vehicledead one.
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class MoneyRecord {}; //NDJ 07Apr14 Money transaction logging
			class slotStat {};
			class slotStatSend {};
			class updateVehicle {};
			class rebelGroupHandle {};
			class stationTimer {};
			class consoleLog {};
			class wreckManager {};
			class noDamage {};
			class captureAreaServer {};
			class configuration {};
			class securityCamsDisable {};

			class buildableDeleted {};
			class buildablePlaced {};
		};

		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
			class checkHouse {};
		};

		class Market
		{
			file = "\life_server\Functions\Market";
			class buyItem {};
			class sellItem {};
		};

		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
			class updateGangFunds {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};

/* REMOVED NDJ 23/07/16 because fix_headgear has been switched off!
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
*/


};
