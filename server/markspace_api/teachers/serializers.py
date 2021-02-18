from rest_framework import serializers

from classes.models import Class
from .models import Teacher


class TeacherSerializer(serializers.ModelSerializer):
    class _NamePeriodCodeClassSerializer(serializers.ModelSerializer):
        class Meta:
            model = Class
            fields = ('id', 'name', 'period', 'code', 'icon')

    class_teacher = _NamePeriodCodeClassSerializer(many=True, read_only=True)

    class Meta:
        model = Teacher
        fields = '__all__'
