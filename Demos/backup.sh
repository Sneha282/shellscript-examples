#!/bin/bash
SOURCE="/home/sneha/shellscript/exercises/source"
DESTINATION="/home/sneha/shellscript/exercises/DESTINATION"
DATE= $(date +%Y%m%d_%H%M%S)

mkdir -p $DESTINATION/$DATE
cp -r $SOURCE $DESTINATION/$DATE
echo "Backup completed on $DATE"
