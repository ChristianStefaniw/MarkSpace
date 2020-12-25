from rest_framework import serializers
from .models import Teacher, Student, Class, Mark, Unit, Assessment


class MarkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mark
        fields = '__all__'


class AssessmentSerializer(serializers.ModelSerializer):
    marks = MarkSerializer(read_only=True)

    class Meta:
        model = Assessment
        fields = '__all__'


class UnitSerializer(serializers.ModelSerializer):
    assessments = AssessmentSerializer(many=True, read_only=True)

    class Meta:
        model = Unit
        fields = '__all__'


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'


class ClassSerializer(serializers.ModelSerializer):
    units = UnitSerializer(many=True, read_only=True)
    teachers = TeacherSerializer(many=True, read_only=True)
    students = StudentSerializer(many=True, read_only=True)

    class Meta:
        model = Class
        fields = '__all__'
