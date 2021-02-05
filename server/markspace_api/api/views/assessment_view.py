from rest_framework import viewsets
from rest_framework.response import Response

from api.serializers.assessment_serializers import *
from api.models.assessment_model import Assessment


class AssessmentView(viewsets.ModelViewSet):
    serializer_class = AssessmentCreateSerializer
    queryset = Assessment.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = AssessmentListSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
