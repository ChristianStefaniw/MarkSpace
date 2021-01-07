from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.serializers.assessment_serializers import AssessmentListSerializer, AssessmentCreateSerializer
from mark_space_api.models.assessment_model import Assessment


class AssessmentView(viewsets.ModelViewSet):
    serializer_class = AssessmentCreateSerializer
    queryset = Assessment.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = AssessmentListSerializer(queryset, many=True)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = AssessmentCreateSerializer(obj, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
