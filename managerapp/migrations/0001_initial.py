# Generated by Django 2.0.6 on 2019-10-27 17:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('businessapp', '0002_auto_20190802_1242'),
        ('userapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='addCategory',
            fields=[
                ('category_id', models.AutoField(primary_key=True, serialize=False)),
                ('category_type', models.CharField(default='', max_length=200)),
                ('isactive', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='availablecities',
            fields=[
                ('cityid', models.AutoField(primary_key=True, serialize=False)),
                ('availablecity', models.CharField(default='', max_length=200, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='bookingDetails',
            fields=[
                ('booking_id', models.AutoField(primary_key=True, serialize=False)),
                ('refunded', models.BooleanField(default=False)),
                ('invoice', models.CharField(default='', max_length=200, unique=True)),
                ('booking_date', models.CharField(default='', max_length=200)),
                ('seller_detail', models.CharField(default='', max_length=200)),
                ('vehicle_detail', models.CharField(default='', max_length=200)),
                ('start_date', models.CharField(default='', max_length=200)),
                ('end_date', models.CharField(default='', max_length=200)),
                ('is_active', models.BooleanField(default=False)),
                ('is_returned', models.BooleanField(default=False)),
                ('security_amount', models.CharField(default='', max_length=200)),
                ('is_fine', models.BooleanField(default=False)),
                ('fine_amount', models.CharField(default='', max_length=200)),
                ('extension', models.CharField(default='', max_length=200)),
                ('ext_amount', models.CharField(default='', max_length=200)),
                ('damage_amount', models.CharField(default='', max_length=200)),
                ('total_fine', models.CharField(default='', max_length=200)),
                ('amount_exp', models.CharField(default='', max_length=200)),
                ('total', models.CharField(default='', max_length=200)),
                ('balance_amount', models.CharField(default='', max_length=200)),
                ('earnings', models.CharField(default='', max_length=200)),
                ('cancel_token', models.CharField(default='', max_length=200)),
                ('cancellation_time', models.CharField(default='', max_length=200)),
                ('return_date', models.CharField(default='', max_length=200)),
                ('city', models.CharField(default='', max_length=200, null=True)),
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userapp.UserInfo')),
            ],
        ),
        migrations.CreateModel(
            name='bookingDetails2',
            fields=[
                ('booking_id', models.AutoField(primary_key=True, serialize=False)),
                ('refunded', models.BooleanField(default=False)),
                ('invoice', models.CharField(default='', max_length=200, unique=True)),
                ('booking_date', models.CharField(default='', max_length=200)),
                ('seller_detail', models.CharField(default='', max_length=200)),
                ('vehicle_detail', models.CharField(default='', max_length=200)),
                ('start_date', models.CharField(default='', max_length=200)),
                ('end_date', models.CharField(default='', max_length=200)),
                ('is_active', models.BooleanField(default=False)),
                ('is_returned', models.BooleanField(default=False)),
                ('security_amount', models.CharField(default='', max_length=200)),
                ('is_fine', models.BooleanField(default=False)),
                ('fine_amount', models.CharField(default='', max_length=200)),
                ('extension', models.CharField(default='', max_length=200)),
                ('ext_amount', models.CharField(default='', max_length=200)),
                ('damage_amount', models.CharField(default='', max_length=200)),
                ('total_fine', models.CharField(default='', max_length=200)),
                ('amount_exp', models.CharField(default='', max_length=200)),
                ('total', models.CharField(default='', max_length=200)),
                ('balance_amount', models.CharField(default='', max_length=200)),
                ('earnings', models.CharField(default='', max_length=200)),
                ('cancel_token', models.CharField(default='', max_length=200)),
                ('cancellation_time', models.CharField(default='', max_length=200)),
                ('return_date', models.CharField(default='', max_length=200)),
                ('city', models.CharField(default='', max_length=200, null=True)),
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userapp.UserInfo')),
            ],
        ),
        migrations.CreateModel(
            name='city',
            fields=[
                ('city_id', models.AutoField(primary_key=True, serialize=False)),
                ('city', models.CharField(default='', max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='feedbackform',
            fields=[
                ('feedname', models.CharField(default='', max_length=200)),
                ('feedemail', models.CharField(default='', max_length=200, primary_key=True, serialize=False)),
                ('feedmessage', models.CharField(default='', max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='login_details',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('login_id', models.CharField(default='', max_length=200)),
                ('user_email', models.CharField(default='', max_length=200)),
                ('login_time', models.CharField(default='', max_length=200)),
                ('logout_time', models.CharField(default='', max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='payment_token',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('token_id', models.CharField(default='', max_length=200)),
                ('user_email', models.CharField(default='', max_length=200)),
                ('token', models.CharField(default='', max_length=200)),
                ('invoice', models.CharField(default='', max_length=200, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='subCategory',
            fields=[
                ('subcat_type', models.CharField(default='', max_length=200)),
                ('subcat_id', models.AutoField(primary_key=True, serialize=False)),
                ('category_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='managerapp.addCategory')),
            ],
        ),
        migrations.CreateModel(
            name='vehicleInfo',
            fields=[
                ('vehicle_id', models.AutoField(primary_key=True, serialize=False)),
                ('vehicle_name', models.CharField(default='', max_length=200)),
                ('vehicle_image1', models.CharField(max_length=200)),
                ('vehicle_image2', models.CharField(max_length=200, null=True)),
                ('vehicle_image3', models.CharField(max_length=200, null=True)),
                ('price', models.CharField(default='', max_length=200)),
                ('isactive', models.BooleanField(default=False)),
                ('vehicle_description', models.CharField(default='', max_length=300)),
                ('vehicle_model', models.CharField(default='', max_length=200)),
                ('abs', models.CharField(default='', max_length=200)),
                ('airbags', models.CharField(default='', max_length=200)),
                ('seats', models.CharField(default='', max_length=200)),
                ('transmission', models.CharField(default='', max_length=200)),
                ('city', models.CharField(default='', max_length=200, null=True)),
                ('company_id', models.ForeignKey(default='1', on_delete=django.db.models.deletion.CASCADE, to='businessapp.vehicleCompany')),
                ('roleid', models.ForeignKey(default='1', on_delete=django.db.models.deletion.CASCADE, to='userapp.UserInfo')),
                ('subcat_id', models.ForeignKey(default='4', on_delete=django.db.models.deletion.CASCADE, to='managerapp.subCategory')),
            ],
        ),
        migrations.AddField(
            model_name='bookingdetails2',
            name='vehicle_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='managerapp.vehicleInfo'),
        ),
        migrations.AddField(
            model_name='bookingdetails',
            name='vehicle_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='managerapp.vehicleInfo'),
        ),
    ]
