import json

from rest_framework import serializers

from mark_space_api.models import student_model, mark_model, class_model
from .sub_grade_serializer import SubGradeSerializer


class FilteredMarkSerializer(serializers.ListSerializer):
    def to_representation(self, data):
        if self.context['request'].GET.get('email') is None:
            return super().to_representation(data)
        student = student_model.Student.objects.get(email=self.context['request'].GET.get('email'))
        data = data.filter(student=student)
        return super(FilteredMarkSerializer, self).to_representation(data)


class MarkListSerializer(serializers.ModelSerializer):
    class __StudentNameAndIDSerializer(serializers.ModelSerializer):
        class Meta:
            model = student_model.Student
            fields = ('name', 'id')

    student = __StudentNameAndIDSerializer()
    subs = SubGradeSerializer(many=True, read_only=True)

    class Meta:
        list_serializer_class = FilteredMarkSerializer
        model = mark_model.Mark
        fields = '__all__'


class MarkCreateSerializer(serializers.ModelSerializer):
    assessment = serializers.UUIDField()

    class Meta:
        model = mark_model.Mark
        fields = '__all__'

    def create(self, validated_data):
        new_mark = mark_model.Mark.objects.create(grade=validated_data['grade'],
                                                  subs=json.loads(validated_data['subs']),
                                                  student=validated_data['student'])
        new_mark.assessment.add(validated_data['assessment'])
        return new_mark
