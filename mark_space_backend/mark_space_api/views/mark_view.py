from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.serializers.mark_serializers import *
from mark_space_api.models.mark_model import Mark


class MarkView(viewsets.ModelViewSet):
    serializer_class = MarkCreateSerializer
    queryset = Mark.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = MarkListSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        serializer = MarkCreateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            print(serializer.errors)
            return Response(serializer.data, status=500)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
