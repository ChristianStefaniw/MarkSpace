from django.urls import path

from .views import UnitView

urlpatterns = [
    path('', UnitView.as_view({'get': 'list',
                               'put': 'update',
                               'patch': 'partial_update',
                               'delete': 'destroy'}), name='units')
]
