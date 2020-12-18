from django.db import models
from jsonfield import JSONField


class Teacher(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()
    teacher_classes = models.ManyToManyField('Class', related_name='teacher', blank=True)

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()
    marks = JSONField(blank=True)
    student_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Class(models.Model):
    id = models.TextField(primary_key=True)
    name = models.TextField()
    students = models.ManyToManyField('Student', blank=True)
    teachers = models.ManyToManyField('Teacher', blank=True)

    def __str__(self):
        return self.id
