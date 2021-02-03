import uuid
from django.db import models
from datetime import datetime


class Class(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True, related_name='class_student')
    teachers = models.ManyToManyField('Teacher', blank=True, related_name='class_teacher')
    units = models.ManyToManyField('Unit', blank=True, related_name='class_unit')
    announcements = models.ManyToManyField('Announcement', blank=True, related_name='class_announcement')

    def __str__(self):
        return str(self.id)


# can't find model for some reason when it is outside of this file
class Announcement(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    content = models.TextField()
    date_time = models.DateTimeField()
    teacher = models.ForeignKey('Teacher', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id)