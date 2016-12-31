/*
* @File:   CfgDebriefing.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
#define DBRIEF(NAME, TITLE, SUBTITLE, DESC)\
  class NAME { \
    title = NAME; \
    subtitle = SUBTITLE; \
    description = DESC; \
    pictureBackground = "outrologo.paa"; \
    picture = ""; \
    pictureColor[] = {0, 0.3, 0.6, 1}; \
  }

class CfgDebriefing {
  DBRIEF(NotWhitelisted, "Not Whitelisted!", "You are not white-listed to use this slot.",
  "Please apply at Roleplay.co.uk in order to join the police department.");

  DBRIEF(Blacklisted, "Blacklisted!", "You are blacklisted from cops.",
  "You are no longer allowed to hold a cop position on RoleplayUK due to an admin decision.");

  DBRIEF(ALUKAC, "RPUK Anticheat Flagged!", "RPUK anti-cheat has flagged you.",
  "Goodday, your antics have been logged and will be dealt with.");

  DBRIEF(Aborted, "Goodbye!", "Your data has been sent to the server!",
  "Roleplay.co.uk #1 Roleplay Community in the UK and Europe.");
};
