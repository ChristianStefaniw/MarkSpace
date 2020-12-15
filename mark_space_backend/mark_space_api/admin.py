from django.contrib import admin

from .models import Student, Teacher


class TeacherAdmin(admin.ModelAdmin):
    list_display = ('name', 'email')


class StudentAdmin(admin.ModelAdmin):
    list_display = ('name', 'email')


admin.site.register(Teacher, TeacherAdmin)
admin.site.register(Student, StudentAdmin)
