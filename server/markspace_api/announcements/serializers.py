from rest_framework import serializers

from teachers.models import Teacher
from .models import Announcement


class AnnouncementListSerializer(serializers.ModelSerializer):
    class _TeacherSerializer(serializers.ModelSerializer):
        class Meta:
            model = Teacher
            fields = ('id', 'name')

    teacher = _TeacherSerializer(read_only=True)

    class Meta:
        model = Announcement
        fields = '__all__'


class AnnouncementCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Announcement
        fields = ('class_announcement', 'content', 'teacher', 'date_time')

    def create(self, validated_data):
        new_announcement = Announcement.objects.create(content=validated_data['content'],
                                                       teacher=validated_data['teacher'],
                                                       date_time=validated_data['date_time'],
                                                       )
        new_announcement.class_announcement.add(validated_data['class_announcement'][0].id)
        new_announcement.save()
        return new_announcement
