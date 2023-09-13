# ITMO Databases Labs 1-2

## Story

> Как бы там ни было, вид спускающихся с дерева загадочных существ
> произвел слишком тягостное впечатление на динозавриху. Загоготав 
> на прощание, животное подтолкнуло малыша и медленно поплелось 
> прочь. 

## Build & Run

### SQL

```bash
docker compose up
docker exec -it db-lab-basic-model-db-1 bash
bash project/ci/defense.sh
```

### Report

Перед сборкой важно убедиться,
что все диаграммы в отчете 
актуальны, то есть соответсвуют
файлам `.puml`.

```bash
git clean -Xdf
```
