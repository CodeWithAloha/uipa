# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-12-24 06:32
from __future__ import unicode_literals

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("publicbody", "0005_auto_20171106_1503"),
    ]

    operations = [
        migrations.CreateModel(
            name="Classification",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("path", models.CharField(max_length=255, unique=True)),
                ("depth", models.PositiveIntegerField()),
                ("numchild", models.PositiveIntegerField(default=0)),
                ("name", models.CharField(max_length=255, verbose_name="name")),
                ("slug", models.SlugField(max_length=255, verbose_name="slug")),
            ],
            options={
                "verbose_name": "classification",
                "verbose_name_plural": "classifications",
                "ordering": ("name",),
            },
        ),
        migrations.RenameField(
            model_name="publicbody",
            old_name="classification",
            new_name="classification_name",
        ),
        migrations.AddField(
            model_name="publicbody",
            name="classification",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="publicbody.Classification",
            ),
        ),
    ]
