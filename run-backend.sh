#!/bin/ash

#yarn install
#yarn build
yarn serve dev &


if [[ "${INITIALIZE_DB}" == "y" ]] || [[ "${INITIALIZE_DB}" == "Y" ]];
then
  echo "Initializing database"
  # To initialise the database:
  uv run ./manage.py migrate --skip-checks

  # Create and populate search index
  echo "Creating search indices..."
  uv run ./manage.py search_index --create
  uv run ./manage.py search_index --populate
else
  echo "Skipping database initialization and creation of search indices"
fi

if [[ "${LOAD_DATA}" == "y" ]] || [[ "${LOAD_DATA}" == "Y" ]];
then
  echo "Load the seed data..."
  uv run ./manage.py loaddata uipa_org/fixtures/*
else
  echo "Skipping seed data load"
fi

export DEBUG
uv run /bin/ash /srv/django/run-django.sh
