# Generated by Django 3.0.8 on 2020-07-28 13:37

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0044_auto_20200728_1536"),
    ]

    operations = [
        migrations.RenameField(
            model_name="foievent",
            old_name="context_json",
            new_name="context",
        ),
    ]
