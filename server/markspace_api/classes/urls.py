from django.urls import path

from .views import ClassView

urlpatterns = [
    path('', ClassView.as_view({'get': 'list',
                                'put': 'update',
                                'patch': 'partial_update',
                                'delete': 'destroy'}), name='class')
]
