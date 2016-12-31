/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for buyable houses?
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {
	case (_house in ["Land_Hotel_02_F"]): {[2500000,6]};
	case (_house in ["Land_Hotel_01_F"]): {[1500000,4]};
	case (_house in ["Land_House_Big_01_F","Land_House_Big_02_F","Land_House_Big_04_F"]): {[1000000,3]};
	case (_house in ["Land_House_Big_03_F"]): {[950000,1]};
	case (_house in ["Land_House_Small_02_F","Land_House_Small_03_F"]): {[600000,4]};
	case (_house in ["Land_House_Small_01_F"]): {[300000,4]}; //INSECURE!
	case (_house in ["Land_House_Small_06_F"]): {[350000,2]};
	case (_house in ["Land_House_Small_04_F","Land_House_Small_05_F"]): {[325000,1]};
	case (_house in ["Land_Shed_02_F"]): {[75000,5]};
	case (_house in ["Land_Slum_01_F","Land_Slum_03_F"]): {[55000,4]}; //INSECURE!
	case (_house in ["Land_Shed_05_F"]): {[45000,3]}; //INSECURE!
	case (_house in ["Land_GarageShelter_01_F"]): {[35000,1]}; //INSECURE!
	default {[]};
};
