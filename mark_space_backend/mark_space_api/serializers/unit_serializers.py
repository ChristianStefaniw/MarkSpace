from rest_framework import serializers

from .assessment_serializers import AssessmentListSerializer
from mark_space_api.models import unit_model, class_model


class UnitListSerializer(serializers.ModelSerializer):
    assessments = AssessmentListSerializer(many=True, read_only=True)

    class Meta:
        model = unit_model.Unit
        fields = '__all__'


class UnitCreateSerializer(serializers.ModelSerializer):
    class_unit = serializers.UUIDField()

    class Meta:
        model = unit_model.Unit
        fields = '__all__'

    def create(self, validated_data):
        new_unit = unit_model.Unit.objects.create(name=validated_data['name'], )
        new_unit.save()
        class_model.Class.objects.get(id=validated_data['class_unit']).units.add(new_unit)

        return new_unit

    def update(self, instance, validated_data):
        for assessment in validated_data['assessments']:
            instance.assessments.add(assessment.id)
        instance.save()
        return instance
