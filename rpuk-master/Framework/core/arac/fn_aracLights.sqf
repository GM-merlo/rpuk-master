/* 
	File: fn_aracLights.sqf
	
	Author: Tonic
	Edits: Ciaran
	Date: 2015-02-21 16:43:23
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-21 17:19:45
*/
Private ["_vehicle","_lightRed","_lightYellow","_lightleft","_lightright"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightYellow = [1, 1, 0];

_lightleft = "#lightpoint" createVehicleLocal (getpos _vehicle);

sleep 0.2;
_lightleft setLightColor _lightYellow;
_lightleft setLightBrightness 0.2;
_lightleft setLightAmbient [1,1,0];

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_repair_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.52]];
	};
};

_lightleft setLightAttenuation [0.1, 0, 1000, 130]; 
_lightleft setLightIntensity 8;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 120;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicleLocal (getpos _vehicle);
sleep 0.2;
_lightright setLightColor _lightYellow; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [1,1,0]; 

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_repair_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.52]];
	};
};
  
_lightright setLightAttenuation [0.1, 0, 1000, 130]; 
_lightright setLightIntensity 8;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 120;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;  
		sleep 0.05;
		_lightleft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.05;
		_lightright setLightBrightness 6;  
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;