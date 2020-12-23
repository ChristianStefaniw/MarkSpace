from rest_framework import serializers
from .models import Teacher, Student, Class


class TeacherSerializer(serializers.ModelSerializer):

    class Meta:
        model = Teacher
        fields = '__all__'


class ClassSerializer(serializers.ModelSerializer):

    class Meta:
        model = Class
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):

    student_classes = ClassSerializer(many=True, read_only=True)

    class Meta:
        model = Student
        fields = '__all__'
