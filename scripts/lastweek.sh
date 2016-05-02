#!/bin/bash
BASEDIR=$(readlink -f "$(dirname $0)/..")

LASTWEEK=""`expr $(date +%V) - 1`
if [ "$LASTWEEK" -lt 10 ]; then
    LASTWEEK="0${LASTWEEK}";
fi
YEAR=$(date +%Y)
MON=$(date +%m)
if [ "$MON" -lt 10 ]; then
    MON="0${MON}";
fi
DAY=`expr $(date +%d) - 1`
if [ "$DAY" -lt 10 ]; then
    DAY="0${DAY}";
fi
NEWFILE="${BASEDIR}/content/stack/${YEAR}/week-${LASTWEEK}.md"

if [ -e "${NEWFILE}" ]
then
    echo "'${NEWFILE}' already exists."
    exit 1
else
    echo "creating '${NEWFILE}'..."
fi

if [ "x$1" == "x" ];then
    NUM=8
else
    NUM=$1
fi

cp ${BASEDIR}/lastrun.txt ${BASEDIR}/lastrun-old.txt
php ${BASEDIR}/scripts/dump-pinboard.php ${NUM} > ~/tmp/dump.txt

cat ${BASEDIR}/scripts/week-template.html > ${NEWFILE}

sed -i -e "s,The Stack - Week XX/YY,The Stack - Week ${LASTWEEK}/${YEAR}," ${NEWFILE}
sed -i -e "s/date = 2006-01-02T15:04:05Z07:00/date = ${YEAR}-${MON}-${DAY}T23:59:00Z/" ${NEWFILE}

cat ~/tmp/dump.txt >> ${NEWFILE}
echo "Created: ${NEWFILE}"
