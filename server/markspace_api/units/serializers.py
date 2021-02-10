from rest_framework import serializers

from assessments.serializers import AssessmentListSerializer
from .models import Unit


class UnitListSerializer(serializers.ModelSerializer):
    assessments = AssessmentListSerializer(many=True, read_only=True)

    class Meta:
        model = Unit
        fields = '__all__'


class UnitCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Unit
        fields = ('class_unit', 'name')

    def create(self, validated_data):
        new_unit = Unit.objects.create(name=validated_data['name'], )
        new_unit.save()
        validated_data['class_unit'][0].units.add(new_unit)

        return new_unit
