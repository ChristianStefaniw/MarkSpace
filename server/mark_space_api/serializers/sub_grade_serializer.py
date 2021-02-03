from rest_framework import serializers

from mark_space_api.models.sub_grade_model import SubGrade


class SubGradeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubGrade
        fields = '__all__'
