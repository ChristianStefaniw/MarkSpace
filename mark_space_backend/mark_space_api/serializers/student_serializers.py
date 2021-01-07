from rest_framework import serializers

from mark_space_api.models import student_model, class_model
from .unit_serializers import UnitListSerializer


class StudentCreateSerializer(serializers.ModelSerializer):
    class_student = serializers.UUIDField()

    class Meta:
        model = student_model.Student
        fields = '__all__'

    def create(self, validated_data):
        new_student = student_model.Student.objects.create(name=validated_data['name'],
                                                           email=validated_data['email'])
        class_model.Class.objects.get(id=validated_data['class_student']).students.add(new_student)
        new_student.save()
        return new_student

    def update(self, instance, validated_data):
        for __class in validated_data['class_student']:
            class_model.Class.objects.get(id=__class.id).students.add(instance)
        instance.save()
        return instance


class StudentListSerializer(serializers.ModelSerializer):
    class __Units(serializers.ModelSerializer):
        units = UnitListSerializer(many=True, read_only=True)

        class Meta:
            model = class_model.Class
            fields = ('id', 'units')

    class_student = __Units(read_only=True, many=True)

    class Meta:
        model = student_model.Student
        fields = '__all__'
