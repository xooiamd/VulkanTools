#! /bin/bash -x

# Names of sections lifted from SECTIONS.txt

OUTDIR="filtered"
mkdir -p $OUTDIR
for i in gpuinfo*.json
do
    INFILE="$i"
    OUTFILE="$OUTDIR/$i"
    jq -S '.VkPhysicalDeviceProperties.deviceName' $INFILE > $OUTFILE
    jq -S '{environment,extended,instance,platformdetails,platformdetails,surfacecapabilites}' $INFILE >> $OUTFILE
done

