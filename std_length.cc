extern "C" {
#include <cstdio>
#include <string.h>
int _ZNKSs6lengthEv (char **a)
{
  char *s = *a;
  return strlen (s);
}
}
// PR-1, commit 1
