from django.urls import path

from .views import MarkView

urlpatterns = [
    path('', MarkView.as_view({'get': 'list',
                               'put': 'update',
                               'patch': 'partial_update',
                               'delete': 'destroy'}), name='marks')
]
