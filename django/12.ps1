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

class Student(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
"@ | Set-content .\studentRegistration\models.py 

@"
from django import forms
from .models import Student

class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['first_name', 'last_name', 'email']
"@ | Set-Content .\studentRegistration\forms.py

@"
from django.shortcuts import render
from django.http import JsonResponse
from .forms import StudentForm

def register_student(request):
    if request.method == 'POST' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': 'Student registered successfully!'}, status=200)
        else:
            return JsonResponse({'errors': form.errors}, status=400)
    else:
        form = StudentForm()
    return render(request, 'register_student.html', {'form': form})
"@ | Set-Content .\studentRegistration\views.py 

@"
from django.urls import path
from .views import register_student

urlpatterns = [
    path('', register_student, name='register_student'),
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>Student Registration</h1>
    <form id="student-form">
        `{% csrf_token %}
        `{{ form.as_p }}
        <button type="submit">Register</button>
    </form>
    <div id="message"></div>

    <script>
        `$(document).ready(function(){
            `$('#student-form').on('submit', function(event){
                event.preventDefault();
                `$.ajax({
                    url: "`{% url 'register_student' %}`",
                    method: 'POST',
                    data: `$(this).serialize(),
                    success: function(response){
                        `$('#message').html('<p style="color:green;">' + response.message + '</p>');
                        `$('#student-form')[0].reset();
                    },
                    error: function(xhr){
                        let errors = JSON.parse(xhr.responseText).errors;
                        let error_message = '<ul style="color:red;">';
                        for (let field in errors) {
                            error_message += '<li>' + errors[field].join(', ') + '</li>';
                        }
                        error_message += '</ul>';
                        `$('#message').html(error_message);
                    }
                });
            });
        });
    </script>
</body>
</html>
"@ | Set-Content .\studentRegistration\templates\register_student.html

python manage.py makemigrations

python manage.py migrate 

python manage.py runserver 