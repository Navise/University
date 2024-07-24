<# 12
Develop a registration page for student enrolment as done in Module 2 but without page
refresh using AJAX.
#>

mkdir twelve 

Set-Location .\twelve

python -m venv env

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\env\Scripts\activate

pip install django 

Set-Location .\env

django-admin startproject AjaxRegistration

Set-Location .\AjaxRegistration

python manage.py startapp studentRegistration

@"
from django.db import models

class Course(models.Model):
    course_code = models.CharField(max_length=40)
    course_name = models.CharField(max_length=100)
    course_credits = models.IntegerField()

    def __str__(self):
        return self.course_name

class Student(models.Model):
    student_usn = models.CharField(max_length=20)
    student_name = models.CharField(max_length=100)
    student_sem = models.IntegerField()
    enrolment = models.ManyToManyField(Course)

    def __str__(self):
        return f"{self.student_name} ({self.student_usn})"
"@ | Set-Content .\studentRegistration\models.py 

@"
from django.shortcuts import render
from django.http import JsonResponse
from .models import Course, Student

def regaj(request):
    if request.method == "POST" and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        sid = request.POST.get("sname")
        cid = request.POST.get("cname")
        student = Student.objects.get(id=sid)
        course = Course.objects.get(id=cid)
        res = student.enrolment.filter(id=cid)
        if res:
            return JsonResponse({'message': 'Student already enrolled'}, status=200)
        student.enrolment.add(course)
        return JsonResponse({'message': 'Student enrolled successfully'}, status=200)
    else:
        students = Student.objects.all()
        courses = Course.objects.all()
        return render(request, "regaj.html", {"students": students, "courses": courses})
"@ | Set-Content .\studentRegistration\views.py 

@"
from django.urls import path
from .views import regaj

urlpatterns = [
    path('regaj/', regaj, name='regaj'),
]
"@ | Set-Content .\studentRegistration\urls.py 

@"
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('studentRegistration.urls')),
]
"@ | Set-Content .\AjaxRegistration\urls.py 

@"
"""
Django settings for AjaxRegistration project.

Generated by 'django-admin startproject' using Django 5.0.4.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-@(d563heasa8fn@knv*@eutn1#nv@ych1mhp1-nql6tfws5@xu'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'studentRegistration'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'AjaxRegistration.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'AjaxRegistration.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

"@ | Set-Content .\AjaxRegistration\settings.py 

mkdir .\studentRegistration\templates 

@"
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1>Student Registration</h1>
    <form id="student-form">
        {% csrf_token %}
        Student Name
        <select name="sname" id="sname">
            {% for student in students %}
                <option value="{{ student.id }}">{{ student.student_name }}</option>
            {% endfor %}
        </select>
        <br>
        Course Name
        <select name="cname" id="cname">
            {% for course in courses %}
                <option value="{{ course.id }}">{{ course.course_name }}</option>
            {% endfor %}
        </select>
        <br>
        <span id="ans"></span>
        <button type="button" id="ebtn">Enroll</button>
    </form>
    <script>
        `$(document).ready(function(){
            `$("#ebtn").click(function(){
                var sname = `$("#sname").val();
                var cname = `$("#cname").val();
                $.ajax({
                    type: "POST",
                    url: "{% url 'regaj' %}",
                    data: {
                        sname: sname,
                        cname: cname,
                        csrfmiddlewaretoken: "{{ csrf_token }}"
                    },
                    success: function(response){
                        `$("#ans").html(response.message);
                    },
                    error: function(xhr){
                        `$("#ans").html('An error occurred.');
                    }
                });
            });
        });
    </script>
</body>
</html>
"@ | Set-Content .\studentRegistration\templates\regaj.html
python manage.py makemigrations

python manage.py migrate
@"
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'AjaxRegistration.settings')
django.setup()

from studentRegistration.models import Course, Student

from studentRegistration.models import Course, Student

course1 = Course(course_code='CS101', course_name='Introduction to Computer Science', course_credits=3)
course1.save()
course2 = Course(course_code='CS102', course_name='Data Structures', course_credits=4)
course2.save()
course3 = Course(course_code='CS103', course_name='Algorithms', course_credits=4)
course3.save()

student1 = Student(student_usn='1', student_name='John Doe', student_sem=3)
student1.save()
student2 = Student(student_usn='2', student_name='Jane Smith', student_sem=5)
student2.save()

"@ | Set-Content .\insert.py

python .\insert.py

Remove-Item insert.py 


python manage.py runserver
