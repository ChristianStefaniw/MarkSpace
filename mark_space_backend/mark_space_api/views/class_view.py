from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.models.class_model import Class
from mark_space_api.serializers.class_serializers import ClassListSerializer, ClassCreateSerializer, ClassUpdateSerializer


class ClassView(viewsets.ModelViewSet):
    serializer_class = ClassUpdateSerializer
    queryset = Class.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = ClassListSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = ClassCreateSerializer(obj, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
