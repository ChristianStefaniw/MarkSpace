from rest_framework import serializers

from mark_space_api import models


class AnnouncementListSerializer(serializers.ModelSerializer):
    class __TeacherSerializer(serializers.ModelSerializer):
        class Meta:
            model = models.teacher_model.Teacher
            fields = ('id', 'name')

    teacher = __TeacherSerializer(read_only=True)

    class Meta:
        model = models.class_model.Announcement
        fields = '__all__'


class AnnouncementCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.class_model.Announcement
        fields = ('class_announcement', 'content', 'teacher', 'date_time')

    def create(self, validated_data):
        print(validated_data)
        new_announcement = models.class_model.Announcement.objects.create(content=validated_data['content'],
                                                                          teacher=validated_data['teacher'],
                                                                          date_time=validated_data['date_time'],
                                                                          )
        new_announcement.class_announcement.add(validated_data['class_announcement'][0].id)
        new_announcement.save()
        return new_announcement
