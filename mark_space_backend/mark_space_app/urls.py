from django.urls import path

from mark_space_app import views

urlpatterns = [
    path('', views.index, name='index'),
]
