@echo off
cd /d "%~dp0"
set PATH=%PATH%;C:\Program Files\PostgreSQL\15\bin
set PGCLIENTENCODING=UTF8
set PGPORT=5434
set /p PGPASSWORD=Lozinka za postgres: 

psql -U postgres -d igraci_dinama -f export_csv.sql
psql -U postgres -d igraci_dinama -t -A -f export_json.sql -o ..\data\igraci_dinama.json
pg_dump -U postgres -d igraci_dinama --encoding=UTF8 -f ..\data\igraci_dinama.sql

echo Gotovo.
pause