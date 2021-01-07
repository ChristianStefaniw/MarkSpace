import uuid
from django.db import models


class Class(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True, related_name='class_student')
    teachers = models.ManyToManyField('Teacher', blank=True, related_name='class_teacher')
    units = models.ManyToManyField('Unit', blank=True, related_name='class_unit')

    def __str__(self):
        return str(self.id)