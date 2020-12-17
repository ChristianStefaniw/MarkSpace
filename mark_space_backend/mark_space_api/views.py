from rest_framework import viewsets
from rest_framework.response import Response

from .serializers import TeacherSerializer, StudentSerializer
from .models import Teacher, Student


class TeacherView(viewsets.ModelViewSet):
    serializer_class = TeacherSerializer
    queryset = Teacher.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = TeacherSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset
        query_set = queryset.filter(email=self.request.query_params.get('email'))
        return query_set


class StudentView(viewsets.ModelViewSet):
    serializer_class = StudentSerializer
    queryset = Student.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = StudentSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset
        query_set = queryset.filter(email=self.request.query_params.get('email'))
        return query_set
