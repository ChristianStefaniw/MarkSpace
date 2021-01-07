from rest_framework import serializers

from mark_space_api.models import class_model, teacher_model


class TeacherSerializer(serializers.ModelSerializer):
    class __NamePeriodCodeClassSerializer(serializers.ModelSerializer):
        class Meta:
            model = class_model.Class
            fields = ('id', 'name', 'period', 'code', 'icon')

    class_teacher = __NamePeriodCodeClassSerializer(many=True, read_only=True)

    class Meta:
        model = teacher_model.Teacher
        fields = '__all__'
