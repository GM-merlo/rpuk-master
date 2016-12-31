/*
	File: fn_getBuilding.sqf

	Author: Ciaran
	Date: 2015-12-01 18:44:25
	Last Modified by: Ciaran
	Last Modified time: 2015-12-01 18:47:42
*/
private [ "_houses", "_foundHouses" ];

switch (worldName) do {
	case "Altis": {
		_houses = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F",  "Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F",  "Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F","Land_Slum_House02_F","Land_i_Stone_Shed_V1_F"];
	};
	case "Stratis": {
		_houses = [];
	};
	case "Tanoa": {
		_houses = [
			"Land_Hotel_01_F",
			"Land_Hotel_02_F",
			"Land_House_Big_01_F",
			"Land_House_Big_02_F",
			"Land_House_Big_03_F",
			"Land_House_Big_04_F",
			"Land_House_Small_01_F", //INSECURE: open doorway at back!
			"Land_House_Small_02_F",
			"Land_House_Small_03_F",
			"Land_House_Small_04_F",
			"Land_House_Small_05_F",
			"Land_House_Small_06_F",
			"Land_GarageShelter_01_F", //INSECURE: can climb through window
			"Land_Slum_01_F", //INSECURE: can climb through window
			"Land_Slum_03_F",
			"Land_Shed_02_F",
			"Land_Shed_05_F" //INSECURE: can climb through window
		];
	};
};

_foundHouses = nearestObjects [ _this, _houses, 10 ];
if ( count _foundHouses < 1 ) exitWith { objNull };
_foundHouses select 0