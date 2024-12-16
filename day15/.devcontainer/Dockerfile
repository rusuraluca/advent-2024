FROM postgres:latest

ENV POSTGRES_DB holiday_tracker

COPY database/schema.sql /docker-entrypoint-initdb.d/01-schema.sql
COPY database/seed.sql /docker-entrypoint-initdb.d/02-seed.sql