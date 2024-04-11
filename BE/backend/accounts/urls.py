from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('', include('dj_rest_auth.urls')),
]


#06cfc67df215142dacb5be3f3ba0a20b2e0475e1