from django import forms
from managerapp.models import addCategory,feedbackform,bookingDetails2,subCategory,availablecities,city,vehicleInfo,payment_token,login_details
from businessapp.models import vehicleCompany
class addCategoryForm(forms.ModelForm):
    class Meta():
        model=addCategory
        exclude=["category_id","category_type","isactive"]
class subCategoryForm(forms.ModelForm):
    class Meta():
        model=subCategory
        exclude=["subcat_id","subcat_type","category_id"]

class vehicleInfoForm(forms.ModelForm):
    class Meta():
        model=vehicleInfo
        exclude=["subcat_id","vehicle_name","vehicle_image1","vehicle_image2","vehicle_image3","price","comapany_id","isactive","vehicle_description","abs","roleid","airbags","transmission","seats","vehicle_model","city"]
class vehicleCompanyForm(forms.ModelForm):
    class Meta():
        model=vehicleCompany
        exclude=["company_name","company_id","company_isactive"]

class bookingDetails2Form(forms.ModelForm):
     class Meta():
         model=bookingDetails2
         exclude=["booking_id", "refunded", "invoice","booking_date","seller_detail","vehicle_detail","vehicle_id" ,"email","start_date", "end_date" ,"is_active","is_returned" ,"security_amount","is_fine","fine_amount","extension","ext_amount","damage_amount","total_fine","amount_exp","total", "balance_amount","earnings", "cancel_token","cancellation_time","return_date"]

class payment_tokenForm(forms.ModelForm):
    class Meta():
        model=payment_token
        exclude=["token_id","user_email","token","invoice"]

class login_detailsForm(forms.ModelForm):
    class Meta():
        model=login_details
        exclude=["login_id","user_email","login_time","logout_time"]


class cityForm(forms.ModelForm):
    class Meta():
        model=city
        exclude=["city","city_id"]

class availablecitiesForm(forms.ModelForm):
    class Meta():
        model=availablecities
        exclude=["cityid","availablecity"]

class feedbackformForm(forms.ModelForm):
    class Meta():
        model=feedbackform
        exclude=["feedname","feedemail","feedmessage"]

