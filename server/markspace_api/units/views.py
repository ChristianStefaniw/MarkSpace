from rest_framework import viewsets
from rest_framework.response import Response

from .models import Unit
from .serializers import UnitCreateSerializer, UnitListSerializer


class UnitView(viewsets.ModelViewSet):
    serializer_class = UnitCreateSerializer
    queryset = Unit.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = UnitListSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(class_unit=self.request.query_params.get('class'))
        return queryset
