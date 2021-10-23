#!/bin/bash

usage() {
    echo "usage: $(basename $0) input.sqlite output.csv [tablename]"
    exit ${1:0}
}
[ -z "$1$2" ] && usage 1

DB_FILEPATH="$1"
CSV_FILEPATH="$2"
DB_TABLENAME="${3:-leaderboard}"

sqlite3 -header -csv "$DB_FILEPATH" \
    "select * from '$DB_TABLENAME'" 2&>/dev/null >"$CSV_FILEPATH"
