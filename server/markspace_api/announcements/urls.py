from django.urls import path

from . import views

urlpatterns = [
    path('announcements', views.AnnouncementView.as_view({'get': 'list',
                                                          'put': 'update',
                                                          'patch': 'partial_update',
                                                          'delete': 'destroy'}), name='announcements')
]
