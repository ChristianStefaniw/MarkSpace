from django.urls import path

from . import views

urlpatterns = [
    path('', views.AssessmentView.as_view({'get': 'list',
                                           'put': 'update',
                                           'patch': 'partial_update',
                                           'delete': 'destroy'}), name='assessments')
]
