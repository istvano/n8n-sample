#!/bin/bash
set -e;

if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
		CREATE USER "${POSTGRES_NON_ROOT_USER}" WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
		CREATE DATABASE "${POSTGRES_APP_DB}";
		GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_APP_DB} TO "${POSTGRES_NON_ROOT_USER}";
		ALTER DATABASE ${POSTGRES_APP_DB} OWNER TO "${POSTGRES_NON_ROOT_USER}";
	EOSQL
else
	echo "SETUP INFO: No Environment variables given!"
fi