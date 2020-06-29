from django.shortcuts import render,redirect,HttpResponse
from managerapp.models import addCategory,subCategory,vehicleInfo,availablecities,bookingDetails,bookingDetails2
from managerapp.forms import addCategoryForm,cityForm,availablecitiesForm,subCategoryForm,vehicleInfoForm,bookingDetails2Form,vehicleCompanyForm
from userapp.models import UserRole
from businessapp.models import vehicleCompany
from django.core.files.storage import FileSystemStorage
from miscellaneous import authorize

# Create your views here.
def dashboard(request):
    roleid=request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        return render(request,"dashboard.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def ubookings_all(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 1)
    if auth == True:
       data = bookingDetails2.objects.exclude(email_id="vermashanaya1234@gmail.com" )

       return render(request, "userbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def mbookings_all(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 1)
    if auth == True:
        data = bookingDetails2.objects.filter(email_id="vermashanaya1234@gmail.com")
        return render(request, "managerbookings.html", {"booking": data })
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def ubookings_active(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 1)
    if auth == True:

           data = bookingDetails2.objects.filter(earnings="").exclude(email_id="vermashanaya1234@gmail.com" )
           return render(request, "userbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def mbookings_active(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 1)
    if auth == True:

            data = bookingDetails2.objects.filter(email_id="vermashanaya1234@gmail.com").filter(earnings="")
            return render(request, "managerbookings.html", {"booking": data })


    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def ubookings_cancel(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        data = bookingDetails2.objects.exclude(email_id="vermashanaya1234@gmail.com").filter(is_active=0,return_date="")
        return render(request, "userbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def mbookings_cancel(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        data = bookingDetails2.objects.filter(email_id="vermashanaya1234@gmail.com",return_date="").exclude(cancellation_time="")
        return render(request, "managerbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def ubookings_completed(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = bookingDetails2.objects.exclude(email_id="vermashanaya1234@gmail.com").filter(cancellation_time="",is_active=0)
        return render(request, "userbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def mbookings_completed(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = bookingDetails2.objects.filter(email_id="vermashanaya1234@gmail.com",cancellation_time="").exclude(return_date="")
        return render(request, "managerbookings.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def managercars(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        maincat = addCategory.objects.get(category_id=1)
        subcat = subCategory.objects.filter(category_id_id=maincat.category_id)
        l = list()
        for i in subcat:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)

        return render(request, "managercars.html", {"vehinfodata": l})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def managerbikes(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        maincat = addCategory.objects.get(category_id=3)
        subcat = subCategory.objects.filter(category_id_id=maincat.category_id)
        l = list()
        for i in subcat:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)
        return render(request, "managerbikes.html", {"vehinfodata": l})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def managerscooty(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        maincat = addCategory.objects.get(category_id=2)
        subcat = subCategory.objects.filter(category_id_id=maincat.category_id)
        l = list()
        for i in subcat:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)
        return render(request, "managerscooty.html", {"vehinfodata": l})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def managercatalog(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
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
            f.city=0
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


def vehicleCategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        if request.method == "POST":
            cat = request.POST["category"]
            form = addCategoryForm(request.POST)
            f = form.save(commit=False)
            f.category_type = request.POST["category"]
            f.save()
        return render(request, "vehicleCategory.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def subcategory(request):
    roleid=request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = addCategory.objects.all()
        if request.method == "POST":
            subcat = request.POST["subcategory"]

            form = subCategoryForm(request.POST)
            f = form.save(commit=False)
            f.category_id_id = request.POST['category']
            f.subcat_type = request.POST["subcategory"]
            f.save()
        return render(request, "subCategory.html", {"categorydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def vehiclecompany(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = addCategory.objects.all()
        if request.method == "POST":
            company = request.POST["company"]
            form = vehicleCompanyForm(request.POST)
            f = form.save(commit=False)
            f.company_name = request.POST["company"]
            f.save()
        return render(request, "vehicle_company.html", {"categorydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')





def viewSubCategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        data = subCategory.objects.all()
        return render(request, "view_subCategory.html", {"subcatdata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def viewCategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = addCategory.objects.all()
        return render(request, "view_category.html", {"categorydata": data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def viewcompany(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = vehicleCompany.objects.all()
        return render(request, "view_company.html", {"companydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def viewcity(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = availablecities.objects.all()
        return render(request, "view_city.html", {"citydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def viewcatalog(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        data = vehicleInfo.objects.all()
        return render(request, "view_catalog.html", {"catalogdata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')




def delete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        cat_id = request.GET["category_id"]
        data = addCategory.objects.filter(category_id=cat_id)
        data.delete()
        return redirect("/manager/viewcategory/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def subcatdelete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        subcat_id = request.GET["subcat_id"]
        data = subCategory.objects.filter(subcat_id=subcat_id)
        data.delete()
        return redirect("/manager/viewsubcategory/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def companydelete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        company_id = request.GET["company_id"]
        data = vehicleCompany.objects.filter(company_id=company_id)
        data.delete()
        return redirect("/manager/viewcompany/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
def citydelete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        cityid = request.GET["cityid"]
        data = availablecities.objects.filter(cityid=cityid)
        data.delete()
        return redirect("/manager/viewcity/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def catalogdelete(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        vehicle_id = request.GET["vehicle_id"]
        data = vehicleInfo.objects.filter(vehicle_id=vehicle_id)
        data.delete()
        return redirect("/manager/viewcatalog/")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def updateSubCategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        id = request.GET["subcat_id"]
        if request.method == "POST":
            type = request.POST["subcategory"]
            update = subCategory(
                subcat_id=id,
                subcat_type=type,
            )
            update.save(update_fields=["subcat_type"])
            return redirect("/manager/viewsubcategory")
        data = subCategory.objects.get(subcat_id=id)
        return render(request, "updateSubCategory.html", {"subcatdata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def updatecategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        id = request.GET["category_id"]
        if request.method == "POST":
            type = request.POST["category"]
            update = addCategory(
                category_id=id,
                category_type=type,
            )
            update.save(update_fields=["category_type"])
            return redirect("/manager/viewcategory")
        data = addCategory.objects.get(category_id=id)
        return render(request, "updatecategory.html", {"categorydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def updatecompany(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        id = request.GET["company_id"]
        if request.method == "POST":
            name = request.POST["company"]
            update = vehicleCompany(
                company_id=id,
                company_name=name,
            )
            update.save(update_fields=["company_name"])
            return redirect("/manager/viewcompany")
        data = vehicleCompany.objects.get(company_id=id)
        return render(request, "updatecompany.html", {"companydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def updatecity(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        id = request.GET["cityid"]
        if request.method == "POST":
            name = request.POST["city"]
            update = availablecities(
                cityid=id,
                availablecity=name,
            )
            update.save(update_fields=["availablecity"])
            return redirect("/manager/viewcity")
        data = availablecities.objects.get(cityid=id)
        return render(request, "update_city.html", {"citydata": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def updatecatalog(request):
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
            return redirect("/manager/viewcatalog")
        data = vehicleInfo.objects.get(vehicle_id=id)
        return render(request, "updatecatalog.html",
                      {"catalogdata": vehdata, "companykey": compdata, "abskey": absdata, "airkeys": airdata,
                       "seatskey": seatsdata, "activekey": activedata, "transmissiondata": transdata,
                       "subcatkey": subcatdata, "companydata": data1, "subcatdata": data2, 'cn': categoryname})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')





def city(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        if request.method == "POST":
            city = request.POST["city"]
            form = availablecitiesForm(request.POST)
            f = form.save(commit=False)
            f.availablecity = city
            f.save()
        return render(request, "addcity.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def policy(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        return render(request,"policy.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def cancel_done_all(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
         return render(request, "cancel_done_all.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
def return_done_all(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
         return render(request, "return_done_all.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

