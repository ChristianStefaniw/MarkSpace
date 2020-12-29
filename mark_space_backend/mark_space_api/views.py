from rest_framework import viewsets
from rest_framework.response import Response

from .serializers import TeacherSerializer, StudentSerializer, ClassSerializers
from .models import Teacher, Student, Class


class TeacherView(viewsets.ModelViewSet):
    serializer_class = TeacherSerializer
    queryset = Teacher.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = TeacherSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(email=self.request.query_params.get('email'))
        return queryset


class StudentView(viewsets.ModelViewSet):
    serializer_class = StudentSerializer
    queryset = Student.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = StudentSerializer(queryset, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(email=self.request.query_params.get('email'))
        return queryset


class ClassView(viewsets.ModelViewSet):
    serializer_class = ClassSerializers.ClassPostSerializer
    queryset = Class.objects.all()

    def list(self, request, *args, **kwargs):
        query_set = self.get_queryset()
        serializer = ClassSerializers.ClassGetSerializer(query_set, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
