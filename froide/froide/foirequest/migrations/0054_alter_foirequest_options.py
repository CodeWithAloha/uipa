# Generated by Django 3.2.8 on 2021-12-15 20:23

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("foirequest", "0053_alter_foimessage_email_headers"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="foirequest",
            options={
                "get_latest_by": "last_message",
                "ordering": ("-last_message",),
                "permissions": (
                    ("see_private", "Can see private requests"),
                    ("create_batch", "Create batch requests"),
                    ("mark_not_foi", "Can mark as not FOI"),
                    ("moderate", "Can moderate requests"),
                    ("moderate_pii", "Can moderate personal information"),
                ),
                "verbose_name": "Freedom of Information Request",
                "verbose_name_plural": "Freedom of Information Requests",
            },
        ),
    ]
