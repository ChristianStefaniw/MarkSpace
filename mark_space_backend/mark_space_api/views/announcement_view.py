from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.models.class_model import Class
from mark_space_api.serializers.announcement_serializer import AnnouncementListSerializer, AnnouncementCreateSerializer


class AnnouncementView(viewsets.ModelViewSet):
    serializer_class = AnnouncementCreateSerializer
    queryset = Class.objects.all()