from rest_framework import serializers

from mark_space_api.models import teacher_model, student_model, class_model
from .unit_serializers import UnitListSerializer


class ClassCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = class_model.Class
        fields = '__all__'

    def create(self, validated_data):
        new_class = class_model.Class.objects.create(name=validated_data['name'], code=validated_data['code'],
                                                     period=validated_data['period'], icon=validated_data['icon'])
        for teacher in validated_data['teachers']:
            new_class.teachers.add(teacher.id)

        new_class.save()
        return new_class


class ClassUpdateSerializer(serializers.ModelSerializer):

    class Meta:
        model = class_model.Class
        fields = '__all__'

    def update(self, instance, validated_data):
        if 'teachers' is validated_data:
            for teacher in validated_data['teachers']:
                instance.teachers.add(teacher.id)
        if 'students' in validated_data:
            for student in validated_data['students']:
                instance.students.add(student.id)
        if 'units' in validated_data:
            for unit in validated_data['units']:
                instance.units.add(unit.id)

        instance.save()
        return instance


class ClassListSerializer(serializers.ModelSerializer):
    class __TeacherNameIDAndEmailSerializer(serializers.ModelSerializer):
        class Meta:
            model = teacher_model.Teacher
            fields = ('name', 'email', 'id')

    class __StudentNameIDAndEmailSerializer(serializers.ModelSerializer):
        class Meta:
            model = student_model.Student
            fields = ('name', 'email', 'id')

    teachers = __TeacherNameIDAndEmailSerializer(many=True, read_only=True)
    students = __StudentNameIDAndEmailSerializer(many=True, read_only=True)
    units = UnitListSerializer(many=True, read_only=True)

    class Meta:
        model = class_model.Class
        fields = '__all__'
