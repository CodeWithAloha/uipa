# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-11-16 15:14
from __future__ import unicode_literals

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ("sites", "0002_alter_domain_unique"),
        ("contenttypes", "0002_remove_content_type_name"),
    ]

    operations = [
        migrations.CreateModel(
            name="FroideComment",
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
                ("object_pk", models.TextField(verbose_name="object ID")),
                (
                    "user_name",
                    models.CharField(
                        blank=True, max_length=50, verbose_name="user's name"
                    ),
                ),
                (
                    "user_email",
                    models.EmailField(
                        blank=True, max_length=254, verbose_name="user's email address"
                    ),
                ),
                ("user_url", models.URLField(blank=True, verbose_name="user's URL")),
                ("comment", models.TextField(max_length=3000, verbose_name="comment")),
                (
                    "submit_date",
                    models.DateTimeField(
                        db_index=True, default=None, verbose_name="date/time submitted"
                    ),
                ),
                (
                    "is_public",
                    models.BooleanField(
                        default=True,
                        help_text="Uncheck this box to make the comment effectively disappear from the site.",
                        verbose_name="is public",
                    ),
                ),
                (
                    "is_removed",
                    models.BooleanField(
                        default=False,
                        help_text='Check this box if the comment is inappropriate. A "This comment has been removed" message will be displayed instead.',
                        verbose_name="is removed",
                    ),
                ),
                (
                    "content_type",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="content_type_set_for_froidecomment",
                        to="contenttypes.ContentType",
                        verbose_name="content type",
                    ),
                ),
                (
                    "site",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="sites.Site"
                    ),
                ),
                (
                    "user",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        related_name="froidecomment_comments",
                        to=settings.AUTH_USER_MODEL,
                        verbose_name="user",
                    ),
                ),
            ],
            options={
                "verbose_name": "comment",
                "verbose_name_plural": "comments",
                "ordering": ("submit_date",),
                "permissions": [("can_moderate", "Can moderate comments")],
                "abstract": False,
            },
        ),
    ]
