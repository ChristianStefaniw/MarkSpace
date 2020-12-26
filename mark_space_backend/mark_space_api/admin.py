from django.contrib import admin

from .models import Student, Teacher, Class, Mark, Unit, Assessment


class TeacherAdmin(admin.ModelAdmin):
    filter_horizontal = ['teacher_classes']
    list_display = ('name', 'email')


class StudentAdmin(admin.ModelAdmin):
    filter_horizontal = ('student_classes', 'units')
    list_display = ('name', 'email')


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers', 'units')
    list_display = ('id', 'name', 'code', 'period')


class UnitAdmin(admin.ModelAdmin):
    filter_horizontal = ['assessments']
    list_display = ('name', 'the_class')


admin.site.register(Teacher, TeacherAdmin)
admin.site.register(Student, StudentAdmin)
admin.site.register(Class, ClassAdmin)
admin.site.register(Mark)
admin.site.register(Unit, UnitAdmin)
admin.site.register(Assessment)
