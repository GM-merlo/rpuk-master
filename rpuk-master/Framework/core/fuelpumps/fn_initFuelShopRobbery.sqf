
/*
	File: fn_initFuelShopRobbery.sqf
	Author: TinyBigJacko 03/08/16

	Description:
	Fuel Shops - if client, attach action-handlers for robbery to all fuelstation shops.
*/


/*
	UPDATE WITH NEW STUFF EVERY MAP UPDATE + ARMA 3 UPDATE.
	_allFuelShops = nearestObjects[player,["Land_FuelStation_01_shop_F"],30000];
	_ShopPositions = [];
	{_ShopPositions pushBack (position _x);} forEach _allFuelShops;
	copyToClipboard str(_ShopPositions);

	VERSION FOR TANOA:
	_allFuelShops = nearestObjects[player,["Land_FuelStation_01_shop_F"],30000];
	_ShopPositions = [];
	{_ShopPositions pushBack (position _x);} forEach _allFuelShops;
	copyToClipboard str(_ShopPositions);

*/
diag_log "Starting Fuel station robbery init";
private["_fuelShopPos","_fuelShops","_fuelShop"];

switch (worldName) do {
	case "Altis": {
		_fuelShopPos = [];
	};
	case "Tanoa": {
		_fuelShopPos = [[7380.88,7992.92,0.0533819],[5675.86,10191.3,0.000180721],[5808.75,10854.3,-0.283344],
		[5409.88,9927.8,8.58307e-006],[6569.02,13094.1,-0.22978],[8947.75,13663,-0.000601768],[9972.38,13452.4,-1.43051e-006],
		[10811.8,6481.52,-5.05447e-005],[11635.5,13017.4,4.76837e-005],[12624.6,7602.91,-0.00337982],[2457.01,7448.69,-0.00276756],
		[5778.98,4207.23,-0.00169659],[1888.21,12126.2,0.000302315],[11675.3,2258.36,0.05408]];
	};
	case "Stratis": {
		_fuelShopPos = []
	};
};



{
	//--- Locate the fuel pump (iterate all three types on each position, 5m range).
	_fuelShops = nearestObjects [_x,["Land_FuelStation_01_shop_F"],5];
	
	//diag_log format["Found %1 fuel-shops", (count _fuelShops)];

	if (!isNil "_fuelShops" && {!(count _fuelShops < 1)}) then
	{
		_fuelShop = _fuelShops select 0; //grab the nearest, if more than one found within range
		
		//diag_log format["Pump: %1", _fuelShop];

		if (!isNil "_fuelShop") then
		{

			//--- Setup refuel addAction on clients that have an interface.
			if(hasInterface) then
			{
				_fuelShop addAction["Fuel Station Spares",life_fnc_weaponShopMenu,"fuelstore"];
				_fuelShop addAction["Fuel Station Market",life_fnc_virt_menu,"fuelshop"];
				_fuelShop addAction["Rob Fuel Station",life_fnc_robStation,_fuelShop,0,false,false,"",'(cursortarget distance player < 5)'];
//				diag_log "action added";
			};
		}
			else
		{
			diag_log "_fuelShop wasn't found on this loop of _fuelShopPos";
		};
	}
		else
	{
		diag_log "_fuelShops search was empty on this loop of _fuelShopPos";
	};
} forEach _fuelShopPos;

diag_log "Finished Fuel Shop robbery init loop.";
