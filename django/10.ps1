<# 10
For students enrolment developed in Module 2, create a generic class view which displays 
list of students and detailview that displays student details for any selected student in the list.
#>

mkdir tenth 

Set-Location .\tenth 

python -m venv env 

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\env\Scripts\activate

pip install django 

Set-Location .\env

django-admin startproject ten 

Set-Location .\ten 

python manage.py startapp studentRegistration

@"
from django.db import models
class Course(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name

class Student(models.Model):
    name = models.CharField(max_length=100)
    courses = models.ManyToManyField(Course, related_name='students')
    def __str__(self):
        return self.name
"@ | Set-Content .\studentRegistration\models.py 

@"
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
path('admin/', admin.site.urls),
path('', include('studentRegistration.urls')),
]
"@ | Set-Content .\ten\urls.py 

@"
from django.urls import path
from . import views
urlpatterns = [
path('students/', views.StudentListView.as_view(), name='student_list'),
path('student/<int:pk>/', views.StudentDetailView.as_view(), 
name='student_detail'),
]
"@ | Set-Content .\studentRegistration\urls.py 

@"
from django.views.generic import ListView, DetailView
from .models import Student
class StudentListView(ListView):
    model = Student
    template_name = 'student_list.html'
    context_object_name = 'students'
class StudentDetailView(DetailView):
    model = Student
    template_name = 'student_detail.html'
    context_object_name = 'student'
"@ | Set-Content .\studentRegistration\views.py 

mkdir .\studentRegistration\templates 

@"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>{{ student.name }} Details</title>
</head>
<body>
<h1>{{ student.name }} Details</h1>
<h2>Courses enrolled:</h2>
<ul>
{% for course in student.courses.all %}
<li>{{ course.name }}</li>
{% endfor %}
</ul>
</body>
</html>
"@ | Set-Content .\studentRegistration\templates\student_detail.html 

@"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student List</title>
</head>
<body>
<h1>List of Students</h1>
<ul>
{% for student in students %}
<li><a href="{% url 'student_detail' student.pk %}">
{{ student.name }}</a></li>
{% endfor %}
</ul>
</body>
</html>
"@ | Set-Content .\studentRegistration\templates\student_list.html 


@"
"""
Django settings for ten project.

Generated by 'django-admin startproject' using Django 5.0.7.

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
SECRET_KEY = 'django-insecure-v@5)d#7zj$$b6wumnq6hj*9@fgzk(tpfmkonj87hy3at2#i=+%'

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

ROOT_URLCONF = 'ten.urls'

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

WSGI_APPLICATION = 'ten.wsgi.application'


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

"@ | Set-Content .\ten\settings.py 

python manage.py makemigrations 

python manage.py migrate 

@"
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ten.settings')
django.setup()

from studentRegistration.models import Course, Student


course1 = Course.objects.create(name='Mathematics')
course2 = Course.objects.create(name='Physics')

course1.save() 
course2.save() 

student1 = Student.objects.create(name='Alicent')
student1.courses.add(course1)
student2 = Student.objects.create(name='John')
student2.courses.add(course2) 


student1.save()
student2.save()

"@ | Set-Content .\insert.py 

python .\insert.py 

rm insert.py 

python manage.py runserver 

