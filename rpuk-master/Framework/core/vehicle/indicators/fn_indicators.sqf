/*
	File: fn_indicators.sqf
	Author: Ciaran Langton
*/
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,1,"",[""]] call BIS_fnc_param;
if(player distance _vehicle > 1000) exitWith {}; 
if(_vehicle getVariable["mode",""] != _mode) exitWith {};

_lightColour = [20, 20, 0.1];
_pos = getPosATL _vehicle;
_leftBack = "#lightpoint" createVehicleLocal _pos;
_leftSPOTback = "#lightpoint" createVehicleLocal _pos;
_leftFront = "#lightpoint" createVehicleLocal _pos;
_leftSPOTfront = "#lightpoint" createVehicleLocal _pos;
_rightBack = "#lightpoint" createVehicleLocal _pos;
_rightSPOTback = "#lightpoint" createVehicleLocal _pos;
_rightFront = "#lightpoint" createVehicleLocal _pos;
_rightSPOTfront = "#lightpoint" createVehicleLocal _pos;

_allLights = [_leftBack,_leftSPOTback,_leftFront,_leftSPOTfront,_rightBack,_rightSPOTback,_rightFront,_rightSPOTfront];
_spotLights = [_leftSPOTback,_leftSPOTfront,_rightSPOTback,_rightSPOTfront];
_lights = [_leftBack,_leftFront,_rightBack,_rightFront];

{
	_x setLightColor _lightColour;
	_x setLightBrightness 0;
	_x setLightAmbient [20,20,0.1];
	_x setLightAttenuation [0.1, 0, 1000, 130];
	_x setLightIntensity 8;
	_x setLightFlareSize 0.38;
	_x setLightFlareMaxDistance 100;
	_x setLightUseFlare true;
	_x setLightDayLight true;
} forEach _allLights;

{
	_x setLightFlareSize 10;
} forEach _spotLights;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{		
		_leftSPOTback 	lightAttachObject [_vehicle, [-0.80, -3.0, -0.4]];
		_leftSPOTfront 	lightAttachObject [_vehicle, [-0.80, 2.1, -0.4]];  
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.4]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.0, -0.4]];
		
		_rightSPOTback 	lightAttachObject [_vehicle, [0.8, -3.0, -0.4]];
		_rightSPOTfront	lightAttachObject [_vehicle, [0.8, 2.1, -0.4]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.4]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.4]];		
		
		_leftSPOTback 	setLightFlareSize 10.0;
		_leftSPOTfront 	setLightFlareSize 10.0;
		_leftFront 		setLightFlareSize 0.0;
		_leftBack  		setLightFlareSize 0.0;
		
		_rightSPOTback 	setLightFlareSize 10.0;
		_rightSPOTfront	setLightFlareSize 10.0;
		_rightFront 	setLightFlareSize 0.0;
		_rightBack 		setLightFlareSize 0.0;
	};
	case "B_G_Offroad_01_F":{		
		_leftSPOTback 	lightAttachObject [_vehicle, [-0.80, -3.0, -0.4]];
		_leftSPOTfront 	lightAttachObject [_vehicle, [-0.80, 2.1, -0.4]];  
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.4]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.0, -0.4]];
		
		_rightSPOTback 	lightAttachObject [_vehicle, [0.8, -3.0, -0.4]];
		_rightSPOTfront	lightAttachObject [_vehicle, [0.8, 2.1, -0.4]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.4]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.4]];		
		
		_leftSPOTback 	setLightFlareSize 10.0;
		_leftSPOTfront 	setLightFlareSize 10.0;
		_leftFront 		setLightFlareSize 0.0;
		_leftBack  		setLightFlareSize 0.0;
		
		_rightSPOTback 	setLightFlareSize 10.0;
		_rightSPOTfront	setLightFlareSize 10.0;
		_rightFront 	setLightFlareSize 0.0;
		_rightBack 		setLightFlareSize 0.0;
	};
	case "B_MRAP_01_F":{		
		_leftSPOTback 	lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		_leftSPOTfront 	lightAttachObject [_vehicle, [-1.0, 1.40, -0.7]];  
		_leftFront 		lightAttachObject [_vehicle, [-1.0, 1.40, -0.7]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		
		_rightSPOTback 	lightAttachObject [_vehicle, [0.90, -4.3, -0.7]];
		_rightSPOTfront lightAttachObject [_vehicle, [1.0, 1.40, -0.7]];  
		_rightFront 	lightAttachObject [_vehicle, [1.0, 1.40, -0.7]]; 
		_rightBack  	lightAttachObject [_vehicle, [0.90, -4.3, -0.7]];
		
		_leftSPOTback 	setLightFlareSize 10.0;
		_leftSPOTfront 	setLightFlareSize 10.0;
		_leftFront 		setLightFlareSize 0.0;
		_leftBack  		setLightFlareSize 0.0;
		
		_rightSPOTback 	setLightFlareSize 10.0;
		_rightSPOTfront	setLightFlareSize 10.0;
		_rightFront 	setLightFlareSize 0.0;
		_rightBack 		setLightFlareSize 0.0;
	};
};


_lights = switch (_mode) do
{
	case "hazards": {_allLights};
	case "left": {[_leftSPOTfront,_leftSPOTback]};
	case "right": {[_rightSPOTfront,_rightSPOTback]};
	default {[]};
};

//Cleanup unused lightpoints!
{
	if(!(_x in _lights)) then {
		deleteVehicle _x;
	};
} forEach _allLights;

_on = false;
while {alive _vehicle} do
{
	if(_vehicle getVariable["mode",""] != _mode) exitWith {};
	
	if(!(_on)) then
	{
		{
			_x setLightBrightness 6;
		} forEach _lights;  
	}
		else
	{
		{
			_x setLightBrightness 0;
		} forEach _lights;  
	};
	_on = !_on;
	sleep 0.7;
};

{deleteVehicle _x} forEach _allLights;