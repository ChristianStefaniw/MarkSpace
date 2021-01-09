import uuid
from django.db import models


class Assessment(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    weight = models.FloatField()
    name = models.TextField()
    marks = models.ManyToManyField('Mark', blank=True, related_name='assessment')

    def __str__(self):
        return str(self.id)
