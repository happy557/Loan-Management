"""LoanManagement URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
from LoanApp import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index),
    path('login/',views.signin),
    path('login_action/', views.sign_in_process),
    path('Customer_register/',views.Customer_register),
    path('save_user/', views.action_save_user),
    path('check_username/', views.check_username, name='check_username'),
    path('emi_calculation/',views.emi_calculation_frm),
    path('admin_home/',views.admin_home),
    path('admin_logout/', views.admin_logout),
    path('Emi_calculator/',views.Emi_calculator),
    path('loan/',views.loan),
#appove Customer
    path('approve_customer/',views.approve_customer),
    path('approve_customer_status/<int:id>',views.approve_customer_status),
    path('reject_customer_status/<int:id>',views.reject_customer_status),
    path('customers_list/',views.customers_list),
#loan
    path('home_loan_schemes/',views.home_loan_schemes),
    path('add_home_loan/',views.add_home_loan),
    path('home_loan_shemes_list/',views.home_loan_shemes_list),
    path('edit_home_loan/<int:id>',views.edit_home_loan),
    path('update_home_loan/<int:id>',views.update_home_loan),
    path('delete_home_loan/<int:id>',views.delete_home_loan),
#Education_loan_schemes
    path('Education_loan_schemes/',views.Education_loan_schemes),
    path('add_education_loan/',views.add_education_loan),
    path('Education_shemes_list/',views.Education_shemes_list),
#vehicle_loan_schemes
    path('vehicle_loan_schemes/',views.vehicle_loan_schemes),
    path('add_vehicle_loan/',views.add_vehicle_loan),
    path('vehicle_shemes_list/',views.vehicle_shemes_list),
#Personal_loan_schemes
    path('Personal_loan_schemes/',views.Personal_loan_schemes),
    path('add_personal_loan/',views.add_personal_loan),
    path('Personal_schemes_list/',views.Personal_schemes_list),
    # path('sms/',views.sms),
#Customer
    path('Customer/',views.Customer),
#home
    path('education_loan_cust/',views.education_loan_cust),
    path('vehicle_loan_cust/',views.vehicle_loan_cust),
    path('home_loan_cust/',views.home_loan_cust),
    path('personal_loan_cust/',views.personal_loan_cust),
#customer

    path('User_Logout/', views.User_Logout),
#Home Loan Customer
    path('apply_home_loan/',views.apply_home_loan),
    path('save_homeloan/',views.save_homeloan),
    path('home_loan_status/',views.home_loan_status),

    path('apply_education_loan/',views.apply_education_loan),
    path('save_edu_loan/',views.save_education_loan),
    path('education_loan_status/',views.education_loan_status),



    path('apply_personal_loan/',views.apply_personal_loan),
    path('save_personal_loan/',views.save_personal_loan),
    path('personal_loan_status/',views.personal_loan_status),

    path('apply_vehicle_loan/',views.apply_vehicle_loan),
    path('save_vehicle_loan/',views.save_vehicle_loan),
    path('vehicle_loan_status/',views.vehicle_loan_status),

    path('other_info/',views.other_info),
    path('save_personal/',views.add_other_info),
    path('complaint/',views.complaint),
    path('save_complaint/',views.save_complaint),
    path('Complaint_list/',views.Complaint_list),

# Profile
path('profile/', views.profile),
path('change_password/', views.change_password),
path('update_password/', views.update_password),

# admin - Loan appl
path('home_loan_appl/',views.home_loan_appl),
path('education_loan_appl/',views.education_loan_appl),
path('vehicle_loan_appl/',views.vehicle_loan_appl),
path('personal_loan_appl/',views.personal_loan_appl),
path('view_applicant_personal_details/<int:id>',views.view_applicant_personal_details),


path('reject_home_loan/<int:id>',views.reject_home_loan),
path('approve_home_loan/<int:id>',views.approve_home_loan),
path('display_home_rate/', views.display_home_rate, name='display_home_rate'),
path('allow_home_loan/<int:id>',views.allow_home_loan),
path('allowed_home_loan_appl/',views.allowed_home_loan_appl),
path('emi_home_loan/<int:id>',views.emi_home_loan),

path('reject_education_loan/<int:id>',views.reject_education_loan),
path('approve_education_loan/<int:id>',views.approve_education_loan),
path('display_edu_rate/', views.display_edu_rate, name='display_edu_rate'),
path('allow_edu_loan/<int:id>',views.allow_edu_loan),
path('allowed_education_loan_appl/',views.allowed_education_loan_appl),
path('emi_edu_loan/<int:id>',views.emi_edu_loan),


path('reject_vehicle_loan/<int:id>',views.reject_vehicle_loan),
path('approve_vehicle_loan/<int:id>',views.approve_vehicle_loan),
path('display_veh_rate/', views.display_veh_rate, name='display_veh_rate'),
path('allow_vehicle_loan/<int:id>',views.allow_vehicle_loan),
path('allowed_vehicle_loan_appl/',views.allowed_vehicle_loan_appl),
path('emi_veh_loan/<int:id>',views.emi_veh_loan),



path('reject_personal_loan/<int:id>',views.reject_personal_loan),
path('approve_personal_loan/<int:id>',views.approve_personal_loan),
path('display_per_rate/', views.display_per_rate, name='display_per_rate'),
path('allow_personal_loan/<int:id>',views.allow_personal_loan),
path('allowed_personal_loan_appl/',views.allowed_personal_loan_appl),
path('emi_personal_loan/<int:id>',views.emi_personal_loan),


path('view_complaints/',views.view_complaints),
path('adm_reply_complaint/<int:id>', views.adm_reply_complaint),
path('add_reply/<int:id>', views.add_reply),
path('replied_list/', views.replied_list),
#User


path('activate_home_loan/<int:id>', views.activate_home_loan),
path('activate_edu_loan/<int:id>', views.activate_edu_loan),
path('activate_personal_loan/<int:id>', views.activate_personal_loan),
path('activate_veh_loan/<int:id>', views.activate_veh_loan),


path('repayment_home_loan/<int:id>', views.repayment_home_loan),
path('repayment_edu_loan/<int:id>', views.repayment_edu_loan),
path('repayment_personal_loan/<int:id>', views.repayment_personal_loan),
path('repayment_veh_loan/<int:id>', views.repayment_veh_loan),

path('Amortization/',views.Amortization),

path('cust_repayment_home_loan/<int:id>', views.cust_repayment_home_loan),
path('cust_repayment_edu_loan/<int:id>', views.cust_repayment_edu_loan),
path('cust_repayment_personal_loan/<int:id>', views.cust_repayment_personal_loan),
path('cust_repayment_vehicle_loan/<int:id>', views.cust_repayment_vehicle_loan),


]
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)