<# 8
Develop a Django app that performs student registration to a course. It should also display list
of students registered for any selected course. Create students and course as models with
enrolment as ManyToMany field. register admin interfaces, perform migrations and 
illustrate data entry through admin forms.
#>

mkdir fourth

Set-Location fourth

python -m venv env

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\env\Scripts\activate

pip install django

Set-Location .\env

django-admin startproject four

Set-Location .\four

python manage.py startapp courses

mkdir .\courses\templates

@"
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
    <h1>Student Registration</h1>
    <form method="post">
        {% csrf_token %}
        <label for="student_name">Student Name:</label>
        <input type="text" id="student_name" name="student_name">
        <label for="course">Select a Course:</label>
        <select id="course" name="course">
            {% for course in courses %}
                <option value="{{ course.id }}">{{ course.name }}</option>
            {% endfor %}
        </select>
        <button type="submit">Register</button>
    </form>
</body>
</html>
"@ | Set-Content .\courses\templates\register_student.html

@"
<html>
<head>
    <title>Course List</title>
</head>
<body>
    <h1>Available Courses</h1>
    <ul>
        {% for course in courses %}
            <li><a href="{% url 'course_details' course.id %}">{{ course.name }}</a></li>
        {% endfor %}
    </ul>
</body>
</html>
"@ | Set-Content .\courses\templates\course_list.html

@"
<html>
<head>
    <title>{{ course.name }} Details</title>
</head>
<body>
    <h1>{{ course.name }} Details</h1>
    <h2>Registered Students:</h2>
    <ul>
        {% for student in students %}
            <li>{{ student.name }}</li>
        {% endfor %}
    </ul>
</body>
</html>
"@ | Set-Content .\courses\templates\course_details.html 

@"
from django.shortcuts import render
from .models import Course, Student

def register_student(request):
    if request.method == 'POST':
        student_name = request.POST.get('student_name')
        course_id = request.POST.get('course')
        course = Course.objects.get(pk=course_id)
        student = Student.objects.create(name=student_name)
        student.courses.add(course)
    courses = Course.objects.all()
    return render(request, 'register_student.html', {'courses': courses})

def course_details(request, course_id):
    course = Course.objects.get(pk=course_id)
    students = course.students.all()
    return render(request, 'course_details.html', {'course': course, 'students': students})

def course_list(request):
    courses = Course.objects.all()
    return render(request, 'course_list.html', {'courses': courses})
"@ | Set-Content .\courses\views.py 

@"
from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_student, name='register_student'),
    path('course/<int:course_id>/', views.course_details, name='course_details'),
    path('list/', views.course_list, name='course_list'),
]
"@ | Set-Content .\courses\urls.py

@"
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('courses/', include('courses.urls')),
]
"@ | Set-Content .\four\urls.py

@"

from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

DEBUG = True

ALLOWED_HOSTS = []

SECRET_KEY = 'django-insecure-0q@d-g^#yki_ee983ylev&v6@7#y)!^hzd7#rk2&3&f&0&rk60'
# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'courses'
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

ROOT_URLCONF = 'four.urls'

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

WSGI_APPLICATION = 'four.wsgi.application'


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

"@ | Set-Content .\four\settings.py

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
"@ | Set-Content .\courses\models.py 

python manage.py makemigrations

python manage.py migrate

$env:DJANGO_SETTINGS_MODULE = "four.settings"

@"

import django
django.setup()
from courses.models import Course

Course.objects.create(name='Mathematics')
Course.objects.create(name='Physics')

"@ | Set-Content .\create_course.py 

python .\create_course.py

@"
from django.contrib import admin

from .models import Course  ,Student 

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('name',)

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('name',)
    filter_horizontal = ('courses',)
"@ | Set-Content .\courses\admin.py

$env:DJANGO_SUPERUSER_PASSWORD = "navise"
python manage.py createsuperuser --username navise --email "navk21is@cmrit.ac.in" --noinput

python manage.py makemigrations

python manage.py migrate

python manage.py runserver 

Write-Output "goto http://127.0.0.1:8000/courses/register/"
Write-Output "goto http://127.0.0.1:8000/courses/list/"