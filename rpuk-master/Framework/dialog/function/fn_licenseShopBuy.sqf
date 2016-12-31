/*
	File: fn_licenseShopBuy.sqf
	Author: Ciaran Langton
	
	Description:
	Buys a license from the shop.
*/
_licenseToBuy = lbData[1500,(lbCurSel 1500)];
if(isNil '_licenseToBuy' || _licenseToBuy == "") exitWith {hint "Please select a license...";};
closeDialog 0;
["","","",_licenseToBuy] spawn life_fnc_buyLicense; //Replicate Callback to normal license buying.