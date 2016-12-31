/* 
	File: fn_auctionMenu.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-28 01:19:53
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-05 01:39:08
*/
if(dialog) exitWith {};
if(!createDialog "auctionMenu") exitWith {};
[[player],"AUCTION_fnc_getAuctions",(call life_fnc_findTransactionMethod)] spawn life_fnc_MP;