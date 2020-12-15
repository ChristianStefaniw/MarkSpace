from django.urls import path, include
from rest_framework.routers import DefaultRouter

from mark_space_api import views

router = DefaultRouter()
router.register(r'teacher', views.TeacherView, 'teacher')
router.register(r'student', views.StudentView, 'student')


urlpatterns = [
    path('', views.home, name='home'),
    path('api/', include(router.urls)),
]
