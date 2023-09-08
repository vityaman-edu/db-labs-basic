# ITMO Databases Labs 1-2

## Story

> Как бы там ни было, вид спускающихся с дерева загадочных существ
> произвел слишком тягостное впечатление на динозавриху. Загоготав 
> на прощание, животное подтолкнуло малыша и медленно поплелось 
> прочь. 

## Build & Run

```bash
docker compose up
docker exec -t db-lab-basic-model-db-1 bash
psql -h localhost -p 5432 -d postgres -U postgres \
    -a -f project/src/scheme/01-init-tables.sql
psql -h localhost -p 5432 -d postgres -U postgres \
    -a -f project/src/scheme/01-init-data.sql
```
