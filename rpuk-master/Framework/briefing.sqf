waitUntil {!isNull player && player == player};
if(player diarySubjectExists "servinf")exitwith{};

player createDiarySubject ["servinf","Server Info"];
player createDiarySubject ["servrule","Server Rules"];
/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br /><br />
				"
		]
	];
*/
player createDiaryRecord ["servinf", //Container
	[
		"Forum and Teamspeak", //Subsection
		"
		Our forum address is https://www.Roleplay.co.uk<br /><br />
		Our Teamspeak 3 server can be found at ts.roleplay.co.uk<br /><br />
		You're more than welcome to join us at either or both of those places, and become a part of the community that makes this server great!<br />
		Or, you may even wish to join up with a whitelisted group on the server! If this is the case apply on the forums!
		"
	]
];
player createDiaryRecord ["servrule", //Container
	[
		"Read the Rules!", //Subsection
		"
		Read the rules at https://www.Roleplay.co.uk/rules
		"
	]
];
