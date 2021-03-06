#!/bin/sh

# version.sh
# 
# Generates src/version.sml and parcom.smackspec based on the current version
# Usage: version.sh X.Y.Z
# gdpe, Nov 2 2011
# Updated for parcom from smbt version by fisi, Dec 3 2012

if [ $# -ne 1 ]
then
  echo "Usage: version.sh X.Y.Z"
  exit 1
fi


cat parcom.smackspec.in | sed "s/###VERSION###/$1/" > parcom.smackspec
echo "(* Generated by version.sh *)\n\
structure Version = \n\
struct\n\
    val version = \"$1\"\n\
end\n" > src/version.sml

echo "Generated files."
echo "Now run 'git commit -a -m \"bump to v$1\"; git tag v$1'"

