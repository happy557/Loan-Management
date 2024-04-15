# Generated by Django 4.1.7 on 2023-03-15 17:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LoanApp', '0018_application_vehicle_loan_allowed_loan_amount_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='application_personal_loan',
            name='allowed_loan_amount',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True),
        ),
        migrations.AddField(
            model_name='application_personal_loan',
            name='allowed_tenure',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='application_personal_loan',
            name='dispersal_date',
            field=models.DateField(default='2023-03-03'),
        ),
        migrations.AddField(
            model_name='application_personal_loan',
            name='interest_rate',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=5, null=True),
        ),
    ]