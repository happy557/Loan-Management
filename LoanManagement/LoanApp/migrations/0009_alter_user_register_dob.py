# Generated by Django 4.1.7 on 2023-03-13 05:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LoanApp', '0008_alter_user_register_dob'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user_register',
            name='dob',
            field=models.DateField(default='0000-00-00'),
        ),
    ]
