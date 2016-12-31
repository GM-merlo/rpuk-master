/* 
	File: fn_huntingAreaSetup.sqf
	Desc: Sets up the hunting area/unsets it.

	Description:
	Spawns animals and despawns them afterwards.
*/
private["_spawning"];

_spawning = [_this,0,false,[true]] call BIS_fnc_param;

if(_spawning) then
{
	life_hunting_runspawn = true;
	[] spawn
	{
		//Array of animals
		_animals = 
		[
			"Cock_random_F","Goat_random_F","Goat_random_F",
			"Goat_random_F","Hen_random_F","Sheep_random_F",
			"Sheep_random_F","Alsatian_Random_F"
		];
		//Spawn loop
		while {life_hunting_runspawn} do
		{
			_alive = 0; //Setup how many animals are active.
			{
				if(!isNull _x && {alive _x}) then
				{
					_alive = _alive + 1;
				} else {
					life_hunting_animals set[_foreachindex, -1]; //Delete from the array
					life_hunting_animals = life_hunting_animals - [-1]; //Continue the delete
				};
			} forEach life_hunting_animals;

			_need = 40 - _alive; //Now we know how many animals in our array
			if(_need > 0) then
			{
				//Now if we have more than 0 animals to spawn then loop
				for "_i" from 1 to _need do
				{
					_type = _animals call BIS_fnc_selectRandom; //Select random
					_animal = life_hunting_group createUnit [_type, (markerPos "hunting_area"), [], 350, "NONE"]; //Create animal
					life_hunting_animals pushBack _animal; //Add the animal to the array
				};
			};
			sleep 300;
		};
	};
}
	else
{
	life_hunting_runspawn = false; //Disable spawner
	{if(!isNull _x) then {deleteVehicle _x;};} forEach life_hunting_animals;
	life_hunting_animals = []; //Clear array
};