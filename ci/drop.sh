psql \
    -h localhost -p 5432 \
    -d postgres \
    -U postgres \
    -a -f project/src/scheme/00-drop.sql
