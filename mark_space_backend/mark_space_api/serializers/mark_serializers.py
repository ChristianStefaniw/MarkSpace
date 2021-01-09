from rest_framework import serializers

from mark_space_api.models import student_model, mark_model


class MarkListSerializer(serializers.ModelSerializer):
    class __StudentNameAndIDSerializer(serializers.ModelSerializer):
        class Meta:
            model = student_model.Student
            fields = ('name', 'id')

    student = __StudentNameAndIDSerializer()

    class Meta:
        model = mark_model.Mark
        fields = '__all__'


class MarkCreateSerializer(serializers.ModelSerializer):

    assessment = serializers.UUIDField()

    class Meta:
        model = mark_model.Mark
        fields = '__all__'

    def create(self, validated_data):
        new_mark = mark_model.Mark.objects.create(grade=validated_data['grade'], subs=validated_data['subs'], student=validated_data['student'])
        new_mark.assessment.add(validated_data['assessment'])
        return new_mark
