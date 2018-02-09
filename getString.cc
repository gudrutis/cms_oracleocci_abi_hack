#define _GLIBCXX_USE_CXX11_ABI 0
#include <string>
#include "occi.h"
using namespace oracle::occi;

const char *getOraStmtString (Statement *obj, int n) 
{
 return obj->getString(n).c_str();
}

const char *getOraStmtString (ResultSet *obj, int n) 
{
 return obj->getString(n).c_str();
}
