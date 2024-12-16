#!/bin/ash


if [[  "$DEBUG" == "y" ]] || [[  "$DEBUG" == "Y" ]];
then
  uv run ./manage.py diffsettings --all
fi

uv run ./manage.py runserver  0.0.0.0:8000