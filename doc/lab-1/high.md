```mermaid
---
title: High-level ER-Diagram
---

erDiagram
  CREATURE }o--o| CREATURE : mother
  CREATURE }|--o{ ACTION : doing
  CREATURE }|--o{ EMOTION : feeling
  CREATURE }o--|| LOCATION : being
  CREATURE ||--o{ KIND : is
```
