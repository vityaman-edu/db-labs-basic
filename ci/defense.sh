set -o errexit
cd $(dirname -- "$0"; )
cd ..

DATABASE_NAME=postgres
DATABASE_USER=postgres

run() {
    psql \
        -h localhost -p 5432 \
        -d $DATABASE_NAME \
        -U $DATABASE_USER \
        -a -f src/$1
}

echo "[defense] Initializing database..."
run scheme/01-init-tables.sql

echo "[defense] Inserting test data..."
run scheme/02-init-data.sql

echo "[defense] Selecting all creatures..."
run query/select-creature.sql

echo "[defense] Selecting all actions..."
run query/select-action.sql

echo "[defense] Selecting all emotions..."
run query/select-emotion.sql
