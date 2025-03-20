#!/bin/bash

# Concat config files N/base.properties + common.properties = server.properties


concat_conf() {
    local N=$1
    echo "Generating config file for broker $N"

    echo "# ===================================================" > $N/server.properties
    echo "# =============== Broker properties =================" >> $N/server.properties
    echo "# ===================================================" >> $N/server.properties
    echo "" >> $N/server.properties

    cat $N/base.properties >> $N/server.properties

    echo "" >> $N/server.properties
    echo "# ===================================================" >> $N/server.properties
    echo "# =============== Common properties =================" >> $N/server.properties
    echo "# ===================================================" >> $N/server.properties
    echo "" >> $N/server.properties

    cat common.properties >> $N/server.properties
}

# Generate config files for each broker (folder)
folders=$(ls -d */)
for f in $folders
do
    concat_conf $f
done
