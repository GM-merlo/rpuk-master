/* 
	File: fn_findTransactionMethod.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-29 16:41:33
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-30 18:38:53
*/
_result = false; //FALSE = SERVER
if(!isNil 'ALUK_HC' && {!isNull ALUK_HC} && {isMultiplayer}) then {_result = ALUK_HC;};
_result;