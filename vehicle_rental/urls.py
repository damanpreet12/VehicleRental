"""vehicle_rental URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin

from django.urls import path
from django.conf.urls import url,include    #for including to other file
from userapp import views
from django.conf.urls.static import static
from django.conf import settings
from userapp import views as api_views
from django.views.generic import TemplateView
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^user/',include('userapp.urls')),
    url(r'^manager/',include('managerapp.urls')),
    url(r'^business/', include('businessapp.urls')),
    url(r'^verifyuser/$',views.verifyuser),
    url(r'^$',views.index),
    url(r'^',include('social_django.urls',namespace='social')),
    url(r'^paypal/',include('paypal.standard.ipn.urls')),
    url(r'^payment_process/$', api_views.paymentprocess,
          name='payment_process'),

    url(r'^payment_done/$',
          TemplateView.as_view(
              template_name="payment_done.html"),
          name='payment_done'),

    url(r'^payment_canceled/$',
          TemplateView.as_view(
              template_name="payment_canceled.html"),
          name='payment_canceled'),

    # url(r'^mpayment_process/$', api_views.mpaymentprocess,
    #       name='payment_process'),
    #
    # url(r'^mpayment_done/$',
    #       TemplateView.as_view(
    #           template_name="payment_done.html"),
    #       name='payment_done'),
    #
    # url(r'^mpayment_canceled/$',
    #       TemplateView.as_view(
    #           template_name="payment_canceled.html"),
    #       name='payment_canceled')

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
LOGIN_URL = 'login'
LOGOUT_URL = 'logout'
LOGIN_REDIRECT_URL = 'home'
