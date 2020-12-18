from django.contrib import admin

from .models import Student, Teacher, Class


class TeacherAdmin(admin.ModelAdmin):
    filter_horizontal = ['teacher_classes']
    list_display = ('name', 'email')


class StudentAdmin(admin.ModelAdmin):
    filter_horizontal = ['student_classes']
    list_display = ('name', 'email')


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers')
    list_display = ('id', 'name')


admin.site.register(Teacher, TeacherAdmin)
admin.site.register(Student, StudentAdmin)
admin.site.register(Class, ClassAdmin)
