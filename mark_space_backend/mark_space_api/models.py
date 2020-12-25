from django.db import models


class Teacher(models.Model):
    name = models.TextField()
    email = models.EmailField()
    teacher_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField()
    email = models.EmailField()
    student_classes = models.ManyToManyField('Class', blank=True)

    def __str__(self):
        return self.name


class Mark(models.Model):
    grade = models.FloatField()
    subs = models.JSONField()
    student = models.ForeignKey('Student', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.student)


class Unit(models.Model):
    name = models.TextField()
    the_class = models.ForeignKey('Class', on_delete=models.CASCADE)
    assessments = models.ManyToManyField('Assessment', blank=True)

    def __str__(self):
        return self.name


class Assessment(models.Model):
    name = models.TextField()
    marks = models.OneToOneField('Mark', null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Class(models.Model):
    name = models.TextField()
    code = models.TextField()
    period = models.TextField()
    icon = models.URLField()
    students = models.ManyToManyField('Student', blank=True)
    teachers = models.ManyToManyField('Teacher', blank=True)
    units = models.ManyToManyField('Unit', blank=True)

    def __str__(self):
        return str(self.id)
