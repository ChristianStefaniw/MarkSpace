from django.db import models


class Teacher(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()

    def __str__(self):
        return self.name


class Student(models.Model):
    name = models.TextField(primary_key=True)
    email = models.EmailField()

    def __str__(self):
        return self.name
