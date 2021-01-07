import uuid
from django.db import models


class Unit(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    assessments = models.ManyToManyField('Assessment', blank=True)

    def __str__(self):
        return self.name
