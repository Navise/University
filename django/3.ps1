<#
2. Develop a layout.html with a suitable header (containing navigation menu) and footer with
copyright and developer information. Inherit this layout.html and create 3 additional pages:
contact us, About Us and Home page of any website.
#>

mkdir third

Set-Location third

python -m venv env

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\env\Scripts\activate

pip install django

Set-Location .\env

django-admin startproject three

Set-Location .\three

python manage.py startapp portfolio

mkdir .\portfolio\templates

@"
<!DOCTYPE html>
<html>
    <head>
        <title>{% block title %} My Website {% endblock %} </title>
    </head>
    <body>
        <nav>
            <ul>
                <li> <a href="{% url 'home' %}">Home</a> </li>
                <li> <a href="{% url 'about' %}">About us</a> </li>
                <li> <a href="{% url 'contact' %}">Contact us</a> </li>
            </ul>
        </nav>
    
    <main>
        {% block content %}
        {% endblock %}
    </main>

    <footer>
        <p>&copy; {% now "Y" %} My Website. All rights reserved.</p>
        <p>Developed by Navise</p>
    </footer>

</body>
</html>
"@ | Set-Content .\portfolio\templates\layout.html

@"
{% extends "layout.html" %}
{% block title%} Home {%endblock%}

{% block content %}
<h1>Welcome to our Home Page</h1>
<p>This is the home page content.</p>
{% endblock %}
"@ | Set-Content .\portfolio\templates\home.html 

@"
{% extends 'layout.html' %}

{% block title %}About Us{% endblock %}

{% block content %}
<h1>About Us</h1>
<p>This is the about us page content.</p>
{% endblock %}
"@ | Set-Content .\portfolio\templates\about.html 

@"
{% extends 'layout.html' %}

{% block title %}Contact Us{% endblock %}

{% block content %}
<h1>Contact Us</h1>
<p>This is the contact us page content.</p>
{% endblock %}
"@ | Set-Content .\portfolio\templates\contact.html 

@"
from django.shortcuts import render

def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

def contact(request):
    return render(request, 'contact.html')
"@ | Set-Content .\portfolio\views.py 

@"
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
]
"@ | Set-Content .\portfolio\urls.py 

@"
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('portfolio.urls')),
]
"@ | Set-Content .\three\urls.py 

@"

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-qwok@+yg_t&b_x)^hx%$$1m4inb+3kx(l$&=*%re7dllmedlmx'

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
    'portfolio'
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

ROOT_URLCONF = 'three.urls'

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

WSGI_APPLICATION = 'three.wsgi.application'


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

"@ | Set-Content .\three\settings.py 

python manage.py migrate

python manage.py runserver

