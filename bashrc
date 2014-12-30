#Sets up environment variables for sql connectivity
export ORACLE_HOME=~/Configs/oracle/instantclient_11_2/
export TNS_ADMIN=/Users/zdaniel/Configs/oracle
export DYLD_LIBRARY_PATH=~/Configs/oracle/instantclient_11_2/

# Ensures adding $DYLD_LIB path for sqlpro and other sqly things.
export PATH=$DYLD_LIBRARY_PATH:$PATH
