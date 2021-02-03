from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.serializers.unit_serializers import UnitListSerializer, UnitCreateSerializer
from mark_space_api.models.unit_model import Unit


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
