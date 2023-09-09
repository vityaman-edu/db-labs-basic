
run() {
    psql \
        -h localhost -p 5432 \
        -d postgres \
        -U postgres \
        -a -f project/src/$1
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
