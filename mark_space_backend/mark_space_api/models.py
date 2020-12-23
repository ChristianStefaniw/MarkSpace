from django.db import models
from jsonfield import JSONField


class Teacher(models.Model):
    name = models.TextField()
    email = models.EmailField(primary_key=True)
    teacher_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField()
    email = models.EmailField(primary_key=True)
    marks = JSONField(blank=True)
    student_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Class(models.Model):
    id = models.TextField(primary_key=True)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True)
    teachers = models.ManyToManyField('Teacher', blank=True)

    def __str__(self):
        return self.id
