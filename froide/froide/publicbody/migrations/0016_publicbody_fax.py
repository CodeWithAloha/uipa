# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-03-08 12:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("publicbody", "0015_jurisdiction_region"),
    ]

    operations = [
        migrations.AddField(
            model_name="publicbody",
            name="fax",
            field=models.CharField(blank=True, max_length=50),
        ),
    ]
