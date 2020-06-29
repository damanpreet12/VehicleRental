from django.shortcuts import render,HttpResponse,redirect
from userapp.models import UserRole,UserInfo,UploadDocument,UploadUserDocument
from userapp.forms import UserRoleForm,UserInfoForm,UploaddocumentForm,UploaduserdocumentForm
from miscellaneous import otpGeneration,authorize
from miscellaneous.emailSending import notifyemail,otpsend,linksend
from managerapp.models import vehicleInfo,feedbackform,addCategory,bookingDetails2,subCategory,availablecities
from managerapp.forms import payment_tokenForm,feedbackformForm,bookingDetails2Form,login_detailsForm,availablecitiesForm
from django.contrib.auth.hashers import make_password,check_password
from paypal.standard.forms import PayPalPaymentsForm
from django.forms.models import model_to_dict
from django.conf import settings
from django.urls import reverse
import random
from datetime import date,datetime,time,timedelta

from django.core.files.storage import FileSystemStorage

# Create your views here.
def index(request):
    if request.method=="POST":
        name=request.POST["name"]
        email = request.POST["email"]
        message = request.POST["message"]
        form = feedbackformForm(request.POST)
        f = form.save(commit=False)
        f.feedname = name
        f.feedemail = email
        f.feedmessage = message
        f.save()
        return render(request, 'index.html')

    return render(request,'index.html')

def signup(request):
    data = UserRole.objects.all()
    if request.method == "POST":
        form = UserInfoForm(request.POST)
        f = form.save(commit=False)
        f.roleid_id = request.POST['role']
        f.username = request.POST["name"]
        f.email = request.POST["email"]

        con_password = request.POST["conf-password"]
        password = request.POST["password"]
        if password != "" and con_password != "":
            if password == con_password:
                f.password = make_password(request.POST["password"])
            else:
                return render(request, "signup.html", {"passworderror": False, 'roledata': data})

        number, numbertime = otpGeneration.otpfunc()
        token = request.POST["email"][0:5] + str(number) + str(request.POST["name"][0:3])
        link = "http//:127.0.0.1:8000/verifyuser/?email=" + request.POST["email"] + "&token=" + str(token)
        linksend(request.POST["email"], link)

        f.token = token
        f.save()
        return render(request, "signup_data_saved.html")
    return render(request, "signup.html", {'roledata': data})
def verifyuser(request):
    token = request.GET["token"]
    email = request.GET["email"]
    data = UserInfo.objects.get(email=email)
    print(data)

    tokenvalue = data.token

    print(tokenvalue)

    if (token == tokenvalue):
        update = UserInfo(
            email=email,
            isActive=True
        )
        update.save(update_fields=["isActive"])

        return redirect("/user/login/")

    else:
        return HttpResponse("<h1>not verified </h1>")

def adminmaster(request):
    return render(request,"adminmaster.html")
def usmaster(request):
    return render(request,"usermasterpage.html")
def login(request):
    if request.method=="POST":
        email=request.POST["email"]
        password=request.POST["password"]
        try:
            data=UserInfo.objects.get(email=email)
        except:
            return render(request,"login.html",{"emailerror":True})
        dp=check_password(password,data.password)
        role=data.roleid_id
        chkactive=data.isActive
        if(chkactive==False):
            return render(request,"login.html",{"activeerror":True})
        else:
            if(dp==True):
                request.session["email"]=email
                request.session["Authentication"]=True
                request.session["role"]=role
                if role ==1:
                    return redirect("/manager/dashboard/")
                elif role==2:
                    return redirect("/user/index/")
                elif role==3:
                    return redirect("/business/businessdashboard/")


            else:
                return render(request,"login.html",{"passworderror":True})
    return render(request,"login.html")

def passwordUpdate(request):
        email = request.GET["email"]
        if request.method == "POST":

            otpvalue = request.POST["otp"]
            new_pass = request.POST["new_password"]
            con_pass = request.POST["confirm_password"]
            data = UserInfo.objects.get(email=email)
            data_otp = data.otp

            if otpvalue != "":
                if data_otp == otpvalue:
                    return render(request, "passwordUpdate.html", {'updatepassword': True})
                else:
                    return render(request, "passwordUpdate.html", {'OTP': True, 'wrongotp': True})
            if new_pass != "" and con_pass != "":
                result = confirmation(new_pass, con_pass, email)
                if result == True:

                    return render(request, "password_update_success.html")
                else:
                    return render(request, "password_update_unsuccess.html")

        return render(request, "passwordUpdate.html", {'OTP': True})

def confirmation(np,cp,email):
    new_pass=np
    con_pass=cp
    if new_pass == con_pass:
        db_pass=make_password(con_pass)
        update = UserInfo(
                    email=email,
                    password=db_pass
                )
        update.save(update_fields=["password"])
        return True
    else:
        return False
def forget(request):
    if request.method=="POST":
        email=request.POST["email"]
        data=UserInfo.objects.get(email=email)
        otp, otp_time = otpGeneration.otpfunc()
        update = UserInfo(
            email=email,
            otp=otp,
            time=otp_time
        )
        update.save(update_fields=["otp", "time"])
        request.session['email'] = email
        otpsend(email, otp)
        return redirect("/user/updatepass/?email="+email)
    return render(request,'forget.html')


def logout(request):
    request.session['Authentication']=False
    request.session['email']=None
    return redirect("/")

def vehiclecards(request):

    data = vehicleInfo.objects.all()

    return render(request, "vehiclescard.html", {"vehinfodata": data})
def userindex(request):
    roleid=request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        if request.method == "POST":
            name = request.POST["name"]
            email = request.POST["email"]
            message = request.POST["message"]
            form = feedbackformForm(request.POST)
            f = form.save(commit=False)
            f.feedname = name
            f.feedemail = email
            f.feedmessage = message
            f.save()
            return render(request, 'userIndex.html')

        return render(request,"userIndex.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

    return render(request,"userIndex.html")

def indexMaster(request):
    return render(request,"indexMaster.html")

def useraccount(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 2)
    if auth == True:
        email = request.session["email"]
        # data2 = bookingDetails2.objects.get(email_id=email)
        # bid = data2.booking_id
        # request.session["booking_id"] = bid

        return render(request, "userAccount.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


    return render(request,"userAccount.html")

def cars(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        car = addCategory.objects.get(category_id=1)
        sub = subCategory.objects.filter(category_id_id=car.category_id)
        l = list()
        for i in sub:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)
        return render(request, "cars.html", {"cars": l})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def bikes(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        bikes = addCategory.objects.get(category_id=3)
        sub = subCategory.objects.filter(category_id_id=bikes.category_id)
        l = list()
        for i in sub:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)
        return render(request, "bikes.html", {"bikes": l})


    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def scooter(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        scooter = addCategory.objects.get(category_id=2)
        sub = subCategory.objects.filter(category_id_id=scooter.category_id)
        l = list()
        for i in sub:
            data = vehicleInfo.objects.filter(subcat_id_id=i.subcat_id)
            for j in data:
                l.append(j)
        return render(request, "scooter.html", {"scooter": l})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def carcategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        subcat_id_id = request.GET["subcat_id_id"]
        data = vehicleInfo.objects.filter(subcat_id_id=subcat_id_id)
        l = list()
        for j in data:
            l.append(j)
        return render(request, "cars.html", {"cars": l})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def scootercategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        subcat_id_id = request.GET["subcat_id_id"]

        data = vehicleInfo.objects.filter(subcat_id_id=subcat_id_id)
        l = list()
        for j in data:
            l.append(j)
        return render(request, "scooter.html", {"scooter": l})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def bikecategory(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        subcat_id_id = request.GET["subcat_id_id"]

        data = vehicleInfo.objects.filter(subcat_id_id=subcat_id_id)
        l = list()
        for j in data:
            l.append(j)
        return render(request, "bikes.html", {"bikes": l})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def viewcard(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        vehicle_id=request.GET["vehicle_id"]

        data=vehicleInfo.objects.filter(vehicle_id=vehicle_id)
        return render(request,"viewCards.html",{"view":data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

    return render(request, "viewsCards.html")

def paymentprocess(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)

    if auth == True:
        vehicle_id = request.session["vehicle_id"]
        data = vehicleInfo.objects.get(vehicle_id=vehicle_id)
        price=data.price
        name=data.vehicle_name
        bookdata=bookingDetails2.objects.get(vehicle_id=vehicle_id)
        bookdata2=bookdata.invoice

        host = request.get_host()
        paypal_dict = {
            'business': settings.PAYPAL_RECEIVER_EMAIL,
            'amount':str(price),
            'item_name': str(name),
            'invoice': str(bookdata2),  # need to write new invoice every time
            'currency_code': 'USD',
            'notify_url': 'http://{}{}'.
                format(host, reverse('paypal-ipn')),
            'return_url': 'http://{}{}'.
                format(host, reverse('payment_done')),
        }
        form = PayPalPaymentsForm(initial=paypal_dict)
        vehicleInfo.objects.filter(vehicle_id=vehicle_id).update(isactive=0)
        return render(request, 'payment_process.html',{'form': form,"view":data,"book_key":bookdata})



    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

    return render(request,"payment_process.html")

def paymentdone(request):
    roleid = request.session["role"]

    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:


        return render(request, "payment_done.html")


    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

    return render(request,"payment_done.html")

def paymentcancel(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        return render(request, 'payment_cancel.html')


    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

    return render(request,"payment_cancel.html")


def bookingform(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)

    if auth == True:
        data=availablecities.objects.all()
        if request.method == "POST" :

            vehicle_id = request.GET["vehicle_id"]
            request.session["vehicle_id"] = vehicle_id
            email_id=request.session["email"]
            roleid=request.session["role"]
            try:
                email=bookingDetails2.objects.filter(email_id=email_id)
            except:
                if roleid==2:
                    if email!="":
                        return HttpResponse(email_id+"You cannot book the car its already sold out")
            city = request.POST["city"]
            dataname = vehicleInfo.objects.get(vehicle_id=vehicle_id)
            name=dataname.vehicle_name
            price=dataname.price
            n = random.randint(1000, 9000)
            invoice = str(n) + str(name[0:6])
            data=vehicleInfo.objects.get(vehicle_id=vehicle_id)
            datarole=data.roleid_id

            format = '%m/%d/%Y %H:%M %p'
            start_date = request.POST["startDate"]
            end_date = request.POST["org_endDate"]
            edate=datetime.strptime(end_date,format)
            sdate=datetime.strptime(start_date,format)
            time1=edate-sdate
            tdays,tseconds=time1.days,time1.seconds
            hrs=(tdays)*24+tseconds//3600
            exp=int(hrs)*int(price)
            total = int('10000') + int(exp)
            form = bookingDetails2Form(request.POST)
            f = form.save(commit=False)
            f.start_date = request.POST["startDate"]
            f.end_date = request.POST["org_endDate"]
            f.email_id=email_id
            f.vehicle_id_id=vehicle_id
            f.city=city
            f.refunded=0
            f.invoice=str(invoice)
            f.booking_date=str(date.today())
            f.seller_detail=datarole
            f.vehicle_detail=""
            f.is_active=1
            f.is_returned=0
            f.security_amount=10000
            f.is_fine=0
            f.fine_amount=""
            f.extension=""
            f.ext_amount=""
            f.damage_amount=""
            f.total_fine=""
            f.amount_exp=exp
            f.total=total
            f.balance_amount=""
            f.earnings=""
            f.cancel_token=""
            f.cancellation_time=""
            f.return_date=""
            f.save()
            body="Your booking is confirmed."\
                 "Vehicle is "+ name + "and booking date is from "+ str(start_date)+" to "+ str(end_date)
            notifyemail(request.session["email"],body)

            return redirect("/user/confirmbooking/")

        return render(request, "booking_form.html",{"bookcity":data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return redirect("/user/login/")

def bookingformUpdate(request):
    email = request.session["email"]
    roleid = request.session["role"]
    data1=bookingDetails2.objects.filter(email=email)
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
       bid = request.GET["booking_id"]
       data = bookingDetails2.objects.get(booking_id=bid)
       is_active=data.is_active
       cancellation_time=data.cancellation_time
       if is_active == 1 and cancellation_time=="":
        if request.method == "POST":
            data=bookingDetails2.objects.get(booking_id=bid)
            isreturn = 1
            damage = request.POST["damage"]

            if damage == "0":
                damage = 500
            elif damage == "1":
                damage = 1000
            elif damage == "2":
                damage = 2000
            else:
                damage = "after_analysis"

            format = '%m/%d/%Y %H:%M %p'
            data6 = data.end_date
            amountexp = data.amount_exp
            endday = datetime.strptime(data6, format)
            today = datetime.today()
            returndate = today.strftime("%m/%d/%Y %H:%M %p")
            retday = datetime.strptime(returndate, format)
            extraduration = retday - endday
            isfine = 0
            total = data.total
            security_amount=data.security_amount
            extamount = 0
            totalfine = 0
            if int(str(extraduration)[0:2]) > 0:
                edays, eminutes = extraduration.days, extraduration.seconds
                ehrs = edays * 24 + eminutes // 3600
                extamount = int(ehrs) * int('250')
                totalfine = int(extamount) + int(damage)
                total1 = int(amountexp) + int(totalfine)
                bamount = (int(security_amount) - int(totalfine))
                earnings=int(total1)
            else:
                total1 = int(damage)
                bamount = (int(security_amount) - int(total1))
                earnings = int(total1)+int(amountexp)
            today = datetime.today()

            update = bookingDetails2(
                booking_id=bid,
                extension=extraduration,
                ext_amount=extamount,
                damage_amount=damage,
                total_fine=totalfine,
                is_fine=isfine,
                is_returned=1,
                is_active=0,
                earnings=earnings,
                balance_amount=bamount,
                security_amount=10000,
                return_date=str(returndate),
            )
            update.save(
                update_fields=["is_active", "is_returned", "security_amount", "is_fine", "fine_amount", "extension",
                               "ext_amount", "damage_amount", "total_fine", "balance_amount", "return_date","earnings"])
            vehicleInfo.objects.filter(vehicle_id=data.vehicle_id_id).update(isactive=1)
            return redirect("/user/index")

        return render(request, "returnvehiclepage.html", {"book": data1})
       else:
           return render(request,"return_done_all.html")

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def orders(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        if request.method == "POST":
            bookingformUpdate()
        return render(request, "your_orders.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def confirmbooking(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        vehicle_id = request.session["vehicle_id"]
        data = vehicleInfo.objects.get(vehicle_id=vehicle_id)
        if request.method == "POST":
            return redirect("/user/document/")
        return render(request,"confirmbooking.html",{"view":data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return redirect("/user/login/")

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


def eligibilty(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        return render(request,"eligibilty.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def document(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        email = request.session["email"]
        data1 = UserInfo.objects.get(email=email)
        data = UserRole.objects.all()
        if request.method == "POST":
            user_image17 = None
            if request.FILES:
                myfile = request.FILES["user_image17"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image17 = fs.url(filename)
                user_image17 = myfile.name

            form = UploaduserdocumentForm(request.POST)
            f = form.save(commit=False)
            f.ulicense = user_image17
            f.uemail_id=email
            f.ulicense_no=request.POST["mlnumber"]
            f.usecdocument = 0
            f.ulivephoto = 0
            f.usecondary_name = 0
            f.usecondary_id_no = 0
            f.save()

            return redirect("/user/document2/")

        return render(request, "document.html", {"profile": data1, "roledata": data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return HttpResponse("Login First")


def document2(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        email = request.session["email"]
        data1 = UserInfo.objects.get(email=email)

        data = UserRole.objects.all()

        if request.method == "POST":
            dname=request.POST["documentname"]
            dnumber = request.POST["dnumber"]
            user_image18 = None
            if request.FILES:
                myfile = request.FILES["user_image18"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image18 = fs.url(filename)
                user_image18 = myfile.name
            form = UploaduserdocumentForm(request.POST)
            f = form.save(commit=False)
            f.usecdocument = user_image18
            f.uemail_id = email
            f.usecondary_name=dname
            f.usecondary_id_no=dnumber
            f.ulivephoto = 0
            f.save()

            return redirect("/user/document3/")

        return render(request, "document2.html", {"profile": data1, "roledata": data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return HttpResponse("Login First")

def document3(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        email = request.session["email"]
        data1 = UserInfo.objects.get(email=email)

        data = UserRole.objects.all()

        if request.method == "POST":

            user_image19 = None
            if request.FILES:
                myfile = request.FILES["user_image19"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image19 = fs.url(filename)
                user_image19 = myfile.name

            form = UploaduserdocumentForm(request.POST)
            f = form.save(commit=False)
            f.ulivephoto = user_image19
            f.uemail_id = email



            f.save()

            return redirect("/payment_process/")

        return render(request, "document3.html", {"profile": data1, "roledata": data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
    return HttpResponse("Login First")


def profile(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        email = request.session["email"]
        data1 = UserInfo.objects.get(email=email)

        data=UserRole.objects.all()

        if request.method=="POST":
            roleid_id = request.POST["role"]
            email = request.POST["email"]
            username = request.POST["name"]
            mobile = request.POST["mobile"]
            city = request.POST["city"]
            address = request.POST["address"]
            user_image = data1.vehicle_image1
            if request.FILES:
                myfile = request.FILES["user_image"]
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                user_image = fs.url(filename)
                user_image = myfile.name
            update = UserInfo(
                email=email,
                roleid_id=roleid_id,
                username=username,
                city=city,
                mobile=mobile,
                address=address,
                vehicle_image1=user_image,
            )
            update.save(update_fields=["username", "mobile","vehicle_image1", "city","address"])
            return redirect("/user/account/")

        return render(request, "profile.html", {"profile": data1,"roledata":data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def codriver(request):
    roleid=request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:

        email = request.session["email"]
        data1 = UserInfo.objects.get(email=email)

        data = UserRole.objects.all()

        if request.method == "POST":
            coemail = request.POST["cdemail"]
            update = UserInfo(
                email=email,
                codriver=coemail,

            )
            update.save(
                update_fields=["codriver"])
            return redirect("/user/codriver/")

        return render(request, "Co driver.html", {"profile": data1, "roledata": data})

    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def mybooking(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
        return render(request,"mybooking.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def cancel(request):
    roleid = request.session["role"]

    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
       email = request.session["email"]
       bid = request.GET["booking_id"]
       data1 = bookingDetails2.objects.filter(email_id=email)

       data = bookingDetails2.objects.get(booking_id=bid)
       is_active = data.is_active
       return_date=data.return_date
       if is_active == 1 and return_date=="":

        if request.method == "POST":
                data = bookingDetails2.objects.get(booking_id=bid)
                format = '%m/%d/%Y %H:%M %p'
                data6 = data.end_date
                total = data.total
                amountexp = data.amount_exp
                endday = datetime.strptime(data6, format)
                today = datetime.today()
                returndate = today.strftime("%m/%d/%Y %H:%M %p")
                retday = datetime.strptime(returndate, format)
                extraduration = retday - endday
                isfine = 0
                security_amount = data.security_amount
                exp=data.amount_exp
                fine_amount = 0
                total_fine = 0
                id=data.booking_id
                n = random.randint(1000, 8000)
                cancel_token = str(n) + str(id)
                if int(str(extraduration)[0:2]) < 0:
                    edays, eminutes = extraduration.days, extraduration.seconds
                    ehrs = edays * 24 + eminutes // 3600
                    if ehrs > 10:
                        fine_amount = 3000
                        totalfine = int(fine_amount)
                        total1 = int(totalfine)
                        bamount = (int(security_amount) - int(total1))
                        earnings = int(total1)+int(exp)
                        is_fine=1
                    else:
                        fine_amount = 0
                        totalfine = 0
                        total = 0
                        bamount = int(security_amount)
                        earnings = 0
                        is_fine=0
                else:
                    return HttpResponse("No cancellation option available")
                today = datetime.today()

                refund=total
                update = bookingDetails2(
                    booking_id=bid,
                    refunded=refund,
                    return_date=retday,
                    is_returned=1,
                    is_active=0,
                    fine_amount=fine_amount,
                    total_fine=totalfine,
                    is_fine=isfine,
                    cancel_token=str(cancel_token),
                    earnings=earnings,
                    total=total,
                    balance_amount=bamount,
                    cancellation_time= str(returndate),
                    extension=0,
                    ext_amount=0,
                    damage_amount=0,
                )
                update.save(
                    update_fields=["refunded", "is_active", "is_returned", "security_amount", "is_fine","fine_amount", "total_fine", "balance_amount",
                                   "cancellation_time","extension","ext_amount","damage_amount","total","earnings","cancel_token"])
                vehicleInfo.objects.filter(vehicle_id=data.vehicle_id_id).update(isactive=1)
                return redirect("/user/index/")

        return render(request, "cancel.html", {"book": data1})
       else:
           return render(request, "cancel_done_all.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def canceluser_only(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
      email = request.session["email"]
      bid = request.GET["booking_id"]
      data1 = bookingDetails2.objects.filter(email=email)
      data = bookingDetails2.objects.get(booking_id=bid)
      is_active = data.is_active
      return_date=data.return_date
      if is_active==1 and return_date=="":
        if request.method == "POST":

                data = bookingDetails2.objects.get(booking_id=bid)
                format = '%m/%d/%Y %H:%M %p'
                data6 = data.end_date

                total = data.total
                amountexp = data.amount_exp
                endday = datetime.strptime(data6, format)
                today = datetime.today()
                returndate = today.strftime("%m/%d/%Y %H:%M %p")
                retday = datetime.strptime(returndate, format)
                extraduration = retday - endday
                isfine = 0
                security_amount = data.security_amount
                exp=data.amount_exp
                fine_amount = 0
                total_fine = 0
                id=data.booking_id
                n = random.randint(1000, 8000)
                cancel_token = str(n) + str(id)
                if int(str(extraduration)[0:2]) < 0:
                    edays, eminutes = extraduration.days, extraduration.seconds
                    ehrs = edays * 24 + eminutes // 3600
                    if ehrs > 10:
                        fine_amount = 3000
                        totalfine = int(fine_amount)
                        total1 = int(totalfine)
                        bamount = (int(security_amount) - int(total1))
                        earnings = int(total1)+int(exp)
                        is_fine=1
                    else:
                        fine_amount = 0
                        totalfine = 0
                        total = 0
                        bamount = security_amount
                        earnings = 0
                        is_fine=0
                else:
                    return HttpResponse("No cancellation option available")
                today = datetime.today()

                refund=total
                update = bookingDetails2(
                    booking_id=bid,
                    refunded=refund,
                    return_date=retday,
                    is_returned=1,
                    is_active=0,
                    fine_amount=fine_amount,
                    total_fine=totalfine,
                    is_fine=isfine,
                    cancel_token=str(cancel_token),
                    earnings=earnings,
                    total=total,
                    balance_amount=bamount,
                    cancellation_time= str(returndate),
                    extension=0,
                    ext_amount=0,
                    damage_amount=0,
                )
                update.save(
                    update_fields=["refunded", "is_active", "is_returned", "security_amount", "is_fine","fine_amount", "total_fine", "balance_amount",
                                   "cancellation_time","extension","ext_amount","damage_amount","total","earnings","cancel_token"])
                vehicleInfo.objects.filter(vehicle_id=data.vehicle_id_id).update(isactive=1)
                return redirect("/user/index/")

        return render(request, "cancel.html", {"book": data1})
      else:
          return render(request, "cancel_done_all.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')



def returnvehicle_only(request):
    email = request.session["email"]
    roleid = request.session["role"]
    data1=bookingDetails2.objects.filter(email_id=email)
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
      bid = request.GET["booking_id"]
      data = bookingDetails2.objects.get(booking_id=bid)
      is_active=data.is_active
      cancellation_time=data.cancellation_time
      if is_active == 1 and cancellation_time=="":
        if request.method == "POST":

            data=bookingDetails2.objects.get(booking_id=bid)
            damage = request.POST["damage"]

            if damage == "0":
                damage = 500
            elif damage == "1":
                damage = 1000
            elif damage == "2":
                damage = 2000
            else:
                damage = "after_analysis"

            format = '%m/%d/%Y %H:%M %p'
            data6 = data.end_date
            amountexp = data.amount_exp
            endday = datetime.strptime(data6, format)
            today = datetime.today()
            returndate = today.strftime("%m/%d/%Y %H:%M %p")
            retday = datetime.strptime(returndate, format)
            extraduration = retday - endday
            isfine = 0
            total = data.total
            security_amount=data.security_amount
            extamount = 0
            totalfine = 0
            if int(str(extraduration)[0:2]) > 0:
                edays, eminutes = extraduration.days, extraduration.seconds
                ehrs = edays * 24 + eminutes // 3600
                extamount = int(ehrs) * int('250')
                totalfine = int(extamount) + int(damage)
                total1 = int(amountexp) + int(totalfine)
                bamount = (int(security_amount) - int(totalfine))
                earnings=int(total1)
            else:
                total1 = int(damage)
                bamount = (int(security_amount) - int(total1))
                earnings = int(total1)+int(amountexp)
            today = datetime.today()

            update = bookingDetails2(
                booking_id=bid,
                extension=extraduration,
                ext_amount=extamount,
                damage_amount=damage,
                total_fine=totalfine,
                is_fine=isfine,
                is_returned=1,
                is_active=0,
                earnings=earnings,
                balance_amount=bamount,
                security_amount=10000,
                return_date=str(returndate),
            )


            update.save(
                update_fields=["is_active", "is_returned", "security_amount", "is_fine", "fine_amount", "extension",
                               "ext_amount", "damage_amount", "total_fine", "balance_amount", "return_date","earnings"])
            vehicleInfo.objects.filter(vehicle_id=data.vehicle_id_id).update(isactive=1)
            return redirect("/user/index")

        return render(request, "returnvehiclepage.html", {"book": data1})
      else:
         return render(request, "return_done_all.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def ubookings_all_only(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 2)
    if auth == True:
       email=request.session["email"]
       data = bookingDetails2.objects.filter(email_id=email)

       return render(request, "userbookingsonly.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def ubookings_active_only(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 2)
    if auth == True:
           email = request.session["email"]
           data = bookingDetails2.objects.filter(earnings="",email_id=email)
           return render(request, "userbookingsonly.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def ubookings_cancel_only(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'],2)
    if auth == True:
        email = request.session["email"]
        data = bookingDetails2.objects.filter(is_active=0,return_date="",email_id=email)
        return render(request, "userbookingsonly.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def ubookings_completed_only(request):
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], 2)
    if auth == True:
        email = request.session["email"]
        data = bookingDetails2.objects.filter(cancellation_time="",is_active=0,email_id=email)
        return render(request, "userbookingsonly.html", {"booking": data})
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')

def password_update_success(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
         return render(request, "password_update_success.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')
def signup_data_saved(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
         return render(request, "signup_data_saved.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')


def password_update_unsuccess(request):
    roleid = request.session["role"]
    auth = authorize.authorize(request.session['Authentication'], request.session['role'], roleid)
    if auth == True:
         return render(request, "password_update_unsuccess.html")
    else:
        aut, msg = auth
        if msg == 'wrongUser':
            return HttpResponse("WrongUSer")
        elif msg == 'notLogin':
            return HttpResponse('Login first')