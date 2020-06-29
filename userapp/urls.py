from django.conf.urls import url
from userapp import views
app_name='userapp'
urlpatterns = [
    url(r'^index/$',views.index),
    url(r'^signup/$',views.signup),
    url(r'^usermaster/$',views.usmaster),
    url(r'^login/',views.login),
    url(r'^verification/$',views.verifyuser),
    url(r'^updatepass/$',views.passwordUpdate),
    url(r'^forget/$',views.forget),
    url(r'^adminmaster/$',views.adminmaster),
    url(r'^logout/$',views.logout),
    url(r'^bookingform/$',views.bookingform),

    url(r'^returnvehicle/$',views.bookingformUpdate),
    url(r'^returnvehicleuser/$',views.returnvehicle_only),
    url(r'^cards/$',views.vehiclecards),
    url(r'^userindex/$',views.userindex),
    url(r'^indexmaster/$',views.indexMaster),
    url(r'^profile/$',views.profile),
    url(r'^account/$',views.useraccount),
    url(r'^scooter/$', views.scooter),
    url(r'^cars/$', views.cars),
    url(r'^bikes/$', views.bikes),
    url(r'^carcategory/$', views.carcategory),
    url(r'^scootercategory/$', views.scootercategory),
    url(r'^bikecategory/$', views.bikecategory),
    url(r'^viewcard/$',views.viewcard),

    url(r'^orders/$',views.orders),
    url(r'^confirmbooking/$',views.confirmbooking),

    url(r'^policy/$',views.policy),
    url(r'^eligibility/$',views.eligibilty),
    url(r'^document/$',views.document),
    url(r'^document2/$',views.document2),
    url(r'^document3/$',views.document3),
    url(r'^codriver/$',views.codriver),
    url(r'^mybooking/$',views.mybooking),

    url(r'^cancel/$', views.cancel),
    url(r'^canceluser/$', views.canceluser_only),
    url(r'^ubookingsonly_all/$', views.ubookings_all_only),
    url(r'^ubookingsonly_active/$', views.ubookings_active_only),

    url(r'^ubookingsonly_cancel/$', views.ubookings_cancel_only),

    url(r'^ubookingsonly_completed/$', views.ubookings_completed_only),
    url(r'^password__update_success/$', views.password_update_success),
    url(r'^signup_data_saved/$', views.signup_data_saved),
    url(r'^password__update_unsuccess/$', views.password_update_unsuccess),

]