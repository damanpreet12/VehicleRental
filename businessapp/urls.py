from django.conf.urls import url
from businessapp import views
app_name='businessapp'
urlpatterns = [
    url(r'^businessindex/$',views.index),
    url(r'^businessdashboard/$',views.businessdashboard),
    url(r'^businessaddvehicle/$',views.businessaddvehicle),
    url(r'^manager_vehicles/$',views.manager_vehicle),
    url(r'^businessaccount_vehicles/$',views.businessaccount_vehicle),
    url(r'^business_updatevehicles/$', views.business_updatevehicles),
    url(r'^business_vehicledelete/$', views.business_vehicledelete),
]
