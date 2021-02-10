from django.urls import path

from .views import StudentView

urlpatterns = [
    path('', StudentView.as_view({'get': 'list',
                                  'put': 'update',
                                  'patch': 'partial_update',
                                  'delete': 'destroy'}), name='students')
]
