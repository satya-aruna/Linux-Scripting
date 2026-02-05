#!/bin/bash

# color codes in Linux, can be enabled with echo -e option
R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
N='\e[0m'


USERID=$(id -u) # userid of root user 0, and others non-zero
LOGS_FOLDER="/var/log/linux-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # syntax for taking $3 as days and 14 as default value if not provided

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1 # we need to exit with failure exit code
fi

mkdir -p $LOGS_FOLDER

USAGE() {
    echo -e "$R sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}

log() {
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source directory $SOURCE_DIR does not exist $N"
    exit 1
fi 

if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination directory $DEST_DIR does not exist $N"
    exit 1
fi 

# Find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup started"
log "Source directory : $SOURCE_DIR"
log "Destination directory : $DEST_DIR"
log "DAYS : $DAYS"

if [ -z "${FILES}" ]; then
    log "No files to archive  $Y SKIPPING $N"
else
    # app-logs-$timestamp.zip
    log "Files found to archive: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo "Archive name : $ZIP_FILE_NAME"
    $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS) | tar -zcvf $ZIP_FILE_NAME

    #check archive is success or not
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archieval is...$G SUCCESS $N"

        while IFS= read -r filepath; 
        do
            echo "deleting file: $filepath"
            rm -f $filepath
            echo "deleted file: $filepath"
        done <<< "$FILES_TO_DELETE"
    else
        log "Archieval is...$R FAILURE $N"
    fi
fi

