set -o errexit
cd $(dirname -- "$0"; )
cd ..

psql \
    -h localhost -p 5432 \
    -d postgres \
    -U postgres \
    -a -f src/scheme/00-drop.sql
