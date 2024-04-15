from django.db import models

# Create your models here.
class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=50)
    password=models.TextField(null=True)
    Usertype=models.CharField(max_length=50)
    status=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_login'

class user_register(models.Model):
    user_id=models.AutoField(primary_key=True)
    login_id=models.IntegerField()
    firstname=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    phone_number=models.BigIntegerField()
    address=models.TextField()
    mail_id=models.CharField(max_length=50)
    photo=models.CharField(max_length=50, default='nil')
    identity_proof=models.CharField(max_length=50, default='nil')
    gender=models.CharField(max_length=50, default='nil')
    marital_status=models.CharField(max_length=50, default='nil')
    dob=models.DateField(default='2023-03-03')
    spouse=models.CharField(max_length=50, default='nil')
    no_dependents=models.IntegerField(default=0)
    no_childen=models.CharField(max_length=50, default=0)
    caste_category=models.CharField(max_length=50, default='nil')
    nationality=models.CharField(max_length=50, default='nil')
    residential_status=models.CharField(max_length=50, default='nil')
    place_of_birth=models.CharField(max_length=50, default='nil')
    pan_no=models.CharField(max_length=50, default='nil')
    highest_qualification=models.CharField(max_length=50, default='nil')
    city=models.CharField(max_length=50, default='nil')
    district=models.CharField(max_length=50, default='nil')
    occupation=models.CharField(max_length=50, default='nil')
    income=models.IntegerField(default=0)
    status=models.CharField(max_length=50, default='No Updated')
    itr=models.CharField(max_length=50, default='Nil')


    class Meta:
        db_table='tbl_customer'

class home_loan(models.Model):
    home_loan_id=models.AutoField(primary_key=True)
    cibil_score=models.CharField(max_length=50)
    rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    class Meta:
        db_table='tbl_home_loan_scheme'
class education_loan(models.Model):
    education_loan_id=models.AutoField(primary_key=True)
    loan_limit=models.CharField(max_length=50)
    rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    class Meta:
        db_table='tbl_edu_loan_scheme'
class vehicle_loan(models.Model):
    vehicle_loan_id=models.AutoField(primary_key=True)
    cibil_score=models.CharField(max_length=50)
    vehicle_type=models.CharField(max_length=50)
    rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    class Meta:
        db_table='tbl_vehicle_loan_scheme'

class personal_loan(models.Model):
    personal_loan_id=models.AutoField(primary_key=True)
    cibil_score=models.CharField(max_length=50)
    loan_limit=models.IntegerField()
    Tenure=models.IntegerField()
    rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    class Meta:
        db_table='tbl_personal_loan_scheme'
class application_home_loan(models.Model):
    appl_home_loan_id=models.AutoField(primary_key=True)
    total_cost=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    address=models.CharField(max_length=50)
    loan_amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    loan_purpose=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    district=models.CharField(max_length=50)
    state=models.CharField(max_length=50)
    user_login_id=models.IntegerField()
    allowed_loan_amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    interest_rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    credited_date=models.DateField(default='2023-03-03')
    Tenure=models.IntegerField()
    status=models.CharField(max_length=50)

    class Meta:
        db_table='tbl_application_home_loan'

class application_education_loan(models.Model):
    appl_edu_loan_id=models.AutoField(primary_key=True)
    relation=models.CharField(max_length=50)
    first_name=models.CharField(max_length=50)
    last_name=models.CharField(max_length=50)
    dob=models.DateField()
    phone_number=models.BigIntegerField()
    highest_qualification=models.CharField(max_length=50)
    total_fee=models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    percentage=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    address=models.CharField(max_length=50)
    course_name=models.CharField(max_length=50)
    university=models.CharField(max_length=50)
    Institution=models.CharField(max_length=50)
    expected_income=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    user_login_id=models.IntegerField()
    allowed_loan_amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    interest_rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    repayment_date=models.DateField(default='2023-03-03')
    Tenure=models.IntegerField()
    status=models.CharField(max_length=50)

    class Meta:
        db_table='tbl_application_edu_loan'
class application_personal_loan(models.Model):
    appl_personal_loan_id=models.AutoField(primary_key=True)
    purpose=models.CharField(max_length=50)
    amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    tenure=models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    bank_statement=models.CharField(max_length=50)
    salary_slip=models.CharField(max_length=50)
    user_login_id=models.IntegerField()
    status=models.CharField(max_length=50)
    interest_rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    allowed_loan_amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    allowed_tenure=models.IntegerField()
    dispersal_date=models.DateField(default='2023-03-03')
    class Meta:
        db_table='tbl_application_personal_loan'
class application_vehicle_loan(models.Model):
    appl_vehicle_loan_id=models.AutoField(primary_key=True)
    vehicle_type=models.CharField(max_length=50)
    manufacture=models.CharField(max_length=50)
    vmodel=models.CharField(max_length=50)
    Supplier=models.CharField(max_length=50)
    cost=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    dpayment=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    tenure=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    allowed_loan_amount=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    interest_rate=models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    dispersal_date=models.DateField(default='2023-03-03')
    user_login_id=models.IntegerField()
    status=models.CharField(max_length=50)

    class Meta:
        db_table='tbl_application_vehicle_loan'
class complaints(models.Model):
    complaint_id=models.AutoField(primary_key=True)
    complaint=models.CharField(max_length=50)
    reply=models.CharField(max_length=50,default='Nil')
    user_login_id=models.IntegerField()


    class Meta:
        db_table='tbl_complaint'
class loan_payment(models.Model):
    loan_payment_loan_id=models.AutoField(primary_key=True)
    loan_id=models.IntegerField()
    type=models.CharField(max_length=50)
    duedate=models.DateField(max_length=50)
    principle_payment=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    current_principal_payment=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    interest_payment=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    emi=models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    status=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_loan_payment'

