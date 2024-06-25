<#Develop a Django app that displays current date and time ,  date and time four hours ahead and
 four hours before as an offset of current date and time in server.
#>

mkdir first

Set-Location first

python -m venv env

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\env\Scripts\activate

pip install django

Set-Location .\env

django-admin startproject one 

Set-Location .\one

python manage.py startapp datetimeapp

@"
from django.http import HttpResponse
from datetime import datetime , timedelta

def dateandtime(request):
    now = datetime.now()
    ahead = now + timedelta(hours=4)
    behind = now - timedelta(hours=4)

    html = f"<html><body><h3>Current date and time: {now} <br> Ahead {ahead} <br> behind {behind}</h3></body></html>"

    return HttpResponse(html)
"@ | Set-Content .\datetimeapp\views.py

@"
from django.contrib import admin
from django.urls import path
from datetimeapp import views

urlpatterns = [
    path("", views.dateandtime),
    path('admin/', admin.site.urls),
]
"@ | Set-Content .\one\urls.py

python manage.py runserver


