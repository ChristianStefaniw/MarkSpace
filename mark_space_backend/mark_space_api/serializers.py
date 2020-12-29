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


class RelatedFields:
    @staticmethod
    class TeacherRelatedField(serializers.RelatedField):
        """
        Not 100% sure if "TeacherRelatedField" is the best way to serialize teachers. Will hopefully find a better way soon.
        """

        def to_representation(self, obj):
            data = {
                'id': obj.id,
                'name': obj.name,
                'email': obj.email,
            }
            return data

        def to_internal_value(self, id):
            return Teacher.objects.get(id=id)


class ClassSerializer(serializers.ModelSerializer):
    teachers = RelatedFields.TeacherRelatedField(
        queryset=Teacher.objects.all(), many=True
    )

    # units = UnitSerializer(many=True, read_only=True)
    # teachers = TeacherSerializer(many=True, )
    # students = StudentSerializer(many=True, read_only=True)

    class Meta:
        model = Class
        fields = '__all__'
