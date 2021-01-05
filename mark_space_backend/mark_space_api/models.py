import uuid

from django.db import models


class Teacher(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    email = models.EmailField()

    def __str__(self):
        return self.name


class Student(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    email = models.EmailField()

    def __str__(self):
        return self.name


class Mark(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    grade = models.FloatField()
    subs = models.JSONField()
    student = models.ForeignKey('Student', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.student)


class Unit(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    assessments = models.ManyToManyField('Assessment', blank=True)

    def __str__(self):
        return self.name


class Assessment(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    weight = models.FloatField()
    name = models.TextField()
    marks = models.ManyToManyField('Mark', blank=True)

    def __str__(self):
        return self.name


class Class(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True, related_name='classes_student')
    teachers = models.ManyToManyField('Teacher', blank=True, related_name='classes_teacher')
    units = models.ManyToManyField('Unit', blank=True)

    def __str__(self):
        return str(self.id)
