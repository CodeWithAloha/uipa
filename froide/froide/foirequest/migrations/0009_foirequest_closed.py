# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-12-01 14:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0008_auto_20171124_1508"),
    ]

    operations = [
        migrations.AddField(
            model_name="foirequest",
            name="closed",
            field=models.BooleanField(default=False, verbose_name="is closed"),
        ),
    ]
