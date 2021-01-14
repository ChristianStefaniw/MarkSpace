import uuid
from django.db import models

from .sub_grade_model import SubGrade


class Mark(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    grade = models.TextField()
    subs = models.ManyToManyField('SubGrade', related_name='subs')
    student = models.ForeignKey('Student', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id)
