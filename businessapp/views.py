from django.shortcuts import render,HttpResponse,redirect
from miscellaneous import otpGeneration,authorize
from userapp.models import UserRole
from businessapp.models import vehicleCompany
from django.core.files.storage import FileSystemStorage
from managerapp.models import subCategory,vehicleInfo,addCategory
from managerapp.forms import vehicleInfoForm
from managerapp.models import bookingDetails2

# Create your views here.
def index(request):
    auth=authorize.authorize(request.session['Authentication'],request.session['role'],3)
    if auth==True:
        return render(request,'businessindex.html')
    else:
        auth,msg=auth
        if msg=='wrongUser':
            return HttpResponse("WrongUser")
        elif msg=='notLogin':
            return HttpResponse('Login first')
    return render(request,'businessindex.html')
def businessdashboard(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 3)
    if auth == True:
        return render(request,"businessdashboard.html")
    else:
        auth, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUser")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return render(request, 'businessindex.html')

def businessaddvehicle(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 3)
    if auth == True:

        data = vehicleCompany.objects.all()
        data1 = UserRole.objects.all()
        data2=subCategory.objects.all()
        if request.method == "POST":
            user_image = None
            user_image2 = None
            user_image3 = None
            if request.FILES:
                myfile = request.FILES["user_image"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image = fs.url(filename)
                user_image = myfile.name
            if request.FILES:
                myfile = request.FILES["user_image2"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image2 = fs.url(filename)
                user_image2 = myfile.name
            if request.FILES:
                myfile = request.FILES["user_image3"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image3 = fs.url(filename)
                user_image3 = myfile.name
            form = vehicleInfoForm(request.POST)
            f = form.save(commit=False)
            f.vehicle_image1 = user_image
            f.vehicle_image2 = user_image2
            f.vehicle_image3 = user_image3
            f.vehicle_name = request.POST["name"]
            f.price = request.POST["price"]
            f.vehicle_description = request.POST["description"]
            f.vehicle_model = request.POST["model"]
            f.abs = request.POST["abs"]
            f.airbags = request.POST["airbags"]
            f.seats = request.POST["seats"]
            f.transmission = request.POST["transmission"]
            f.isactive = request.POST["available"]
            f.company_id_id = request.POST["company_id"]
            f.roleid_id = request.session['email']
            f.subcat_id_id = request.POST["subcat_id"]
            f.save()
            return HttpResponse("data saved")

        return render(request, "managercatalog.html", {"companydata": data, "roledata": data1,"subcatdata":data2})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return render(request, 'managercatalog.html')
def manager_vehicle(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = vehicleInfo.objects.all()
        return render(request, "manager_vehicles.html", {"catalogdata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
def businessaccount_vehicle(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        email = request.session["email"]
        data = vehicleInfo.objects.filter(roleid_id=email)
        return render(request, "businessaccount_vehicles.html", {"catalogdata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def business_updatevehicles(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        id = request.GET["vehicle_id"]
        data1 = vehicleCompany.objects.all()
        data2 = subCategory.objects.all()

        vehdata = vehicleInfo.objects.get(vehicle_id=id)
        subcategory = vehdata.subcat_id_id
        catdata = subCategory.objects.get(subcat_id=vehdata.subcat_id_id)
        categoyid = catdata.category_id_id
        categorydata = addCategory.objects.get(category_id=categoyid)
        categoryname = categorydata.category_type
        subcatdata = vehdata.subcat_id_id
        compdata = vehdata.company_id_id
        absdata = vehdata.abs
        airdata = vehdata.airbags
        seatsdata = vehdata.seats
        activedata = vehdata.isactive
        transdata = vehdata.transmission

        if request.method == "POST":
            vehicle_name = request.POST["name"]
            price = request.POST["price"]
            vehicle_description = request.POST["description"]
            vehicle_model = request.POST["model"]
            roleid_id = request.session["email"]


            abs = request.POST["abs"]
            airbags = request.POST["airbags"]
            seats = request.POST["seats"]
            transmission = request.POST["transmission"]
            isactive = request.POST["available"]
            company_id_id = request.POST["company_id"]
            subcat_id_id = request.POST["subcat_id"]

            user_image1 = vehdata.vehicle_image1
            user_image2 = vehdata.vehicle_image2
            user_image3 = vehdata.vehicle_image3
            if request.FILES["user_image1"]:
                myfile = request.FILES["user_image1"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image1 = fs.url(filename)
                user_image1 = myfile.name
            if request.FILES["user_image2"]:
                myfile = request.FILES["user_image2"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image2 = fs.url(filename)
                user_image2 = myfile.name
            if request.FILES["user_image3"]:
                myfile = request.FILES["user_image3"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image3 = fs.url(filename)
                user_image3 = myfile.name

            update = vehicleInfo(
                vehicle_id=id,
                vehicle_name=vehicle_name,
                price=price,
                vehicle_description=vehicle_description,
                vehicle_model=vehicle_model,
                roleid_id=roleid_id,
                vehicle_image1=user_image1,
                vehicle_image2=user_image2,
                vehicle_image3=user_image3,

                abs=abs,
                airbags = airbags,
                seats = seats,
                transmission = transmission,
                isactive = isactive,
                company_id_id = company_id_id,
                subcat_id_id= subcat_id_id,

            )
            update.save(update_fields=["vehicle_name", "vehicle_image3", "vehicle_image2", "vehicle_image1", "price",
                                       "vehicle_description", "roleid_id", "vehicle_model","abs","airbags","seats","transmission","isactive","company_id_id","subcat_id_id"])
            return redirect("/business/businessaccount_vehicles")
        data = vehicleInfo.objects.get(vehicle_id=id)
        return render(request, "business_updatevehicles.html",
                      {"catalogdata": vehdata, "companykey": compdata, "abskey": absdata, "airkeys": airdata,
                       "seatskey": seatsdata, "activekey": activedata, "transmissiondata": transdata,
                       "subcatkey": subcatdata, "companydata": data1, "subcatdata": data2, 'cn': categoryname})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def business_vehicledelete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        vehicle_id = request.GET["vehicle_id"]
        data = vehicleInfo.objects.filter(vehicle_id=vehicle_id)
        data.delete()
        return redirect("/business/businessaccount_vehicles/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')






