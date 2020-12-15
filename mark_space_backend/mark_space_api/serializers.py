from rest_framework import serializers
from .models import Teacher, Student


class TeacherSerializer(serializers.ModelSerializer):
    name = serializers.CharField()
    email = serializers.EmailField()

    class Meta:
        model = Teacher
        fields = ('name', 'email')


class StudentSerializer(serializers.ModelSerializer):
    name = serializers.CharField()

    class Meta:
        model = Student
        fields = ('name', 'email')
