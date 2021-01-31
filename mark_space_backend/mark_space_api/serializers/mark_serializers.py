from rest_framework import serializers

from mark_space_api.models import student_model, mark_model, sub_grade_model
from .sub_grade_serializer import SubGradeSerializer


class FilteredMarkSerializer(serializers.ListSerializer):
    def to_representation(self, data):
        if self.context['request'].GET.get('studentid') is not None:
            student = student_model.Student.objects.get(id=self.context['request'].GET.get('studentid'))
            data = data.filter(student=student)
            return super(FilteredMarkSerializer, self).to_representation(data)
        elif self.context['request'].GET.get('email') is not None:
            student = student_model.Student.objects.get(email=self.context['request'].GET.get('email'))
            data = data.filter(student=student)
            return super(FilteredMarkSerializer, self).to_representation(data)
        else:
            return super().to_representation(data)


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
    subs = serializers.JSONField(write_only=True)

    class Meta:
        model = mark_model.Mark
        fields = ('grade', 'student', 'subs', 'assessment')

    def create(self, validated_data):
        new_mark = mark_model.Mark.objects.create(grade=validated_data['grade'], student=validated_data['student'])

        for sub in validated_data['subs']:
            new_sub_grade = sub_grade_model.SubGrade.objects.create(name=sub['name'], mark=sub['mark'])
            new_mark.subs.add(new_sub_grade)

        new_mark.assessment.add(validated_data['assessment'][0].id)

        return new_mark
