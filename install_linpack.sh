set -x

wget http://registrationcenter-download.intel.com/akdlm/irc_nas/2169/l_lpk_p_10.3.4.007.tgz
tar zxvf l_lpk_p_10.3.4.007.tgz
cd linpack_10.3.4/benchmarks/linpack 
./xlinpack_xeon64                                          
