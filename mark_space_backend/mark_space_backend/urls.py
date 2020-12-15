from django.contrib import admin
from django.urls import path, include

from mark_space_api import urls as api_urls
from mark_space_app import urls as urls

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(api_urls)),
    path('', include(urls)),
]
