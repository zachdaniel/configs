if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

ssh-add > /dev/null 2>&1

#Sets up environment variables for sql connectivity
export ORACLE_HOME=~/Configs/oracle/instantclient_11_2/
export TNS_ADMIN=/Users/zdaniel/Configs/oracle
export DYLD_LIBRARY_PATH=~/Configs/oracle/instantclient_11_2/

# Ensures that usr/local/bin is in the path, as well as adding $DYLD_LIB path for sqlpro and other sqly things.
export PATH=/usr/local/bin:$DYLD_LIBRARY_PATH:$PATH