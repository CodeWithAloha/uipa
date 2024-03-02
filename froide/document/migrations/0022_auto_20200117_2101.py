# Generated by Django 2.2.4 on 2020-01-17 20:01

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("filingcabinet", "0016_auto_20200108_1228"),
        ("document", "0021_document_allow_annotation"),
    ]

    operations = [
        migrations.AddField(
            model_name="document",
            name="portal",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="filingcabinet.DocumentPortal",
            ),
        ),
        migrations.AddField(
            model_name="documentcollection",
            name="portal",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="filingcabinet.DocumentPortal",
            ),
        ),
    ]