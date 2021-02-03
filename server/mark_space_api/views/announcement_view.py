from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import action

from mark_space_api.models.class_model import Announcement
from mark_space_api.serializers.announcement_serializer import AnnouncementListSerializer, AnnouncementCreateSerializer


class AnnouncementView(viewsets.ModelViewSet):
    serializer_class = AnnouncementCreateSerializer
    queryset = Announcement.objects.all()