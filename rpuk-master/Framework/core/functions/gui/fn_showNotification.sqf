/*
	File: fn_showNotification.sqf

	Author: Ciaran
	Date: 2015-12-18 20:17:19
	Last Modified by: Ciaran
	Last Modified time: 2015-12-21 00:10:53
*/
params [
	[ "_title", "", [ "" ] ],
	[ "_message", "", [ "" ] ]
];

hint parseText format [
	"<t align='center' size='1.6' color='#5600FF'>%1</t><br/>%2",
	[ _title, "Altis Life UK" ] select ( _title == "" ),
	_message
];