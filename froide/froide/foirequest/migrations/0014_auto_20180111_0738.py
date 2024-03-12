# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-01-11 06:38
from __future__ import unicode_literals

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("team", "0001_initial"),
        ("foirequest", "0013_auto_20171220_1718"),
    ]

    operations = [
        migrations.AddField(
            model_name="foiproject",
            name="team",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="team.Team",
                verbose_name="Team",
            ),
        ),
        migrations.AlterField(
            model_name="foiproject",
            name="last_update",
            field=models.DateTimeField(auto_now=True),
        ),
    ]
