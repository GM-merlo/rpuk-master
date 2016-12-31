/*
	File: fn_MoneyRecord.sqf
	Author: TinyBigJacko 07Apr14
	
	Description:
	Records a money transaction (hand or ATM) in the RPT file, from both giving and receiving players
*/
private["_unitfrom", "_unitto", "_amount", "_mode"];
_unitfrom = [_this,0,Objnull,[Objnull, ""]] call BIS_fnc_param;
_unitto = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_amount = [_this,2,0,[0,""]] call BIS_fnc_param;
_mode = [_this,3,"fail",[""]] call BIS_fnc_param;
_txt = "";
switch (_mode) do 
{
	case "cashgive":
	{
		_txt = format["fn_giveMoney: %1 (%2) gave £%3 to %4 (%5)", name _unitfrom, getPlayerUID _unitfrom, _amount, name _unitto, getPlayerUID _unitto];
	};
	case "cashreceive":
	{
		_txt = format["fn_receiveMoney: %1 (%2) received £%3 from %4 (%5)", name _unitto, getPlayerUID _unitto, _amount, name _unitfrom, getPlayerUID _unitfrom];
	};
	case "atmgive":
	{
		_txt = format["fnc_bank_transfer: %1 (%2) transferred £%3 to %4 (%5)", name _unitfrom, getPlayerUID _unitfrom, _amount, name _unitto, getPlayerUID _unitto];
	};
	case "atmreceive":
	{
		_txt = format["fn_TON_fnc_clientWireTransfer: %1 (%2) received by wire £%3 from %4", name _unitto, getPlayerUID _unitto, _amount, _unitfrom]; //unitfrom is name string only, no PID here
	};
	case "robreceive":
	{
		_txt = format["fn_rbRecv: %1 (%2) received by robbery £%3", name _unitto, getPlayerUID _unitto, _amount];
	};
	case "robtaken":
	{
		_txt = format["fn_robPerson: %1 (%2) robbed £%3 from %4 (%5)", name _unitto, getPlayerUID _unitto, _amount, name _unitfrom, getPlayerUID _unitfrom];
	};
	case "atmdeposit":
	{
		_txt = format["fn_bankDeposit: %1 (%2) deposited £%3 via ATM", name _unitfrom, getPlayerUID _unitfrom, _amount];
	};
	case "atmwithdraw":
	{
		_txt = format["fn_bankWithdraw: %1 (%2) withdrew £%3 via ATM", name _unitto, getPlayerUID _unitto, _amount];
	};
	case "admincomp":
	{
		_txt = format["fn_adminComp: %1 (%2) has spawned in £%2 for testing/compensation.", name _unitto, getPlayerUID _unitto, _amount];
	};
	case default
	{
		_txt = format["fn_MoneyRecord - mode selection failure! MoneyFrom: %1 (%2) MoneyTo: %3 (%4) Amount: %5 Mode: %6", name _unitfrom, getPlayerUID _unitfrom, name _unitto, getPlayerUID _unitto, _amount, _mode];
	};
};
diag_log _txt; //log no matter what
