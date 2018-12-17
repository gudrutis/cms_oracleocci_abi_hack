#ifndef CMS_ORACLEOCCI_CXX11_HACK_H
#define CMS_ORACLEOCCI_CXX11_HACK_H
#include_next "occi.h"
// Master, commit 1
inline const char* getOraString (oracle::occi::Statement *obj, int n)
{
  return obj->getString(n).c_str();
}

inline const char* getOraString (oracle::occi::ResultSet *obj, int n)
{
  return obj->getString(n).c_str();
}

inline const char* getOraMessage (oracle::occi::SQLException *obj)
{
  return obj->getMessage().c_str(); 
}

#endif
