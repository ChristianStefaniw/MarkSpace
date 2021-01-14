import uuid
from django.db import models


class SubGrade(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    sub_grade_name = models.TextField()
    sub_grade_mark = models.TextField()

    def __str__(self):
        return str(self.id)
