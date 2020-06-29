from django.db import models
from userapp.models import UserInfo
from businessapp.models import vehicleCompany


# Create your models here.
class addCategory(models.Model):
    category_id=models.AutoField(primary_key=True)
    category_type=models.CharField(max_length=200,default="")
    isactive=models.BooleanField(default=False)

class subCategory(models.Model):
    category_id=models.ForeignKey(addCategory,on_delete=models.CASCADE)
    subcat_type=models.CharField(max_length=200,default="")
    subcat_id=models.AutoField(primary_key=True)






class vehicleInfo(models.Model):
    company_id = models.ForeignKey(vehicleCompany, on_delete=models.CASCADE ,default="1")
    roleid=models.ForeignKey(UserInfo,on_delete=models.CASCADE,default="1")
    subcat_id = models.ForeignKey(subCategory, on_delete=models.CASCADE,default="4")
    vehicle_id=models.AutoField(primary_key=True)
    vehicle_name=models.CharField(max_length=200,default="")
    vehicle_image1=models.CharField(max_length=200)
    vehicle_image2=models.CharField(max_length=200,null=True)
    vehicle_image3=models.CharField(max_length=200,null=True)

    price=models.CharField(max_length=200,default="")

    isactive=models.BooleanField(default=False)
    vehicle_description=models.CharField(max_length=300,default="")
    vehicle_model=models.CharField(max_length=200,default="")
    abs=models.CharField(max_length=200,default="")
    airbags=models.CharField(max_length=200,default="")
    seats=models.CharField(max_length=200,default="")
    transmission=models.CharField(max_length=200,default="")
    city=models.CharField(max_length=200,default="",null=True)


class bookingDetails(models.Model):
    booking_id=models.AutoField(primary_key=True)
    refunded=models.BooleanField(default=False)
    invoice=models.CharField(max_length=200,default="",unique=True)
    booking_date = models.CharField(max_length=200, default="")
    seller_detail = models.CharField(max_length=200, default="")
    vehicle_detail = models.CharField(max_length=200, default="")
    vehicle_id = models.ForeignKey(vehicleInfo, on_delete=models.CASCADE)
    email = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    start_date = models.CharField(max_length=200, default="")
    end_date = models.CharField(max_length=200, default="")
    is_active =models.BooleanField(default=False)
    is_returned = models.BooleanField(default=False)
    security_amount = models.CharField(max_length=200,default="")
    is_fine=models.BooleanField(default=False)
    fine_amount=models.CharField(max_length=200,default="")
    extension=models.CharField(max_length=200,default="")
    ext_amount=models.CharField(max_length=200,default="")
    damage_amount=models.CharField(max_length=200,default="")
    total_fine=models.CharField(max_length=200,default="")
    amount_exp=models.CharField(max_length=200,default="")
    total=models.CharField(max_length=200,default="")
    balance_amount=models.CharField(max_length=200,default="")
    earnings=models.CharField(max_length=200,default="")
    cancel_token=models.CharField(max_length=200,default="")
    cancellation_time=models.CharField(max_length=200,default="")
    return_date=models.CharField(max_length=200,default="")
    city = models.CharField(max_length=200, default="", null=True)


class payment_token(models.Model):
    token_id=models.CharField(max_length=200,default="")
    user_email=models.CharField(max_length=200,default="")
    token=models.CharField(max_length=200,default="")
    invoice=models.CharField(max_length=200,default="",unique=True)

class login_details(models.Model):
    login_id=models.CharField(max_length=200,default="")
    user_email=models.CharField(max_length=200,default="")
    login_time=models.CharField(max_length=200,default="")
    logout_time=models.CharField(max_length=200,default="")


class city(models.Model):
    city_id = models.AutoField(primary_key=True)
    city=models.CharField(max_length=200,default="")

class availablecities(models.Model):
    cityid = models.AutoField(primary_key=True)
    availablecity = models.CharField(max_length=200, default="" ,unique=True)

class feedbackform(models.Model):
    feedname=models.CharField(max_length=200,default="")
    feedemail=models.CharField(primary_key=True,max_length=200,default="")
    feedmessage=models.CharField(max_length=200,default="")

class bookingDetails2(models.Model):
    booking_id=models.AutoField(primary_key=True)
    refunded=models.BooleanField(default=False)
    invoice=models.CharField(max_length=200,default="",unique=True)
    booking_date = models.CharField(max_length=200, default="")
    seller_detail = models.CharField(max_length=200, default="")
    vehicle_detail = models.CharField(max_length=200, default="")
    vehicle_id = models.ForeignKey(vehicleInfo, on_delete=models.CASCADE)
    email = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    start_date = models.CharField(max_length=200, default="")
    end_date = models.CharField(max_length=200, default="")
    is_active =models.BooleanField(default=False)
    is_returned = models.BooleanField(default=False)
    security_amount = models.CharField(max_length=200,default="")
    is_fine=models.BooleanField(default=False)
    fine_amount=models.CharField(max_length=200,default="")
    extension=models.CharField(max_length=200,default="")
    ext_amount=models.CharField(max_length=200,default="")
    damage_amount=models.CharField(max_length=200,default="")
    total_fine=models.CharField(max_length=200,default="")
    amount_exp=models.CharField(max_length=200,default="")
    total=models.CharField(max_length=200,default="")
    balance_amount=models.CharField(max_length=200,default="")
    earnings=models.CharField(max_length=200,default="")
    cancel_token=models.CharField(max_length=200,default="")
    cancellation_time=models.CharField(max_length=200,default="")
    return_date=models.CharField(max_length=200,default="")
    city = models.CharField(max_length=200, default="", null=True)


