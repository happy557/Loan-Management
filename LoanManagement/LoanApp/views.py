from datetime import date, datetime, timedelta
from django.db import connection
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render,redirect
import pandas as  pd
from django.contrib import messages
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password
from django.contrib.auth import logout
from LoanApp.models import login,user_register,home_loan,education_loan,vehicle_loan,personal_loan,application_home_loan,application_education_loan,application_personal_loan,application_vehicle_loan,complaints,loan_payment
from django.db.models import Q
import os
from django.conf import settings
from django.core.files.storage import FileSystemStorage
# import requests
# Create your views here.
def index(request):
    return render(request,'index.html')
def signin(request):
    return render(request,'signin.html')
def sign_in_process(request):
    u=request.POST.get("username")
    p=request.POST.get("password")
    obj=authenticate(username=u,password=p)
    if obj is not None:
        if obj.is_superuser == 1:
            request.session['suname'] = u
            request.session['slogid'] = obj.id
            return redirect('/admin_home/')
        else:
          messages.add_message(request, messages.INFO, 'Invalid User.')
          return redirect('/login/')
    else:
        newp=make_password(p,salt='mySalt')
        try:
            obj1=login.objects.get(username=u,password=newp)

            if obj1.Usertype=="User":
                if(obj1.status=="Approved"):
                    request.session['suname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('/Customer/')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('/login/')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('/login/')

            else:
                 messages.add_message(request, messages.INFO, 'Invalid User.')
                 return redirect('/login/')
        except login.DoesNotExist:
         messages.add_message(request, messages.INFO, 'Invalid User.')
         return redirect('/login/')
def admin_home(request):
    if 'suname' in request.session:
     return render(request,'Site_Admin/index.html')
    else:
      return redirect('/login/')
#User
def Customer(request):
 if 'suname' in request.session:
    return render(request,'Customer/index.html')
 else:
      return redirect('/login/')
def Customer_register(request):
    return render(request,'customer_registration.html')
def action_save_user(request):
    tbl1=login()
    username=request.POST.get("username")
    tbl1.username=request.POST.get("username")
    password=make_password(request.POST.get("password"),salt='mySalt')
    tbl1.password=password
    tbl1.Usertype="User"
    tbl1.status="Approved"
    tbl1.save()
    obj=login.objects.get(username=username,password=password)

    u=user_register()
    u.login_id = obj.login_id
    u.firstname=request.POST.get("firstname")
    u.lastname=request.POST.get("lastname")
    u.phone_number =request.POST.get("phone")
    u.address=request.POST.get("address")
    u.mail_id=request.POST.get("mail_id")
    # PHOTO UPLOAD
    photo=request.FILES['photo']
    split_tup = os.path.splitext(photo.name)
    file_extension = split_tup[1]
    dir_path = settings.MEDIA_ROOT
    count = 0
    for path in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, path)):
            count += 1
    filecount=count+1
    filename=str(filecount)+"."+file_extension
    obj=FileSystemStorage()
    file=obj.save(filename,photo)
    url1=obj.url(file)
    # Addar
    adhaar_card=request.FILES['adhaar_card']
    split_tup2 = os.path.splitext(adhaar_card.name)
    file_extension2 = split_tup2[1]
    # folder path
    dir_path2 = settings.MEDIA_ROOT
    count2 = 0
    # Iterate directory
    for path in os.listdir(dir_path2):
    # check if current path is a file
        if os.path.isfile(os.path.join(dir_path2, path)):
            count2 += 1
    filecount2=count2+1
    filename2=str(filecount2)+"."+file_extension2
    obj2=FileSystemStorage()
    file2=obj2.save(filename2,adhaar_card)
    url2=obj2.url(file2)
    u.identity_proof=url2
    u.photo=url1
    u.save()
    messages.add_message(request, messages.INFO, 'Registered successfully.')
    return redirect('/Customer_register/')
def check_username(request):
    username = request.GET.get("username")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):
        data["success"]="Available"

    return JsonResponse(data)
def emi_calculation_frm(request):
     return render(request,'emi_calculation_frm.html')
def Emi_calculator(request):

    principal=float(request.POST.get("pa"))
    apr=float(request.POST.get("apr"))
    term_remaining=float(request.POST.get("trm"))
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    data=main(principal, term_remaining, monthly_payment, mpr)
    mydict = {
        "df": data.to_html()
    }
    return render(request,'emi_calculator.html', context=mydict)
def loan(request):
    return render(request,'loan.html')
def make_payment(principal, mpr, monthly_payment):
    '''Makes a 'payment' by subtracting and updated payment amount from the
    principal. Returns the principal remaining, and the amount of principal and interest paid
    '''

    current_interest_payment = principal * mpr
    current_principal_payment = monthly_payment - current_interest_payment

    principal -= current_principal_payment

    return [round(principal, 2), round(current_principal_payment, 2), round(current_interest_payment, 2)]

def main(principal, term_remaining, monthly_payment, mpr):
    '''Returns an Amortization Table in the form of a DataFrame
    '''

    payments = [[principal, 0, 0, 0]]
    total_interest = 0
    totemi=0
    while principal > 0 and term_remaining > 0:
        payment = make_payment(principal, mpr, monthly_payment)
        principal = payment[0]
        term_remaining -= 1
        total_interest += payment[2]
        totemi=payment[1]+payment[2]
        payment.append(total_interest)
        payment.append(totemi)
        payments.append(payment)

    amortization_table = pd.DataFrame(data=payments,
                                      columns=['Principal Remaining',
                                              'Current Principal Payment',
                                              'Current Interest Payment',
                                              'Total Interest Paid','EMI'])
    return amortization_table
#logout

def admin_logout(request):
    logout(request)
    return redirect('/login/')
#admin
def approve_customer(request):
    logQuerry = login.objects.filter(status='Not Approved').only('login_id').all()
    ste = user_register.objects.filter(login_id__in = logQuerry)
    return render(request,'Site_Admin/approvel_customer.html',{'data':ste})
def approve_customer_status(request,id):
    if 'suname' in request.session:
        tbl=login.objects.get(login_id=id)
        tbl.status="Approved"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/approve_customer/')
    else:
       return redirect('/login')
def reject_customer_status(request,id):
    if 'suname' in request.session:
        tbl=login.objects.get(login_id=id)
        tbl.status="Rejected"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/approve_customer/')
    else:
       return redirect('/login')
def customers_list(request):
    logQuerry = login.objects.filter(status='Approved').only('login_id').all()
    ste = user_register.objects.filter(login_id__in = logQuerry)
    return render(request,'Site_Admin/approved_customer.html',{'data':ste})
def home_loan_schemes(request):
    if 'suname' in request.session:
      return render(request,'Site_Admin/home_loan_schemes.html')
    else:
       return redirect('/login/')
def add_home_loan(request):
    if 'suname' in request.session:
        c=request.POST.get("cibil_score")
        if(home_loan.objects.filter(cibil_score=c).exists()):
            messages.add_message(request, messages.ERROR, 'Already Exist. ')
            return redirect('/home_loan_schemes/')
        else:
            tbl=home_loan()
            tbl.cibil_score=c
            tbl.rate=request.POST.get("Rate")
            tbl.save()
            messages.add_message(request, messages.INFO, 'Added successfully.')
            return redirect('/home_loan_schemes/')
    else:
       return redirect('/login/')
def home_loan_shemes_list(request):
     if 'suname' in request.session:

        data1 = home_loan.objects.all()
        return render(request,'Site_Admin/home_loan_shemes_list.html',{'data1':data1})
     else:
       return redirect('/login')
def edit_home_loan(request,id):
     data1 = home_loan.objects.get(home_loan_id=id)
     return render(request,'Site_Admin/home_loan_schemes_edit.html',{'data':data1})
def update_home_loan(request,id):
    if 'suname' in request.session:
        tbl=home_loan.objects.get(home_loan_id=id)
        tbl.cibil_score=request.POST.get("cibil_score")
        tbl.rate=request.POST.get("Rate")
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/home_loan_schemes/')
    else:
       return redirect('/login/')
def delete_home_loan(request,id):
    if 'suname' in request.session:
        tbl=home_loan.objects.get(home_loan_id=id)
        tbl.delete()
        messages.add_message(request, messages.INFO, 'Deleted successfully.')
        return redirect('/home_loan_shemes_list/')
    else:
       return redirect('/login')
def Education_loan_schemes(request):
    if 'suname' in request.session:
      return render(request,'Site_Admin/Education_loan_schemes.html')
    else:
       return redirect('/login/')
def add_education_loan(request):
    if 'suname' in request.session:
        l=request.POST.get("loanlimit")
        if(education_loan.objects.filter(loan_limit=l).exists()):
            messages.add_message(request, messages.INFO, 'Already Exist. ')
            return redirect('/Education_loan_schemes/')
        else:
            tbl=education_loan()
            tbl.loan_limit=l
            tbl.rate=request.POST.get("Rate")
            tbl.save()
            messages.add_message(request, messages.INFO, 'Added successfully.')
            return redirect('/Education_loan_schemes/')
    else:
       return redirect('/login/')
def Education_shemes_list(request):
    if 'suname' in request.session:
      data1 = education_loan.objects.all()
      return render(request,'Site_Admin/Education_shemes_list.html',{'data1':data1})
    else:
       return redirect('/login/')
def vehicle_loan_schemes(request):
    if 'suname' in request.session:
      return render(request,'Site_Admin/Vehicle_loan_schemes.html')
    else:
       return redirect('/login/')
def add_vehicle_loan(request):
    if 'suname' in request.session:
        c=request.POST.get("cibil_score")
        v=request.POST.get("vehicle_type")
        if(vehicle_loan.objects.filter(cibil_score=c,vehicle_type=v).exists()):
            messages.add_message(request, messages.INFO, 'Already Exist. ')
            return redirect('/vehicle_loan_schemes/')
        else:
            tbl=vehicle_loan()
            tbl.cibil_score=c
            tbl.vehicle_type=v
            tbl.rate=request.POST.get("Rate")
            tbl.save()
            messages.add_message(request, messages.INFO, 'Added successfully.')
            return redirect('/vehicle_loan_schemes/')
    else:
       return redirect('/login/')
def vehicle_shemes_list(request):
    if 'suname' in request.session:
      data1 = vehicle_loan.objects.all()
      return render(request,'Site_Admin/vehicle_shemes_list.html',{'data1':data1})
    else:
       return redirect('/login/')
def Personal_loan_schemes(request):
    if 'suname' in request.session:
      return render(request,'Site_Admin/Personal_loan_schemes.html')
    else:
       return redirect('/login/')
def add_personal_loan(request):
    if 'suname' in request.session:
        c=request.POST.get("cibil_score")
        if(personal_loan.objects.filter(cibil_score=c).exists()):
            messages.add_message(request, messages.INFO, 'Already Exist. ')
            return redirect('/Personal_loan_schemes/')
        else:
            tbl=personal_loan()
            tbl.cibil_score=c
            tbl.loan_limit=request.POST.get("loan_limit")
            tbl.Tenure=request.POST.get("tenure")
            tbl.rate=request.POST.get("Rate")
            tbl.save()
            messages.add_message(request, messages.INFO, 'Added successfully.')
            return redirect('/Personal_loan_schemes/')
    else:
       return redirect('/login/')
def Personal_schemes_list(request):
    if 'suname' in request.session:
      data1 = personal_loan.objects.all()
      return render(request,'Site_Admin/personal_loan_schemes_list.html',{'data1':data1})
    else:
       return redirect('/login/')
def education_loan_cust(request):
      data1 = education_loan.objects.all()
      data="hello"
      return render(request,'Education_shemes_list.html',{'data1':data1,'data':data})
def vehicle_loan_cust(request):
      data1 = vehicle_loan.objects.all()
      return render(request,'vehicle_shemes_list.html',{'data1':data1})
def home_loan_cust(request):
      data1 = home_loan.objects.all()
      return render(request,'home_shemes_list.html',{'data1':data1})
def personal_loan_cust(request):
      data1 = personal_loan.objects.all()
      return render(request,'personal_shemes_list.html',{'data1':data1})
def User_Logout(request):
    logout(request)
    request.session.delete()
    return redirect('/login/')
def apply_home_loan(request):
    if 'suname' in request.session:

      return render(request,'Customer/apply_home_loan.html')
    else:
       return redirect('/login/')

def other_info(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        check=0
        if(user_register.objects.filter(login_id=id,status='Updated').exists()):
            check=1
        return render(request,'Customer/other_info.html',{'check':check})
    else:
       return redirect('/login/')
def add_other_info(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        u=user_register.objects.get(login_id=id)
        u.gender=request.POST.get("gender")
        u.marital_status=request.POST.get("marital_status")
        u.dob=request.POST.get("dob")
        u.spouse =request.POST.get("spouse")
        u.no_dependents=request.POST.get("no_dependents")
        u.no_childen=request.POST.get("no_childen")
        u.caste_category=request.POST.get("category")
        u.nationality=request.POST.get("nationality")
        u.residential_status=request.POST.get("residential_status")
        u.place_of_birth=request.POST.get("place_of_birth")
        u.pan_no=request.POST.get("pan_card")
        u.highest_qualification=request.POST.get("highest_qualification")
        u.city=request.POST.get("place")
        u.district=request.POST.get("district")
        u.occupation=request.POST.get("occupation")
        u.income=request.POST.get("income")
        # itr UPLOAD
        itr=request.FILES['itr']
        split_tup = os.path.splitext(itr.name)
        file_extension = split_tup[1]
        dir_path = settings.MEDIA_ROOT
        count = 0
        for path in os.listdir(dir_path):
            if os.path.isfile(os.path.join(dir_path, path)):
                count += 1
        filecount=count+1
        filename=str(filecount)+"."+file_extension
        obj=FileSystemStorage()
        file=obj.save(filename,itr)
        url1=obj.url(file)
        # Addar
        u.status="Updated"
        u.itr=url1
        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/other_info/')
    else:
       return redirect('/login/')
def apply_education_loan(request):
    if 'suname' in request.session:

      return render(request,'Customer/apply_education_loan.html')
    else:
       return redirect('/login/')
def apply_personal_loan(request):
    if 'suname' in request.session:

      return render(request,'Customer/apply_personal_loan.html')
    else:
       return redirect('/login/')
def apply_vehicle_loan(request):
    if 'suname' in request.session:

      return render(request,'Customer/apply_vehicle_loan.html')
    else:
       return redirect('/login/')
def complaint(request):
    if 'suname' in request.session:

      return render(request,'Customer/complaint.html')
    else:
       return redirect('/login/')
def save_homeloan(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=application_home_loan()
        tbl.total_cost=request.POST.get("total_cost")
        tbl.address=request.POST.get("address")
        tbl.loan_amount=request.POST.get("loan_amount")
        tbl.loan_purpose=request.POST.get("loan_purpose")
        tbl.place=request.POST.get("place")
        tbl.district=request.POST.get("district")
        tbl.state=request.POST.get("state")
        tbl.user_login_id=id
        tbl.status='Submitted'
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/apply_home_loan/')
    else:
       return redirect('/login/')
def home_loan_status(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data=application_home_loan.objects.filter(user_login_id=id)
        return render(request,'Customer/home_loan_status.html',{'data':data})
    else:
       return redirect('/login/')
def save_education_loan(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=application_education_loan()
        tbl.relation=request.POST.get("relation")
        tbl.first_name=request.POST.get("first_name")
        tbl.last_name=request.POST.get("last_name")
        tbl.dob=request.POST.get("dob")
        tbl.phone_number=request.POST.get("phone_number")
        tbl.highest_qualification=request.POST.get("highest_qualification")
        tbl.percentage=request.POST.get("percentage")
        tbl.address=request.POST.get("address")
        tbl.course_name=request.POST.get("course_name")
        tbl.university=request.POST.get("university")
        tbl.Institution=request.POST.get("Institution")
        tbl.total_fee=request.POST.get("total_fee")
        tbl.expected_income=request.POST.get("expected_income")
        tbl.user_login_id=id
        tbl.status='Submitted'
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/apply_education_loan/')
    else:
       return redirect('/login/')
def education_loan_status(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data=application_education_loan.objects.filter(user_login_id=id)
        return render(request,'Customer/education_loan_status.html',{'data':data})
    else:
       return redirect('/login/')

def save_personal_loan(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=application_personal_loan()
        tbl.purpose=request.POST.get("purpose")
        tbl.amount=request.POST.get("amount")
        tbl.tenure=request.POST.get("tenure")
        tbl.user_login_id=id
        tbl.status='Submitted'
# Bank statemtn
        bank_statement=request.FILES['bank_statement']
        split_tup = os.path.splitext(bank_statement.name)
        file_extension = split_tup[1]
        dir_path = settings.MEDIA_ROOT
        count = 0
        for path in os.listdir(dir_path):
            if os.path.isfile(os.path.join(dir_path, path)):
                count += 1
        filecount=count+1
        filename=str(filecount)+"."+file_extension
        obj=FileSystemStorage()
        file=obj.save(filename,bank_statement)
        url1=obj.url(file)
# Salary Slip
        salary_slip=request.FILES['salary_slip']
        split_tup = os.path.splitext(salary_slip.name)
        file_extension = split_tup[1]
        dir_path = settings.MEDIA_ROOT
        count = 0
        for path in os.listdir(dir_path):
            if os.path.isfile(os.path.join(dir_path, path)):
                count += 1
        filecount=count+1
        filename=str(filecount)+"."+file_extension
        obj=FileSystemStorage()
        file=obj.save(filename,salary_slip)
        url2=obj.url(file)


        tbl.bank_statement=url1
        tbl.salary_slip=url2
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/apply_personal_loan/')
    else:
       return redirect('/login/')
def personal_loan_status(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data=application_personal_loan.objects.filter(user_login_id=id)
        return render(request,'Customer/personal_loan_status.html',{'data':data})
    else:
       return redirect('/login/')
def save_vehicle_loan(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=application_vehicle_loan()
        tbl.vehicle_type=request.POST.get("vehicle_type")
        tbl.manufacture=request.POST.get("manufacture")
        tbl.vmodel=request.POST.get("vmodel")
        tbl.Supplier=request.POST.get("Supplier")
        tbl.cost=request.POST.get("cost")
        tbl.dpayment=request.POST.get("dpayment")
        tbl.tenure=request.POST.get("tenure")
        tbl.user_login_id=id
        tbl.status='Submitted'
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/apply_vehicle_loan/')
    else:
       return redirect('/login/')
def vehicle_loan_status(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data=application_vehicle_loan.objects.filter(user_login_id=id)
        return render(request,'Customer/vehicle_loan_status.html',{'data':data})
    else:
       return redirect('/login/')
def save_complaint(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=complaints()
        tbl.complaint=request.POST.get("complaint")
        tbl.user_login_id=id
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/complaint/')
    else:
       return redirect('/login/')
def Complaint_list(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data=complaints.objects.filter(user_login_id=id)
        return render(request,'Customer/complaint_list.html',{'data':data})
    else:
       return redirect('/login/')
def profile(request):
     if 'suname' in request.session:
        id=request.session['slogid']
        data1 = user_register.objects.filter(login_id=id)
        return render(request,'Customer/profile.html',{'data1':data1})
     else:
       return redirect('/login')

def change_password(request):
    if 'suname' in request.session:

        return render(request,'Customer/change_password.html')
    else:
       return redirect('/login')
def update_password(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        opass=make_password(request.POST.get("opassword"),salt='mySalt')
        npass=make_password(request.POST.get("password"),salt='mySalt')
        obj1=login.objects.filter(login_id=id,password=opass)
        if(obj1):
            tbl1=login.objects.get(login_id=id)
            tbl1.password=npass
            tbl1.save()
            messages.add_message(request, messages.INFO, 'Updated Please Login Using new Password.')
            return redirect('/login')
        else:
            messages.add_message(request, messages.INFO, 'Invalid Data')
            return redirect('/change_password')
    else:
       return redirect('/login')
# Admin
def home_loan_appl(request):
    if 'suname' in request.session:
        data=application_home_loan.objects.filter(status='Submitted')
        return render(request,'Site_Admin/home_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def education_loan_appl(request):
    if 'suname' in request.session:
        data=application_education_loan.objects.filter(status='Submitted')
        return render(request,'Site_Admin/education_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def personal_loan_appl(request):
    if 'suname' in request.session:
        data=application_personal_loan.objects.filter(status='Submitted')
        return render(request,'Site_Admin/personal_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def vehicle_loan_appl(request):
    if 'suname' in request.session:
        data=application_vehicle_loan.objects.filter(status='Submitted')
        return render(request,'Site_Admin/vehicle_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def view_applicant_personal_details(request,id):
    if 'suname' in request.session:
        data=user_register.objects.filter(login_id=id)
        return render(request,'Site_Admin/view_applicant_personal_details.html',{'data1':data})
    else:
       return redirect('/login/')
def reject_home_loan(request,id):
    if 'suname' in request.session:
        tbl=application_home_loan.objects.get(appl_home_loan_id=id)
        tbl.status='Rejected'
        tbl.save()
        return redirect('/home_loan_appl/')
    else:
       return redirect('/login/')
def approve_home_loan(request,id):
    if 'suname' in request.session:
        data=application_home_loan.objects.get(appl_home_loan_id=id)
        return render(request,'Site_Admin/approve_home_loan.html',{'id':id,'data':data})
    else:
       return redirect('/login/')
def display_home_rate(request):
    cibil_score = request.GET.get("cibil_score")
    try:
        res = home_loan.objects.filter(cibil_score = cibil_score)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(res.values('rate')), safe = False)
def allow_home_loan(request,id):
    if 'suname' in request.session:
        u=application_home_loan.objects.get(appl_home_loan_id=id)
        u.interest_rate=request.POST.get("Rate")
        u.allowed_loan_amount=request.POST.get("loan_amount")
        u.credited_date=request.POST.get("credicted_date")
        u.status ='Allowed'
        u.Tenure=request.POST.get("Tenure")
        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/home_loan_appl/')
    else:
       return redirect('/login/')
def allowed_home_loan_appl(request):
    if 'suname' in request.session:
        data=application_home_loan.objects.filter(Q(status='Allowed') | Q(status='Activated'))
        return render(request,'Site_Admin/allowed_home_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def emi_home_loan(request,id):
    data=application_home_loan.objects.get(appl_home_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.Tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    data=main(principal, term_remaining, monthly_payment, mpr)
    mydict = {
        "df": data.to_html()
    }
    return render(request,'Site_Admin/emi_calculator.html', context=mydict)
def reject_education_loan(request,id):
    if 'suname' in request.session:
        tbl=application_education_loan.objects.get(appl_edu_loan_id=id)
        tbl.status='Rejected'
        tbl.save()
        return redirect('/education_loan_appl/')
    else:
       return redirect('/login/')
def reject_vehicle_loan(request,id):
    if 'suname' in request.session:
        tbl=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
        tbl.status='Rejected'
        tbl.save()
        return redirect('/vehicle_loan_appl/')
    else:
       return redirect('/login/')
def reject_personal_loan(request,id):
    if 'suname' in request.session:
        tbl=application_personal_loan.objects.get(appl_personal_loan_id=id)
        tbl.status='Rejected'
        tbl.save()
        return redirect('/personal_loan_appl/')
    else:
       return redirect('/login/')
def approve_education_loan(request,id):
    if 'suname' in request.session:
        data=application_education_loan.objects.get(appl_edu_loan_id=id)
        return render(request,'Site_Admin/approve_education_loan.html',{'id':id,'data':data})
    else:
       return redirect('/login/')
def display_edu_rate(request):
    loanlimit = request.GET.get("loanlimit")
    try:
        res = education_loan.objects.filter(loan_limit = loanlimit)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(res.values('rate')), safe = False)
def allow_edu_loan(request,id):
    if 'suname' in request.session:
        u=application_education_loan.objects.get(appl_edu_loan_id=id)
        u.interest_rate=request.POST.get("Rate")
        u.allowed_loan_amount=request.POST.get("loan_amount")
        u.repayment_date=request.POST.get("repayment_date")
        u.status ='Allowed'
        u.Tenure=request.POST.get("Tenure")
        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/education_loan_appl/')
    else:
       return redirect('/login/')
def allowed_education_loan_appl(request):
    if 'suname' in request.session:
        data=application_education_loan.objects.filter(Q(status='Allowed') | Q(status='Activated'))
        return render(request,'Site_Admin/allowed_education_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def emi_edu_loan(request,id):
    data=application_education_loan.objects.get(appl_edu_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.Tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    data=main(principal, term_remaining, monthly_payment, mpr)
    mydict = {
        "df": data.to_html()
    }
    return render(request,'Site_Admin/emi_calculator.html', context=mydict)
def approve_vehicle_loan(request,id):
    if 'suname' in request.session:
        data=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
        cost=data.cost-data.dpayment
        t=data.tenure
        context = {
    'cost':cost,
'tenure':t,
  }
        return render(request,'Site_Admin/approve_vehicle_loan.html',{'id':id,'data':context})
    else:
       return redirect('/login/')
def display_veh_rate(request):
    cibil_score = request.GET.get("cibil_score")
    vehicle_type=request.GET.get("vehicle_type")
    try:
        res = vehicle_loan.objects.filter(cibil_score = cibil_score,vehicle_type=vehicle_type)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(res.values('rate')), safe = False)
def allow_vehicle_loan(request,id):
    if 'suname' in request.session:
        u=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
        u.interest_rate=request.POST.get("Rate")
        u.allowed_loan_amount=request.POST.get("loan_amount")
        u.dispersal_date=request.POST.get("dispersal_date")
        u.status ='Allowed'
        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/vehicle_loan_appl/')
    else:
       return redirect('/login/')
def allowed_vehicle_loan_appl(request):
    if 'suname' in request.session:
        data=application_vehicle_loan.objects.filter(Q(status='Allowed') | Q(status='Activated'))
        return render(request,'Site_Admin/allowed_vehicle_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def emi_veh_loan(request,id):
    data=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    data=main(principal, term_remaining, monthly_payment, mpr)
    mydict = {
        "df": data.to_html()
    }

    return render(request,'Site_Admin/emi_calculator.html', context=mydict)
def approve_personal_loan(request,id):
    if 'suname' in request.session:
        data=application_personal_loan.objects.get(appl_personal_loan_id=id)
        amount=data.amount
        t=data.tenure*12
        context = {
    'amount':amount,
'tenure':t,
  }
        return render(request,'Site_Admin/approve_personal_loan.html',{'id':id,'data':context})
    else:
       return redirect('/login/')
def display_per_rate(request):
    cibil_score = request.GET.get("cibil_score")
    try:
        res = personal_loan.objects.filter(cibil_score = cibil_score)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(res.values('rate','loan_limit','Tenure')), safe = False)
def allow_personal_loan(request,id):
    if 'suname' in request.session:
        u=application_personal_loan.objects.get(appl_personal_loan_id=id)
        u.interest_rate=request.POST.get("Rate")
        u.allowed_loan_amount=request.POST.get("loan_amount")
        u.allowed_tenure=request.POST.get("allowed_tenure")
        u.dispersal_date=request.POST.get("dispersal_date")
        u.status ='Allowed'
        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/vehicle_loan_appl/')
    else:
       return redirect('/login/')

def allowed_personal_loan_appl(request):
    if 'suname' in request.session:
        data=application_personal_loan.objects.filter(Q(status='Allowed') | Q(status='Activated'))
        return render(request,'Site_Admin/allowed_personal_loan_appl.html',{'data':data})
    else:
       return redirect('/login/')
def emi_personal_loan(request,id):
    data=application_personal_loan.objects.get(appl_personal_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.allowed_tenure)
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    data=main(principal, term_remaining, monthly_payment, mpr)
    mydict = {
        "df": data.to_html()
    }

    return render(request,'Site_Admin/emi_calculator.html', context=mydict)
def view_complaints(request):
    if 'suname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply='Nil'  order by c.complaint_id desc")
        data=cursor.fetchall()

        return render(request,'Site_Admin/view_complaints.html',{'data':data})
    else:
       return redirect('/login/')
def adm_reply_complaint(request,id):
    if 'suname' in request.session:

        return render(request,'Site_Admin/reply_complaint.html',{'id':id})
    else:
       return redirect('/login/')
def add_reply(request,id):
    tbl=complaints.objects.get(complaint_id=id)
    tbl.reply=request.POST.get("reply")
    tbl.save()
    return redirect('/replied_list/')
def replied_list(request):
    if 'suname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply!='Nil' order by c.complaint_id desc")
        data=cursor.fetchall()
        return render(request,'Site_Admin/replied_complaints.html',{'data':data})
    else:
       return redirect('/login/')
def Amortization(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        data1=application_home_loan.objects.filter(user_login_id=id,status='Activated')

        data2=application_education_loan.objects.filter(user_login_id=id,status='Activated')
        data3=application_personal_loan.objects.filter(user_login_id=id,status='Activated')
        data4=application_vehicle_loan.objects.filter(user_login_id=id,status='Activated')
        return render(request,'Customer/Amortization.html',{'data1':data1,'data2':data2,'data3':data3,'data4':data4})

    else:
       return redirect('/login/')
def activate_home_loan(request,id):
    data=application_home_loan.objects.get(appl_home_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.Tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    payments = [[principal, 0, 0, 0]]
    total_interest = 0
    totemi=0


    while principal > 0 and term_remaining > 0:
        payment = make_payment(principal, mpr, monthly_payment)
        principal = payment[0]
        term_remaining -= 1
        total_interest += payment[2]
        totemi=payment[1]+payment[2]

        if 'dte' not in request.session:
            days_after = (date.today()+timedelta(days=30)).isoformat()
            request.session['dte']=days_after
        else:
            d_date=request.session['dte']
            s = d_date
            ddate = datetime.strptime(s, "%Y-%m-%d")
            modified_date = ddate + timedelta(days=30)
            days_after=datetime.strftime(modified_date, "%Y-%m-%d")

            request.session['dte']=days_after
        t1=loan_payment()
        t1.duedate=days_after
        t1.principle_payment=payment[0]
        t1.current_principal_payment=payment[1]
        t1.interest_payment=payment[2]
        t1.emi=totemi
        t1.status="Not Paid"
        t1.loan_id=id
        t1.type="Home Loan"
        t1.save()
        t2=application_home_loan.objects.get(appl_home_loan_id=id)
        t2.status='Activated'
        t2.save()
    del request.session['dte']
    messages.add_message(request, messages.INFO, 'Activated . Payment after 1 Month.')
    return redirect('/allowed_home_loan_appl/')
def activate_edu_loan(request,id):
    data=application_education_loan.objects.get(appl_edu_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.Tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    payments = [[principal, 0, 0, 0]]
    total_interest = 0
    totemi=0


    while principal > 0 and term_remaining > 0:
        payment = make_payment(principal, mpr, monthly_payment)
        principal = payment[0]
        term_remaining -= 1
        total_interest += payment[2]
        totemi=payment[1]+payment[2]

        if 'dte' not in request.session:
            days_after = (date.today()+timedelta(days=30)).isoformat()
            request.session['dte']=days_after
        else:
            d_date=request.session['dte']
            s = d_date
            ddate = datetime.strptime(s, "%Y-%m-%d")
            modified_date = ddate + timedelta(days=30)
            days_after=datetime.strftime(modified_date, "%Y-%m-%d")

            request.session['dte']=days_after
        t1=loan_payment()
        t1.duedate=days_after
        t1.principle_payment=payment[0]
        t1.current_principal_payment=payment[1]
        t1.interest_payment=payment[2]
        t1.emi=totemi
        t1.status="Not Paid"
        t1.loan_id=id
        t1.type="Eduaction Loan"
        t1.save()
        t2=application_education_loan.objects.get(appl_edu_loan_id=id)
        t2.status='Activated'
        t2.save()
    del request.session['dte']
    messages.add_message(request, messages.INFO, 'Activated . Payment after 1 Month.')
    return redirect('/allowed_education_loan_appl/')

def activate_personal_loan(request,id):
    data=application_personal_loan.objects.get(appl_personal_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.allowed_tenure)
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    payments = [[principal, 0, 0, 0]]
    total_interest = 0
    totemi=0


    while principal > 0 and term_remaining > 0:
        payment = make_payment(principal, mpr, monthly_payment)
        principal = payment[0]
        term_remaining -= 1
        total_interest += payment[2]
        totemi=payment[1]+payment[2]

        if 'dte' not in request.session:
            days_after = (date.today()+timedelta(days=30)).isoformat()
            request.session['dte']=days_after
        else:
            d_date=request.session['dte']
            s = d_date
            ddate = datetime.strptime(s, "%Y-%m-%d")
            modified_date = ddate + timedelta(days=30)
            days_after=datetime.strftime(modified_date, "%Y-%m-%d")

            request.session['dte']=days_after
        t1=loan_payment()
        t1.duedate=days_after
        t1.principle_payment=payment[0]
        t1.current_principal_payment=payment[1]
        t1.interest_payment=payment[2]
        t1.emi=totemi
        t1.status="Not Paid"
        t1.loan_id=id
        t1.type="Personal Loan"
        t1.save()
        t2=application_personal_loan.objects.get(appl_personal_loan_id=id)
        t2.status='Activated'
        t2.save()
    del request.session['dte']
    messages.add_message(request, messages.INFO, 'Activated . Payment after 1 Month.')
    return redirect('/allowed_personal_loan_appl/')
def activate_veh_loan(request,id):
    data=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
    principal=data.allowed_loan_amount
    apr=data.interest_rate
    term_remaining=int(data.tenure)*12
    # Initialize the paramaters of the loan


    # Get a monthly percentage rate
    apr /= 100
    mpr = apr / 12

    # Calculate the Monthly Payment for a loan
    monthly_payment = (principal * mpr)/(1-(1+mpr) ** -term_remaining)
    payments = [[principal, 0, 0, 0]]
    total_interest = 0
    totemi=0


    while principal > 0 and term_remaining > 0:
        payment = make_payment(principal, mpr, monthly_payment)
        principal = payment[0]
        term_remaining -= 1
        total_interest += payment[2]
        totemi=payment[1]+payment[2]

        if 'dte' not in request.session:
            days_after = (date.today()+timedelta(days=30)).isoformat()
            request.session['dte']=days_after
        else:
            d_date=request.session['dte']
            s = d_date
            ddate = datetime.strptime(s, "%Y-%m-%d")
            modified_date = ddate + timedelta(days=30)
            days_after=datetime.strftime(modified_date, "%Y-%m-%d")

            request.session['dte']=days_after
        t1=loan_payment()
        t1.duedate=days_after
        t1.principle_payment=payment[0]
        t1.current_principal_payment=payment[1]
        t1.interest_payment=payment[2]
        t1.emi=totemi
        t1.status="Not Paid"
        t1.loan_id=id
        t1.type="Vehicle Loan"
        t1.save()
        t2=application_vehicle_loan.objects.get(appl_vehicle_loan_id=id)
        t2.status='Activated'
        t2.save()
    del request.session['dte']
    messages.add_message(request, messages.INFO, 'Activated . Payment after 1 Month.')
    return redirect('/allowed_vehicle_loan_appl/')
def repayment_home_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Home Loan')
        return render(request,'Site_Admin/repayment_home_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def repayment_edu_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Eduaction Loan')
        return render(request,'Site_Admin/repayment_edu_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def repayment_personal_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Personal Loan')
        return render(request,'Site_Admin/repayment_personal_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def repayment_veh_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Vehicle Loan')
        return render(request,'Site_Admin/repayment_veh_loan.html',{'data':t1})
    else:
        return redirect('/login/')
#  Admin


def cust_repayment_home_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Home Loan')
        for i in t1:
            duedate=t1.due_date
            
        return render(request,'Customer/repayment_home_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def cust_repayment_edu_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Eduaction Loan')
        return render(request,'Customer/repayment_edu_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def cust_repayment_personal_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Personal Loan')
        return render(request,'Customer/repayment_personal_loan.html',{'data':t1})
    else:
        return redirect('/login/')
def cust_repayment_vehicle_loan(request,id):
    if 'suname' in request.session:
        t1=loan_payment.objects.filter(loan_id=id,type='Vehicle Loan')
        return render(request,'Customer/repayment_veh_loan.html',{'data':t1})
    else:
        return redirect('/login/')









