from rest_framework import serializers

from announcements.models import Announcement
from announcements.serializers import AnnouncementListSerializer
from .models import Class
from students.models import Student
from teachers.models import Teacher
from units.serializers import UnitListSerializer


class ClassCreateSerializer(serializers.ModelSerializer):
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


class ClassListSerializer(serializers.ModelSerializer):
    class _TeacherNameIDAndEmailSerializer(serializers.ModelSerializer):
        class Meta:
            model = Teacher
            fields = ('name', 'email', 'id')

    class _StudentNameIDAndEmailSerializer(serializers.ModelSerializer):
        class Meta:
            model = Student
            fields = ('name', 'email', 'id')

    teachers = _TeacherNameIDAndEmailSerializer(many=True, read_only=True)
    students = _StudentNameIDAndEmailSerializer(many=True, read_only=True)
    units = UnitListSerializer(many=True, read_only=True)
    announcements = serializers.SerializerMethodField()

    class Meta:
        model = Class
        fields = '__all__'

    def get_announcements(self, obj):
        ordered_queryset = Announcement.objects.all().filter(class_announcement=obj.id).order_by(
            '-date_time')
        return AnnouncementListSerializer(ordered_queryset, many=True, read_only=True).data
