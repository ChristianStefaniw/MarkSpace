from rest_framework import serializers

from .models import Teacher, Student, Class, Mark, Unit, Assessment


class MarkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mark
        fields = '__all__'


class AssessmentSerializer(serializers.ModelSerializer):
    marks = MarkSerializer(read_only=True)

    class Meta:
        model = Assessment
        fields = '__all__'


class UnitSerializer(serializers.ModelSerializer):
    assessments = AssessmentSerializer(many=True, read_only=True)

    class Meta:
        model = Unit
        fields = '__all__'


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):
    units = UnitSerializer(many=True, read_only=True)

    class Meta:
        model = Student
        fields = '__all__'


class ClassSerializers:
    class ClassPostSerializer(serializers.ModelSerializer):
        class Meta:
            model = Class
            fields = '__all__'

        def create(self, validated_data):
            new_class = Class.objects.create(name=validated_data['name'], code=validated_data['code'],
                                             period=validated_data['period'], icon=validated_data['icon'])
            for teacher in validated_data['teachers']:
                new_class.teachers.add(teacher.id)
                Teacher.objects.get(id=teacher.id).teacher_classes.add(new_class)

            new_class.save()
            return new_class

    class ClassGetSerializer(serializers.ModelSerializer):
        teachers = TeacherSerializer(many=True, read_only=True)
        units = UnitSerializer(many=True, read_only=True)
        students = StudentSerializer(many=True, read_only=True)

        class Meta:
            model = Class
            fields = '__all__'
