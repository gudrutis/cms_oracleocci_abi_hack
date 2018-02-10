#ifndef CMS_ORACLEOCCI_CXX11_HACK_H
#define CMS_ORACLEOCCI_CXX11_HACK_H
#include_next "occi.h"

const char* getOraString (oracle::occi::Statement *obj, int n);

const char* getOraString (oracle::occi::ResultSet *obj, int n);

const char* getOraMessage (oracle::occi::SQLException *obj);

#endif
