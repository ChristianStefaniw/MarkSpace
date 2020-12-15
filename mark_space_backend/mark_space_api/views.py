from rest_framework import viewsets
from rest_framework.response import Response

from .serializers import TeacherSerializer, StudentSerializer
from .models import Teacher, Student


class TeacherView(viewsets.ModelViewSet):
    serializer_class = TeacherSerializer
    queryset = Teacher.objects.none()

    def list(self, request, *args, **kwargs):
        queryset = Teacher.objects.all()
        serializer = TeacherSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        email = self.request.query_params.get('email')
        queryset = Teacher.objects.filter(name__contains=email)
        return queryset


class StudentView(viewsets.ModelViewSet):
    serializer_class = StudentSerializer
    queryset = Student.objects.none()

    def list(self, request, *args, **kwargs):
        queryset = Student.objects.all()
        serializer = StudentSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        email = self.request.query_params.get('email')
        queryset = Student.objects.filter(name__contains=email)
        return queryset
