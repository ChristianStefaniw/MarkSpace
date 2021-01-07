from rest_framework import serializers

from mark_space_api.models import student_model, mark_model


class MarkSerializer(serializers.ModelSerializer):
    class __StudentNameAndIDSerializer(serializers.ModelSerializer):
        class Meta:
            model = student_model.Student
            fields = ('name', 'id')

    student = __StudentNameAndIDSerializer()

    class Meta:
        model = mark_model.Mark
        fields = '__all__'
