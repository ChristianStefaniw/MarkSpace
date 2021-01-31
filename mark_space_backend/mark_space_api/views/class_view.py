from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.models.class_model import Class
from mark_space_api.serializers.class_serializers import ClassListSerializer, ClassCreateSerializer


class ClassView(viewsets.ModelViewSet):
    serializer_class = ClassListSerializer
    queryset = Class.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = ClassListSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        if self.request.query_params.get('studentid') is not None:
            queryset = self.queryset.filter(id=self.request.query_params.get('id'), students__id=self.request.query_params.get('studentid'))
        else:
            queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
