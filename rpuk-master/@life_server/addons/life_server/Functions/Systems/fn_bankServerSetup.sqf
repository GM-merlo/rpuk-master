/* 
	File: fn_bankServerSetup.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-18 17:57:52
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-06-01 21:01:18
*/

_allBanks = [
	["RBA International Reserve", [15288.7,17472.8,-0.224236], "Land_MilOffices_V1_F"],
	["AR Weapon Cache", [3268.73,12470.8,-0.043025], "Land_i_Barracks_V2_F"]
];

_shelfContainers = [
	[0.3,0,0.62],
	[-0.3,0,0.62],
	[0.3,0,0.1],
	[-0.3,0,0.1],
	[0.3,0,-0.38],
	[-0.3,0,-0.38],
	[0.3,0,-0.89],
	[-0.3,0,-0.89]
];

_allBankObjs = [];

{
	_name = _x select 0;
	_pos = _x select 1;
	_classname = _x select 2;

	_target = nearestObjects[_pos, [_classname], 10];
	if(count _target > 0) then {
		_bankBuilding = _target select 0;
		_allBankObjs pushBack [_name,_bankBuilding];
		_bankBuilding setVariable["isBank", true, true];
		_bankBuilding setVariable["bankName", _name, true];
		_doors = getNumber(configFile >> "CfgVehicles" >> (_classname) >> "NumberOfDoors");
		for "_i" from 1 to _doors do {
			_bankBuilding setVariable[format["bis_disabled_Door_%1",_i],1,true];
			_bankBuilding animate [format["door_%1_rot",_i],0];
		};

		_bankMark = createMarker [format["Bank_%1_Marker", str _pos],_pos];
		_bankMark setMarkerType "c_unknown";
		_bankMark setMarkerPos _pos;
		_bankMark setMarkerSize [1,1];
		_bankMark setMarkerText _name;
		_bankMark setMarkerColor "ColorGreen";

		_bankBuilding setVariable["bankMarker", _bankMark, true];

		_bankContainers = [];

		switch (typeOf _bankBuilding) do {
			case "Land_i_Barracks_V2_F":
			{
				_bankBuilding setVariable["bankBlocked",[3,4,5,6,7,8,9,12,13,14,15,16,21,22], true];

				_allTables = [
					[[-6.29346,2.97852,-0.0245633],91.2279],
					[[-13.29346,2.97852,-0.0245633],91.2279],
					[[-13.29346,2.97852,3.3245633],91.2279],
					[[-6.29346,2.97852,3.3345633],91.2279],
					[[1.3,2.97852,3.3345633],91.2279],
					[[2.3,2.97852,3.3345633],91.2279],
					[[2.3,-2.9,3.3345633],91.2279]
				];

				{	
					_v = "OfficeTable_01_new_F" createVehicle [0,0,0]; 
					_v enableSimulation false;
					_v allowDamage false; 
					_pos = _bankBuilding modelToWorld (_x select 0);
					_v setPos [_pos select 0, _pos select 1, (_pos select 2) + .45];
					_v setDir (direction _bankBuilding + (_x select 1));
					_bankContainers pushBack _v;
					_piles = [];
					
					_m = "Land_WoodenBox_F" createVehicle [0,0,0];
					_m enableSimulation false;
					_m allowDamage false;
					_m setVariable["bankItem",true,true];
					_m attachTo[_v, [0,0,.35]];
					_piles pushBack [[0,0,.35], _m, "Land_WoodenBox_F"];
					
					_v setVariable["bankItemPiles", _piles];
				} forEach _allTables;
			};

			case "Land_MilOffices_V1_F":
			{
				_allShelves = [
					[[16.8545,10.7559,-3.31048],88.7266],
					[[16.8545,7.7559,-3.31048],88.7266],
					[[10.8545,4.6,-3.31048],-1.04743]
				];

				{	
					_v = "Land_Metal_wooden_rack_F" createVehicle [0,0,0]; 
					_v enableSimulation false;
					_v allowDamage false; 
					_pos = _bankBuilding modelToWorld (_x select 0);
					_v setPos [_pos select 0, _pos select 1, (_pos select 2) + .45];
					_v setDir (direction _bankBuilding + (_x select 1));
					_bankContainers pushBack _v;
					_piles = [];
					
					{
						_m = "Land_Money_F" createVehicle [0,0,0];
						_m enableSimulation false;
						_m allowDamage false;
						_m setVariable["bankItem",true,true];
						_m attachTo[_v, _x];
						_piles pushBack [_x, _m, "Land_Money_F"];
					} forEach _shelfContainers;
					
					_v setVariable["bankItemPiles", _piles];
				} forEach _allShelves;

			};
		};

		_bankBuilding setVariable["bankContainers", _bankContainers];
	};

} forEach _allBanks;

life_banks = _allBankObjs;
publicVariable "life_banks";

_allBankObjs spawn {
	for "_i" from 0 to 1 step 0 do 
	{
		{
			_branchName = _x select 0;
			_bank = _x select 1;
			{
				_shelf = _x;
				{
					if(isNull (_x select 1)) then {
						_open = false;
						_doors = getNumber(configFile >> "CfgVehicles" >> (typeof _bank) >> "NumberOfDoors");
						for "_i" from 1 to _doors do {
							if(_bank getVariable[format["bis_disabled_Door_%1",_i],1] == 0) exitWith {
								_open = true;
							};
						};						

						if(_open) exitWith {
							[0,format["The delivery to the %1 has been stopped as the bank is currently under attack/the doors are not closed!",_branchName]] remoteExecCall ["life_fnc_broadcast",west];
						};

						_m = (_x select 2) createVehicle [0,0,0];
						_m enableSimulationGlobal false;
						_m allowDamage false;
						_m setVariable["bankItem",true,true];
						_m attachTo[_shelf, _x select 0];
						_x set[1, _m];
					};
				} forEach (_shelf getVariable["bankItemPiles",[]]);
			} forEach ((_x select 1) getVariable["bankContainers",[]]);

		} forEach _this;
		sleep 1200;
	};	
};