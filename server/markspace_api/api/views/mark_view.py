from rest_framework import viewsets
from rest_framework.response import Response

from api.serializers.mark_serializers import *
from api.models.mark_model import Mark


class MarkView(viewsets.ModelViewSet):
    serializer_class = MarkCreateSerializer
    queryset = Mark.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = MarkListSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)


    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
