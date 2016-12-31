/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {129}; //Standard Driving License
	case "boat": {1000}; //Boat
	case "pilot": {25000}; //Aviation License
	case "gun": {1000}; //Firearm Certficate
	case "dive": {250}; //Diving license
	case "cair": {0}; //Police Aviation License
	case "swat": {0}; //Old SWAT license
	case "cg": {0}; //Coast guard license
	case "mair": {0}; //Medic Air
	case "truck": {3500}; //Truck license
	case "bus": {6000}; //Bus License
	case "diamond": {8000}; //Diamond processing license
	case "salt": {2500}; //Salt processing license
	case "sand": {3000}; //Sand processing license
	case "iron": {3000}; //Iron processing license
	case "copper": {3100}; //Copper processing license
	case "cement": {3000}; //Cement processing license
	case "gang": {1000}; //Gang license
	case "rebel": {45000}; //Rebel license
	case "rebrun": {12500}; //Rebel license (Repurchase)
	case "heroin": {7500}; //Heroin processing license
	case "meth": {6000}; //Meth processing license
	case "marijuana": {5000}; //Marijuana processing license
	case "cocaine": {6000}; //Cocaine processing license
	case "medmarijuana": {10000}; //Medical Marijuana processing license
	case "home": {50000}; //Home Owners Association fees
	case "bounty": {50000}; //Old Bounty Hunter License
	case "taxi": {50000}; //Old Taxi License
	case "arac": {50000}; //Old ARAC License (Altis)
	case "oil": {5000}; //Oil Proccesing (ALTIS)
};