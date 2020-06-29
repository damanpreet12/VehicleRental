from django.db import models

class vehicleCompany(models.Model):
    company_name=models.CharField(max_length=200,default="" ,unique=True)
    company_id=models.AutoField(primary_key=True)
    company_isactive=models.BooleanField(default=False)
