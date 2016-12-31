/*
* @File:   CfgNameTags.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
#define RANK(RANK,ICON,TEXT) class RANK {icon = ICON; text = TEXT;}

class CfgNameTags
{
	unitsToScan[] = {"Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V1_F"};
	unitsToScanDist = 15;

	class POLICE
	{
		imgpath = "icons\cop";
		rankvar = "policerank";

		RANK(R1,"cso_ingame.paa","Community Support Officer");
		RANK(R2,"cso_ingame.paa","Police Community Support Officer");
		RANK(R3,"pc_ingame.paa","Police Constable");
		RANK(R4,"spc_ingame.paa","Senior Police Constable");
		RANK(R5,"sgt_ingame.paa","Sergeant");
		RANK(R6,"dsgt_ingame.paa","Desk Sergeant");
		RANK(R7,"inspector_ingame.paa","Inspector");
		RANK(R8,"di_ingame.paa","Detective Inspector");
		RANK(R9,"ci_ingame.paa","Chief Inspector");
		RANK(R10,"si_ingame.paa","Superintendent");
		RANK(R11,"csi_ingame.paa","Chief Superintendent");
		RANK(R12,"cmdr_ingame.paa","Commander");
	};

	class UNMC
	{
		imgpath = "icons\unmc";
		rankvar = "unmcrank";

		RANK(R1,"pvt.paa","UNMC Private");
		RANK(R2,"pfc.paa","UNMC Private First Class");
		RANK(R3,"cpl.paa","UNMC Corporal");
		RANK(R4,"sgt.paa","UNMC Sergeant");
		RANK(R5,"sgtmajor.paa","UNMC Sergeant Major");
		RANK(R6,"secondlt.paa","UNMC Second Lieutenant");
		RANK(R7,"firstlt.paa","UNMC First Lieutenant");
		RANK(R8,"cpt.paa","UNMC Captian");
		RANK(R9,"maj.paa","UNMC Major");
		RANK(R10,"col.paa","UNMC Colonel");
		RANK(R11,"highranks.paa","UNMC General");
		RANK(R12,"highranks.paa","UNMC Deputy Commander");
		RANK(R13,"highranks.paa","UNMC Commander");
	};

	class NHS
	{
		imgpath = "a3\ui_f\data\map\MapControl";
		rankvar = "nhsrank";

		RANK(R1,"hospital_ca.paa","Dr. In Training");
		RANK(R2,"hospital_ca.paa","First Aider");
		RANK(R3,"hospital_ca.paa","Medic");
		RANK(R4,"hospital_ca.paa","Surgeon");
		RANK(R5,"hospital_ca.paa","Doctor");
		RANK(R6,"hospital_ca.paa","General Practitioner");
		RANK(R7,"hospital_ca.paa","NHS Administration");
		RANK(R8,"hospital_ca.paa","Chief Medical Officer");
	};
};
