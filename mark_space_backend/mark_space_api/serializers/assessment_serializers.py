from rest_framework import serializers

from mark_space_api.models.assessment_model import Assessment
from mark_space_api.serializers.mark_serializers import MarkSerializer


class AssessmentListSerializer(serializers.ModelSerializer):
    marks = MarkSerializer(read_only=True, many=True)

    class Meta:
        model = Assessment
        fields = '__all__'


class AssessmentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assessment
        fields = '__all__'

    def create(self, validated_data):
        new_assessment = Assessment.objects.create(name=validated_data['name'], weight=validated_data['weight'])
        new_assessment.save()
        return new_assessment

    def update(self, instance, validated_data):
        for mark in validated_data['marks']:
            instance.marks.add(mark.id)
        instance.save()
        return instance
