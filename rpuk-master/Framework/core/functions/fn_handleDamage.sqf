/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
	
	Moddded by TinyBigJacko (again) 19/07/16 - really needs a total cleanup now!
	//REMEMBER - WE NEED TO CHECK AGAINST THE ACTUAL ROUND FIRED, NOT THE MAGAZINE BOUGHT IN THE STORE!!!!
	
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
/*if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};*/

_damageHandle = true;

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		private["_distance","_isVehicle","_isQuad"];
		_isVehicle = if(vehicle player != player) then {true} else {false};
//		_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F" || typeOf (vehicle player) == "C_Quadbike_01_F" || typeOf (vehicle player) == "C_Kart_01_Blu_F" || typeOf (vehicle player) == "C_Kart_01_Red_F" || typeOf (vehicle player) == "C_Kart_01_Fuel_F" || typeOf (vehicle player) == "C_Kart_01_Vrana_F") then {true} else {false}} else {false};
		_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["B_Quadbike_01_F","C_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {true} else {false}} else {false};
		
		
		//REMEMBER - WE NEED TO CHECK AGAINST THE ACTUAL ROUND FIRED, NOT THE MAGAZINE BOUGHT IN THE STORE!!!!
		
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				
				_damage = false;
				_damageHandle = false;
				
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !life_isknockedout && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							if(!(_isVehicle)) then {
								[_unit,_source] spawn life_fnc_tazed;
							};
						};
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
				_damageHandle = false;
			};
		};

		//REMEMBER - WE NEED TO CHECK AGAINST THE ACTUAL ROUND FIRED, NOT THE MAGAZINE BOUGHT IN THE STORE!!!!
		
		if(_projectile == "B_9x21_Ball" && _curWep == "hgun_Rook40_snds_F") then {
			if(side _source == west && playerSide != west) then {

				_distance = 70;

				_damage = false;
				_damageHandle = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !life_isknockedout && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							if(!(_isVehicle)) then {
								[_unit,_source] spawn life_fnc_tazed;
							};
						};
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
				_damageHandle = false;
			};
		};

		//REMEMBER - WE NEED TO CHECK AGAINST THE ACTUAL ROUND FIRED, NOT THE MAGAZINE BOUGHT IN THE STORE!!!!
		
		if(_projectile in ["B_9x21_Ball_Tracer_Red"] && _curWep in ["SMG_05_F"]) then {
			//Checks if we are getting hit by a cop with rubber bullets
			if(side _source == west && playerSide != west) then {

				_distance = 200; 

				_damage = false;
				_damageHandle = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !life_isknockedout && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[player,"Rubber Bullet Impact",true] spawn life_fnc_knockedOut;
						} else {
							if(!(_isVehicle)) then {
								[player,"Rubber Bullet Impact",true] spawn life_fnc_knockedOut;
							};
						};
					};
				};
			};

			//Temp fix for super rubber bullets on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
				_damageHandle = false;
			};
		};

		if(_curWep in ["hgun_PDW2000_F"] && !isNull _source) then {
			_damage = false;
			_damageHandle = false;
			if(uniform _source == "U_B_CombatUniform_mcam_worn" && vehicle _source == _source && isPlayer _source && player distance _source < 50 && vehicle player == player) then { //Bounty hunter clothing and distance check.
				if(life_crimes select 1 > 0) then {
					[[player],"life_fnc_bountyTaze",_source,false] spawn life_fnc_MP;
				};
			};
		};




		if (vehicle _unit == _unit) then
		{
			if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat" ) then
			{
				diag_log "The source is a vehicle, but not a player driving a vehicle";
			}
			else
			{
				_isVehicle = vehicle _source;
				if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then
				{
					_damage = 0;
					_damageHandle = false;
					hint "Since you were VDM'ed you did not die.";
					if(time - life_vdm_time > 4) then {[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP; life_vdm_time = time;}; //Prevent network spammage.
				};
			};
		};
	};
};

if(_damageHandle) then {
	if (_damage > 0.3) then {
		//[true] spawn life_fnc_breakLeg;
	};
};

[] call life_fnc_hudUpdate;
_damage;
