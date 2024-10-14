[![Stories in Ready](https://badge.waffle.io/codeforhawaii/uipa_org.png?label=ready&title=Ready)](https://waffle.io/codeforhawaii/uipa_org)

# UIPA.org - Uniform Information Practices Act portal

This is a basic Django project with a theme app that plugs into
[Froide](https://github.com/stefanw/froide). It's based on the [Froide Base
Theme](https://github.com/okfde/froide-theme).

## Get started easily

Prerequisite libraries and programs:

 * Python 3.8 in a virtual environment (python -m venv venv3)
    * **NOTE:** Use a pip version less than 24 with Python 3.8.
 * libmagic (yum install libmagic, apt-get install libmagic, etc.)
 * PostgreSQL - psycopg2 needs the libraries locally.
 * postgis library
 * GDAL library
 * libgeoip libary
 * Docker
    * Desktop (Mac or Windows) - See [Overview of Docker Desktop](https://docs.docker.com/desktop/)
    * Engine (Linux) - See [Docker Engine overview](https://docs.docker.com/engine/)


Clone this repo and change into the directory that the repo was cloned to.

Start a PostgreSQL database and an Elasticsearch server in docker containers using:

    docker compose up -d

After activating your Python 3.8 virtualenv, run:

    pip install -r requirements.txt -e . --src=./src
    python manage.py migrate  --noinput
    python manage.py loaddata uipa_org/fixtures/*
    python manage.py runserver

The admin user is created from a fixture file and its password is *testing*.

Log on to the Admin site at http://127.0.0.1:8000/uipa-admin/. You can
create or modify flatpages there.

At this point, visit http://127.0.0.1:8000/ in your browser and you should see
the home page for uipa.org.


### Searching for public agencies or requests

Once you have a running UIPA server, you'll want to be able to search for
public bodies or previously submitted requests for information. To so, you'll
need to:

* Dowload and install Elasticsearch
* Run an Elasticsearch server
* Build the indexes

```
python manage.py update_index
```

## Running UIPA on Heroku

There is a complete guide of how to set up Froide on Heroku at
http://froide.readthedocs.org/en/latest/herokudeployment/. For UIPA, you'll
need to interpolate a bit.


## Froide documentation

http://froide.readthedocs.org/en/latest/gettingstarted/

For details about working with Froide Themes see [Theming
Froide](http://froide.readthedocs.org/en/latest/theming/).


## Creating page content for the About, Help, Terms of Use, and Privacy Statement links

Django Flat Pages are used to create these pages. They are "flat" HTML content
stored in the database. For details, see [The flatpages
app](https://docs.djangoproject.com/es/1.9/ref/contrib/flatpages/)
documentation.

To create these pages initially, we:

* Create the pages using the Django administration interface at
  http://127.0.0.1:8000/uipa-admin/. Click on the *Flat pages* link.
* Dump the database in JSON format (see below).
* Edit the dump file, `<db-dump>.json`.
* Copy the section of JSON data for the model, `flatpages.flatpage` (see
  below).
* Put the JSON data in a file under the uipa_org/fixtures directory named
  `flatpages.flatpage.json`.


### Loading the page data

Once the page data files have been created under the fixtures directory, they
can be loaded whenever a new instance of uipa.org is created. This is done by
loading the page data files using this command:

```
python manage.py loaddata <page>
```
where `<page>` is the name of the page data file without the `.json`
extension. Multiple pages can be loaded at the same time.


### Dumping the database

Dumping the database in JSON format is done using the command:

```
python manage.py dumpdata --indent 4 > db-dump.json
```


### Page data in JSON format

Here's an example of the page data in JSON format for the About page in the
fixtures/about-page.json:

```
[
    {
        "fields": {
            "content": "<p>UIPA.org is the place where you can request information from your State of Hawaii government.</p>\r\n\r\n<p>UIPA stands for Uniform Information Practices Act and is the law covered by HRS Chapter 92F. It requires open access to government records. More information about the law can be seen at the State of Hawaii Office of Information Practices (OIP) website at <a href=\"http://oip.hawaii.gov/laws-rules-opinions/uipa/\">http://oip.hawaii.gov/laws-rules-opinions/uipa/</a>.</p>\r\n<p>You'll probably want to start with the <a href=\"http://oip.hawaii.gov/basic-qa-on-access-to-government-records/\">Basic Q&A on Access to Government Records</a> page where you can find out:</p>\r\n<ul><li>What types of records are public,</li><li>Who can request a record,</li><li>What government records are restricted or closed by law</li></ul></p>",
            "enable_comments": false,
            "registration_required": false,
            "sites": [
                1
            ],
            "template_name": "help/page.html",
            "title": "About UIPA.org",
            "url": "/help/about/"
        },
        "model": "flatpages.flatpage",
        "pk": 1
    }
]
```


## License

Froide Theme is licensed under the MIT License.
