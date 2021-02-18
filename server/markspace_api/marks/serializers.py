from rest_framework import serializers

from students.models import Student
from .models import SubGrade, Mark


class SubGradeSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubGrade
        fields = '__all__'


class FilteredMarkSerializer(serializers.ListSerializer):
    def to_representation(self, data):
        if self.context['request'].GET.get('studentid') is not None:
            student = Student.objects.get(id=self.context['request'].GET.get('studentid'))
            data = data.filter(student=student)
            return super(FilteredMarkSerializer, self).to_representation(data)
        elif self.context['request'].GET.get('email') is not None:
            student = Student.objects.get(email=self.context['request'].GET.get('email'))
            data = data.filter(student=student)
            return super(FilteredMarkSerializer, self).to_representation(data)
        else:
            return super().to_representation(data)


class MarkListSerializer(serializers.ModelSerializer):
    class _StudentNameAndIDSerializer(serializers.ModelSerializer):
        class Meta:
            model = Student
            fields = ('name', 'id')

    student = _StudentNameAndIDSerializer()
    subs = SubGradeSerializer(many=True, read_only=True)

    class Meta:
        list_serializer_class = FilteredMarkSerializer
        model = Mark
        fields = '__all__'


class MarkCreateSerializer(serializers.ModelSerializer):
    subs = serializers.JSONField(write_only=True)

    class Meta:
        model = Mark
        fields = ('grade', 'student', 'subs', 'assessment', 'comment')

    def create(self, validated_data):
        new_mark = Mark.objects.create(grade=validated_data['grade'],
                                       student=validated_data['student'],
                                       comment=validated_data['comment'],)

        for sub in validated_data['subs']:
            new_sub_grade = SubGrade.objects.create(name=sub['name'], mark=sub['mark'])
            new_mark.subs.add(new_sub_grade)

        new_mark.assessment.add(validated_data['assessment'][0].id)

        return new_mark
