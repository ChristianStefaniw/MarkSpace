from rest_framework import serializers

from .models import Teacher, Student, Class, Mark, Unit, Assessment


class MarkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mark
        fields = '__all__'


class AssessmentSerializers:
    class AssessmentGetSerializer(serializers.ModelSerializer):
        marks = MarkSerializer(read_only=True, many=True)

        class Meta:
            model = Assessment
            fields = '__all__'

    class AssessmentPostSerializer(serializers.ModelSerializer):
        marks = MarkSerializer(read_only=True)

        class Meta:
            model = Assessment
            fields = '__all__'


class UnitSerializers:
    class UnitGetSerializer(serializers.ModelSerializer):
        assessments = AssessmentSerializers.AssessmentGetSerializer(many=True, read_only=True)

        class Meta:
            model = Unit
            fields = '__all__'

    class UnitPostSerializer(serializers.ModelSerializer):
        assessments = AssessmentSerializers.AssessmentGetSerializer(many=True, read_only=True)

        class Meta:
            model = Unit
            fields = '__all__'

        def update(self, instance, validated_data):
            new_unit = Unit.objects.create(name=validated_data['name'], the_class=validated_data['the_class'])
            for assessment in validated_data['assessment']:
                new_unit.assessments.add(assessment.id)

            new_unit.save()
            return new_unit


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):
    units = UnitSerializers.UnitGetSerializer(many=True, read_only=True)

    class Meta:
        model = Student
        fields = '__all__'


class ClassSerializers:
    class ClassPostUpdateSerializer(serializers.ModelSerializer):
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

        def update(self, instance, validated_data):
            if 'teachers' is validated_data:
                for teacher in validated_data['teachers']:
                    instance.teachers.add(teacher.id)
                    Teacher.objects.get(id=teacher.id).teacher_classes.add(instance)
            if 'students' in validated_data:
                for student in validated_data['students']:
                    instance.students.add(student.id)
                    Student.objects.get(id=student.id).student_classes.add(instance)
            if 'units' in validated_data:
                for unit in validated_data['units']:
                    instance.units.add(unit.id)

            instance.save()
            return instance

    class ClassGetSerializer(serializers.ModelSerializer):
        teachers = TeacherSerializer(many=True, read_only=True)
        units = UnitSerializers.UnitGetSerializer(many=True, read_only=True)
        students = StudentSerializer(many=True, read_only=True)

        class Meta:
            model = Class
            fields = '__all__'
