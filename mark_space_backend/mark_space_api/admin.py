from django.contrib import admin

from .models import Student, Teacher, Class, Mark, Unit, Assessment


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers', 'units')


class UnitAdmin(admin.ModelAdmin):
    filter_horizontal = ['assessments']


class AssessmentAdmin(admin.ModelAdmin):
    filter_horizontal = ['marks']


admin.site.register(Teacher)
admin.site.register(Student)
admin.site.register(Mark)
admin.site.register(Class, ClassAdmin)
admin.site.register(Unit, UnitAdmin)
admin.site.register(Assessment, AssessmentAdmin)
