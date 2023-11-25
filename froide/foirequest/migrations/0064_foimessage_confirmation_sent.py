# Generated by Django 4.0.8 on 2022-11-30 13:19

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0063_alter_foirequest_costs"),
    ]

    operations = [
        migrations.AddField(
            model_name="foimessage",
            name="confirmation_sent",
            field=models.BooleanField(verbose_name="Confirmation sent?", default=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name="foimessage",
            name="confirmation_sent",
            field=models.BooleanField(default=False, verbose_name="Confirmation sent?"),
        ),
    ]
