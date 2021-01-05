from django.urls import path, include
from rest_framework.routers import DefaultRouter

from mark_space_api import views

router = DefaultRouter()
router.register(r'teacher', views.TeacherView, 'teacher')
router.register(r'student', views.StudentView, 'student')
router.register(r'class', views.ClassView, 'class')
router.register(r'unit', views.UnitView, 'unit')
router.register(r'assessment', views.AssessmentView, 'assessment')


urlpatterns = [
    path('', include(router.urls)),
]
