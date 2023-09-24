# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-11-15 12:39
from __future__ import unicode_literals

import django.db.models.deletion
from django.db import migrations, models

import taggit.managers


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0031_auto_20181106_1510"),
    ]

    operations = [
        migrations.CreateModel(
            name="MessageTag",
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
                (
                    "name",
                    models.CharField(max_length=100, unique=True, verbose_name="Name"),
                ),
                (
                    "slug",
                    models.SlugField(max_length=100, unique=True, verbose_name="Slug"),
                ),
            ],
            options={
                "verbose_name": "message tag",
                "verbose_name_plural": "message tags",
            },
        ),
        migrations.CreateModel(
            name="TaggedMessage",
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
                (
                    "content_object",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="foirequest.FoiMessage",
                    ),
                ),
                (
                    "tag",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="tagged_messages",
                        to="foirequest.MessageTag",
                    ),
                ),
            ],
            options={
                "verbose_name": "tagged message",
                "verbose_name_plural": "tagged messages",
            },
        ),
        migrations.AddField(
            model_name="foimessage",
            name="tags",
            field=taggit.managers.TaggableManager(
                blank=True,
                help_text="A comma-separated list of tags.",
                through="foirequest.TaggedMessage",
                to="foirequest.MessageTag",
                verbose_name="tags",
            ),
        ),
    ]
