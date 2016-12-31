/*
* @File:   CfgNotifications.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
class CfgNotifications {
	class DeliveryAssigned {
		title = "Delivery Job Accepted";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};

	class DeliveryFailed {
		title = "Delivery Job Failed";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
		description = "%1";
		duration = 7;
		priority = 7;
	};

	class DeliverySucceeded {
		title = "Delivery Job Completed";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};

	class Message {
		title = "%1";
		iconPicture = "%2";
		description = "%3";
		duration = 6;
		priority = 6;
		sound = "message";
		soundClose = "";
		soundRadio = "";
	};

	class MedicalRequestEmerg {
		title = "NHS Requested";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};
};
