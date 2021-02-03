from rest_framework import viewsets
from rest_framework.response import Response

from mark_space_api.models.teacher_model import Teacher
from mark_space_api.serializers.teacher_serializers import TeacherSerializer


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
