/*
* @File:   remote_exec.h
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
#define NFUNC(FUNC, TARGETS) class FUNC {allowedTargets = TARGETS; jip = 0;};
#define NFUNC_JIP(FUNC, TARGETS) class FUNC {allowedTargets = TARGETS; jip = 1;};
#define ALL 0
#define CLIENTS 1
#define SERVER 2

class CfgRemoteExec {
  class Functions {
    //Setup global configuration for server function execution.
    mode = 1;
    jip = 0;
  };

  class Commands {
    //Setup global configuration for server script command execution.
    mode = 0;
    jip = 0;
  };
};
