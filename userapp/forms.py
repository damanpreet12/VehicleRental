from django import forms
from userapp.models import UserRole,UserInfo,Document,userDocument,UploadUserDocument

class UserRoleForm(forms.ModelForm):
    class Meta():
        model=UserRole
        exclude=["roleid","rolename"]
class UserInfoForm(forms.ModelForm):
    class Meta():
        model=UserInfo
        exclude=["roleid","username","email","mobile","city","address","isActive","otp","token","time", 'password',"vehicle_image1","dob","gender","codriver"]
class documentForm(forms.ModelForm):
    class Meta():
        model=Document
        exclude=["license","livephoto","secdocument","email"]
class userdocumentForm(forms.ModelForm):
    class Meta():
        model=userDocument
        exclude=["license","livephoto","secdocument","email",]
class UploaddocumentForm(forms.ModelForm):
    class Meta():
        model=userDocument
        exclude=["license","livephoto","secdocument","email","license_no","secondary_name","secondary_id_no"]

class UploaduserdocumentForm(forms.ModelForm):
    class Meta():
        model=UploadUserDocument
        exclude=["ulicense","ulivephoto","usecdocument","uemail","ulicense_no","usecondary_name","usecondary_id_no"]