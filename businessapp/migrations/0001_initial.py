# Generated by Django 2.0.6 on 2019-08-01 09:40

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='vehicleCompany',
            fields=[
                ('company_name', models.CharField(default='', max_length=200)),
                ('company_id', models.AutoField(primary_key=True, serialize=False)),
                ('company_isactive', models.BooleanField(default=False)),
            ],
        ),
    ]