# Generated by Django 4.2.1 on 2023-05-24 09:10

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("account", "0035_case_insensitive_collation"),
    ]

    operations = [
        migrations.AlterField(
            model_name="application",
            name="user",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                related_name="%(app_label)s_%(class)s",
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        migrations.AlterField(
            model_name="user",
            name="email",
            field=models.EmailField(
                blank=True,
                db_collation="case_insensitive",
                max_length=254,
                null=True,
                unique=True,
                verbose_name="email address",
            ),
        ),
        migrations.AlterField(
            model_name="usertag",
            name="slug",
            field=models.SlugField(
                allow_unicode=True, max_length=100, unique=True, verbose_name="slug"
            ),
        ),
    ]