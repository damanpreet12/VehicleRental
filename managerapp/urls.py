from django.conf.urls import url
from managerapp import views
app_name='managerapp'
urlpatterns = [
    url(r'^dashboard/$',views.dashboard),
    url(r'^cars/$',views.managercars),
    url(r'^bikes/$',views.managerbikes),
    url(r'^scooty/$',views.managerscooty),
    url(r'^catalog/$',views.managercatalog),
    url(r'^category/$',views.vehicleCategory),
    url(r'^viewcategory/$',views.viewCategory),
    url(r'^delete/$',views.delete),
    url(r'^updatecategory/$',views.updatecategory),
    url(r'^subcategory/$',views.subcategory),
    url(r'^viewsubcategory/$',views.viewSubCategory),
    url(r'^subcatdelete/$', views.subcatdelete),
    url(r'^company/$', views.vehiclecompany),
    url(r'^updatesubcategory/$',views.updateSubCategory),
    url(r'^updatecity/$',views.updatecity),
    url(r'^viewcompany/$',views.viewcompany),
    url(r'^viewcity/$',views.viewcity),
    url(r'^companydelete/$',views.companydelete),
    url(r'^citydelete/$',views.citydelete),
    url(r'^catalogdelete/$',views.catalogdelete),
    url(r'^updatecompany/$',views.updatecompany),
    url(r'^viewcatalog/$',views.viewcatalog),
    url(r'^catalogdelete/$',views.catalogdelete),
    url(r'^updatecatalog/$',views.updatecatalog),
    url(r'^city/$',views.city),
    url(r'^mbookings_all/$', views.mbookings_all),
    url(r'^ubookings_all/$', views.ubookings_all),
    url(r'^ubookings_active/$', views.ubookings_active),
    url(r'^mbookings_active/$', views.mbookings_active),
    url(r'^ubookings_cancel/$', views.ubookings_cancel),
    url(r'^mbookings_cancel/$', views.mbookings_cancel),
    url(r'^ubookings_completed/$', views.ubookings_completed),
    url(r'^mbookings_completed/$', views.mbookings_completed),
    url(r'^policy/$',views.policy),
    url(r'^cancel_done/$',views.cancel_done_all),
    url(r'^return_done/$',views.return_done_all),




]