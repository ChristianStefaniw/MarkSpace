from rest_framework import serializers

from classes.models import Class
from .models import Student
from units.serializers import UnitListSerializer


class StudentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ('name', 'email', 'class_student')

    def create(self, validated_data):
        new_student = Student.objects.get_or_create(name=validated_data['name'],
                                                                  email=validated_data['email'])
        validated_data['class_student'][0].students.add(new_student)
        new_student.save()
        return new_student


class FilteredClassSerializer(serializers.ListSerializer):
    def to_representation(self, data):
        if self.context['request'].GET.get('class') is None:
            return super().to_representation(data)
        data = data.filter(id=self.context['request'].GET.get('class'))
        return super(FilteredClassSerializer, self).to_representation(data)


class StudentListSerializer(serializers.ModelSerializer):
    class _Units(serializers.ModelSerializer):
        units = UnitListSerializer(many=True, read_only=True)

        class Meta:
            list_serializer_class = FilteredClassSerializer
            model = Class
            fields = ('id', 'units')

    class_student = _Units(read_only=True, many=True)

    class Meta:
        model = Student
        fields = '__all__'
