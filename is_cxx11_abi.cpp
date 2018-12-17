#include <string>
// PR2- commit 2
int main()
{
#ifdef _GLIBCXX_USE_CXX11_ABI
  if ( _GLIBCXX_USE_CXX11_ABI == 1 ){return 0;}
#endif
  return 1;
}
// PR2- commit 1
