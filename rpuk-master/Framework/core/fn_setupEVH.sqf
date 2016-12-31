/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Put",{_this call life_fnc_onPutItem}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}];
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
//Healing Handler for the Medilog
player addEventHandler ["HandleHeal", {
    _unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _healer = [_this,1,objNull,[objNull]] call BIS_fnc_param;
    if(_unit != player) exitWith {};
    _text = "Person applied basic medication on himself.";
    if(!isNull _healer && {isPlayer _healer}) then {
    	if(_healer != _unit) then
    	{
    		_text = format["%1 applied basic medication to this person.",_healer getVariable["realname",name _healer]];
    	};
    };
    [_unit,_text] call life_fnc_medilogSubmit;
}];

"ciaran_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
//Now our event handlers in order to process our server->client communication.
"life_config_gangArea" addPublicVariableEventHandler {if(life_capture_point != -1) then {[] call life_fnc_areaCaptureUpdate;};};