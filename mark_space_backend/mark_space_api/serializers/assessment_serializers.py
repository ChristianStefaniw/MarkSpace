from rest_framework import serializers

from mark_space_api.models.assessment_model import Assessment
from mark_space_api.serializers.mark_serializers import MarkListSerializer


class AssessmentListSerializer(serializers.ModelSerializer):
    marks = MarkListSerializer(read_only=True, many=True)

    class Meta:
        model = Assessment
        fields = '__all__'


class AssessmentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assessment
        fields = ('name', 'weight', 'unit')

    def create(self, validated_data):
        new_assessment = Assessment.objects.create(name=validated_data['name'], weight=validated_data['weight'])
        new_assessment.unit.add(validated_data['unit'][0].id)
        new_assessment.save()
        return new_assessment
