from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.serializers.student_serializers import StudentListSerializer, StudentCreateSerializer
from mark_space_api.models.student_model import Student


class StudentView(viewsets.ModelViewSet):
    serializer_class = StudentCreateSerializer
    queryset = Student.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = StudentListSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = StudentCreateSerializer(obj, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(email=self.request.query_params.get('email'))
        return queryset
