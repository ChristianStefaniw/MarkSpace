from django.contrib import admin
from django.urls import path, include

from mark_space_api import urls

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(urls))
]
