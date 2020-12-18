from rest_framework import serializers
from .models import Teacher, Student, Class


class TeacherSerializer(serializers.ModelSerializer):

    class Meta:
        model = Teacher
        fields = ('name', 'email', 'teacher_classes')


class ClassSerializer(serializers.ModelSerializer):

    class Meta:
        model = Class
        fields = ('id', 'name', 'students', 'teachers')


class StudentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student
        fields = ('name', 'email', 'marks', 'student_classes')
