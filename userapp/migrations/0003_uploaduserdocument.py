# Generated by Django 2.0.6 on 2019-10-28 07:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0002_uploaddocument'),
    ]

    operations = [
        migrations.CreateModel(
            name='UploadUserDocument',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ulicense', models.CharField(max_length=200)),
                ('ulivephoto', models.CharField(max_length=200)),
                ('usecdocument', models.CharField(max_length=200)),
                ('ulicense_no', models.CharField(max_length=200)),
                ('usecondary_name', models.CharField(max_length=200)),
                ('usecondary_id_no', models.CharField(max_length=200)),
                ('uemail', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userapp.UserInfo')),
            ],
        ),
    ]
