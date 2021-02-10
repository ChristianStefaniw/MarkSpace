from django.urls import path

from .views import TeacherView

urlpatterns = [
    path('', TeacherView.as_view({'get': 'list',
                                  'put': 'update',
                                  'patch': 'partial_update',
                                  'delete': 'destroy'}), name='teachers')
]
