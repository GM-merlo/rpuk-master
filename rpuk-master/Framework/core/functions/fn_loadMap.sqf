/*
	File: fn_loadMap.sqf

	Author: Ciaran
	Date: 2015-12-28 16:59:51
	Last Modified by: Ciaran
	Last Modified time: 2016-01-01 02:31:09
*/
//--- Fetch location configs for the current world
private _locationConfigs = "true" configClasses ( missionConfigFile >> "CfgMapObjects" >> worldName );

//--- Loop over each config
{

	//--- Actions for server only.
	if ( isServer ) then {

		//--- SERVER: Firstly, process any objects that need to be protected (disallow damage)
		/*{

			private _ok = _x params [
				[ "_ids", [ ], [ [ ] ] ],
				[ "_position", [ ], [ [ ] ], 3 ]
			];

			//--- Params are OK
			if ( _ok ) then {

				//--- Loop over all IDs to protect
				{

					//--- Find the ID near the position
					private _obj = _position nearestObject _x;

					//--- Disallow damage to the object
					_obj allowDamage false;
					_obj addEventHandler [ "HandleDamage", { 0 } ];

				} forEach _ids;

			};

		} forEach ( getArray ( _x >> "protectObjects" ) );*/

	};

	//--- Execute actions for clients.
	if !( isDedicated ) then {

		//--- CLIENT: Firstly, process any objects that need hiding.
		{

			private _ok = _x params [
				[ "_ids", [ ], [ [ ] ] ],
				[ "_position", [ ], [ [ ] ], 3 ]
			];

			//--- Params are OK
			if ( _ok ) then {

				//--- Loop over all IDs to hide
				{

					//--- Find the ID near the position
					private _obj = _position nearestObject _x;

					//--- Actually hide the object.
					_obj hideObject true;

				} forEach _ids;

			};

		} forEach ( getArray ( _x >> "hideObjects" ) );

		//--- CLIENT: Fetch objects from the location
		{

			//--- Get positional data
			private _positionATL = call compile getText ( _x >> "positionATL" );
			private _positionASL = getNumber ( _x >> "positionASL" );

			//--- Create the object
			private _obj = ( getText ( _x >> "className" ) ) createVehicleLocal _positionATL;

			//--- Enable/Disable Simulation
			_obj enableSimulation ( getNumber ( _x >> "enableSimulation" ) == 1 );

			//--- Enable/Disable Damage
			_obj allowDamage ( getNumber ( _x >> "allowDamage" ) == 1 );

			//--- Set the direction
			_obj setDir ( getNumber ( _x >> "direction" ) );

			//--- Set the object's position
			if ( _positionASL == -100 ) then {

				_obj setPosATL _positionATL

			} else {

				_obj setPosASL [ _positionATL select 0, _positionATL select 1, _positionASL ]

			};

			//--- Process Slope
			if ( getNumber ( _x >> "slope" ) == 0 ) then {

				_obj setVectorUp [ 0, 0, 1 ]

			} else {

				_obj setVectorUp ( surfaceNormal ( getPosATL _obj ) )

			};

			//--- Process object name (for objects can can have nametags)
			private _displayName = getText ( _x >> "displayName" );
			if ( _displayName != "" ) then {

				_obj setVariable [ "realname", _displayName, false ]

			};

			//--- Process object textures
			private _textures = getArray ( _x >> "textures" );
			if ( count _textures > 0 ) then {

				{

					_obj setObjectTexture [ _forEachIndex, _x ]

				} forEach _textures;

			};

			//--- Process object actions
			private _actions = getArray ( _x >> "actions" );

			//--- Add cashpoint action for ATM
			if ( _obj isKindOf "Land_Atm_01_F" || _obj isKindOf "Land_Atm_02_F" ) then {

				_actions pushBack [

					"<t color='#ADFF2F'>Cashpoint</t>",
					"_this call life_fnc_atmMenu",
					"",
					"vehicle player == player && player distance _target < 4"

				];

			};

			if ( count _actions > 0 ) then {

				{

					_x params [
						[ "_actionName", "", [ "", [ ] ] ],
						[ "_actionCode", "", [ "" ] ],
						[ "_actionArgs", [ ], [ ] ],
						[ "_actionCond", "", [ "" ] ]
					];
					
					if ( _actionName isEqualType [ ] ) then {
					
						{
							if (_forEachIndex != 0) then {
							
								_actionName set [ _forEachIndex, call compile _x ];
							
							};
							
						} forEach _actionName;
						
						_actionName = format _actionName;
					
					};

					//--- Add the action to the object.
					_obj addAction [ _actionName, compile _actionCode, _actionArgs, 0, false, false, "", _actionCond ];

				} forEach _actions;

			};
			
			//--- If it is a cash pile, ensure that the scenery var is set
			if ( _obj isKindOf "Land_Money_F" ) then {
			
				_obj setVariable [ "scenery", true ];
			
			};

			//--- If it is a man, then animate
			if ( _obj isKindOf "Man" ) then {

				private _anims = getArray ( _x >> "animations" );

				if ( count _anims > 0 ) then {

					//--- Create an "anchor" object for the character
					private _logic = "Logic" createVehicleLocal [ 0, 0, 0 ];
	
					//--- Set the logic's direction
					_logic setDir ( getNumber ( _x >> "direction" ) );
					
					//--- Set the logic's position
					if ( _positionASL == -100 ) then {

						_logic setPosATL _positionATL

					} else {

						_logic setPosASL [ _positionATL select 0, _positionATL select 1, _positionASL ]

					};
					
					_obj attachTo [ _logic, [ 0, 0, 0 ] ];
				
					_obj setVariable [ "aluk_npc_moves", _anims ];

					_obj addEventHandler [ "AnimDone", {

						params [
							[ "_unit", objNull, [ objNull ] ]
						];

						_unit switchMove ( ( _unit getVariable "aluk_npc_moves" ) call bis_fnc_selectRandom );

					} ];

					_obj switchMove ( _anims call bis_fnc_selectRandom );

				} else {

					//--- Normal animation
					_obj switchMove "amovpercmstpsnonwnondnon";

				};


			};

		} forEach ( "true" configClasses _x );

	};

} forEach _locationConfigs;



true