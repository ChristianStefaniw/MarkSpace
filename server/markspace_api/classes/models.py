import uuid
from django.db import models

from announcements.models import Announcement
from students.models import Student
from teachers.models import Teacher
from units.models import Unit


class Class(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField(Student, blank=True, related_name='class_student')
    teachers = models.ManyToManyField(Teacher, blank=True, related_name='class_teacher')
    units = models.ManyToManyField(Unit, blank=True, related_name='class_unit')
    announcements = models.ManyToManyField(Announcement, blank=True, related_name='class_announcement')

    def __str__(self):
        return str(self.id)
