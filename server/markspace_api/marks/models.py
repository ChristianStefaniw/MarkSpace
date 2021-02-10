import uuid
from django.db import models

from students.models import Student


class SubGrade(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    mark = models.TextField()

    def __str__(self):
        return str(self.id)


class Mark(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    grade = models.TextField()
    comment = models.TextField(blank=True)
    subs = models.ManyToManyField(SubGrade, related_name='the_mark')
    student = models.ForeignKey(Student, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id)
