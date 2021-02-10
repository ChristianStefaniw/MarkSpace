from rest_framework import viewsets
from rest_framework.response import Response

from .models import Assessment
from .serializers import AssessmentCreateSerializer, AssessmentListSerializer


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
