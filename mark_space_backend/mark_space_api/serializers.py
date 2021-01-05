from rest_framework import serializers

from .models import Teacher, Student, Class, Mark, Unit, Assessment


class MarkSerializer(serializers.ModelSerializer):
    class __StudentNameAndIDSerializer(serializers.ModelSerializer):
        class Meta:
            model = Student
            fields = ('name', 'id')

    student = __StudentNameAndIDSerializer()

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
        class Meta:
            model = Assessment
            fields = '__all__'

        def create(self, validated_data):
            new_assessment = Assessment.objects.create(name=validated_data['name'], weight=validated_data['weight'])
            new_assessment.save()
            return new_assessment

        def update(self, instance, validated_data):
            for mark in validated_data['marks']:
                instance.marks.add(mark.id)
            instance.save()
            return instance


class UnitSerializers:
    class UnitGetSerializer(serializers.ModelSerializer):
        assessments = AssessmentSerializers.AssessmentGetSerializer(many=True, read_only=True)

        class Meta:
            model = Unit
            fields = '__all__'

    class UnitPostSerializer(serializers.ModelSerializer):
        class Meta:
            model = Unit
            fields = '__all__'

        def create(self, validated_data):
            new_unit = Unit.objects.create(name=validated_data['name'], the_class=validated_data['the_class'])
            Class.objects.get(id=new_unit.the_class.id).units.add(new_unit)
            new_unit.save()
            return new_unit

        def update(self, instance, validated_data):
            for assessment in validated_data['assessments']:
                instance.assessments.add(assessment.id)
            instance.save()
            return instance


class TeacherSerializer(serializers.ModelSerializer):
    class __NamePeriodCodeClassSerializer(serializers.ModelSerializer):
        class Meta:
            model = Class
            fields = ('id', 'name', 'period', 'code', 'icon')

    classes_teacher = __NamePeriodCodeClassSerializer(many=True, read_only=True)

    class Meta:
        model = Teacher
        fields = '__all__'


class StudentSerializers:
    class StudentPostSerializer(serializers.ModelSerializer):
        class Meta:
            model = Student
            fields = '__all__'

        def create(self, validated_data):
            new_student = Student.objects.create(name=validated_data['name'], email=validated_data['email'])
            for __class in validated_data['student_classes']:
                Class.objects.get(id=__class.id).students.add(new_student)
            new_student.save()
            return new_student

        def update(self, instance, validated_data):
            for __class in validated_data['student_classes']:
                Class.objects.get(id=__class.id).students.add(instance)
            instance.save()
            return instance

    class StudentGetSerializer(serializers.ModelSerializer):

        class __NamePeriodCodeClassSerializer(serializers.ModelSerializer):
            class Meta:
                model = Class
                fields = ('id', 'name', 'period', 'code', 'icon')

        classes_student = __NamePeriodCodeClassSerializer(many=True, read_only=True)

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
            if 'units' in validated_data:
                for unit in validated_data['units']:
                    instance.units.add(unit.id)

            instance.save()
            return instance

    class ClassGetSerializer(serializers.ModelSerializer):

        class __TeacherNameIDAndEmailSerializer(serializers.ModelSerializer):
            class Meta:
                model = Teacher
                fields = ('name', 'email', 'id')

        class __StudentNameIDAndEmailSerializer(serializers.ModelSerializer):
            class Meta:
                model = Student
                fields = ('name', 'email', 'id')

        teachers = __TeacherNameIDAndEmailSerializer(many=True, read_only=True)
        students = __StudentNameIDAndEmailSerializer(many=True, read_only=True)

        class Meta:
            model = Class
            fields = '__all__'
