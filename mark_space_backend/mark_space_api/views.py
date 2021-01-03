from rest_framework import viewsets
from rest_framework.response import Response

from .serializers import TeacherSerializer, StudentSerializers, ClassSerializers
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
    serializer_class = StudentSerializers.StudentPostSerializer
    queryset = Student.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = StudentSerializers.StudentGetSerializer(queryset, many=True)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = StudentSerializers.StudentPostSerializer(obj, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(email=self.request.query_params.get('email'))
        return queryset


class ClassView(viewsets.ModelViewSet):
    serializer_class = ClassSerializers.ClassPostUpdateSerializer
    queryset = Class.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = ClassSerializers.ClassGetSerializer(queryset, many=True)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = ClassSerializers.ClassPostUpdateSerializer(obj, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()

        return Response(serializer.data)

    def get_queryset(self):
        queryset = self.queryset.filter(id=self.request.query_params.get('id'))
        return queryset
