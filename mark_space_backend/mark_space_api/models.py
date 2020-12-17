from django.db import models


class Teacher(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()
    classes = models.ManyToManyField('Class', related_name='student', blank=True)

    def __str__(self):
        return self.name


class Class(models.Model):
    id = models.TextField(primary_key=True)
    name = models.TextField()

    def __str__(self):
        return self.id
