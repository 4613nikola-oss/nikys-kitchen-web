#!/bin/sh
# Uloží aktuální obsah databáze do db/init/02-data.sql (ten se pak nahraje na GitHub).
# Spuštění:  docker compose exec db sh /db/zaloha.sh
set -e
pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" \
  --data-only --column-inserts --no-owner --no-privileges \
  -f /db/init/02-data.sql
echo "Hotovo: data jsou uložená v db/init/02-data.sql"
