# -*- coding: utf-8 -*-
# Generated by Django 1.11.13 on 2018-06-28 10:15
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0022_auto_20180628_1126"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="foimessage",
            name="is_postal",
        ),
    ]
