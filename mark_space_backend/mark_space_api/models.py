from django.db import models


class Teacher(models.Model):
    name = models.TextField()
    email = models.EmailField(primary_key=True)
    teacher_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField()
    email = models.EmailField(primary_key=True)
    student_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Mark(models.Model):
    unit = models.TextField(primary_key=True)
    name = models.TextField()
    grade = models.FloatField()
    subs = models.JSONField()
    student = models.OneToOneField('Student', on_delete=models.CASCADE)

    def __str__(self):
        return self.unit


class Class(models.Model):
    class_id = models.TextField(primary_key=True)
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True)
    teachers = models.ManyToManyField('Teacher', blank=True)
    marks = models.ManyToManyField('Mark', blank=True)

    def __str__(self):
        return self.class_id
