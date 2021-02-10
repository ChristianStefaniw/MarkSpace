from rest_framework import viewsets

from .models import Announcement
from .serializers import AnnouncementCreateSerializer


class AnnouncementView(viewsets.ModelViewSet):
    serializer_class = AnnouncementCreateSerializer
    queryset = Announcement.objects.all()
