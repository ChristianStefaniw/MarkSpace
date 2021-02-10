import uuid
from django.db import models

from assessments.models import Assessment


class Unit(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    assessments = models.ManyToManyField(Assessment, blank=True, related_name='unit')

    def __str__(self):
        return str(self.id)
