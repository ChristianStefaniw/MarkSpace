from django.contrib import admin

from .models import mark_model, teacher_model, class_model, unit_model, student_model, assessment_model


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers', 'units')


class UnitAdmin(admin.ModelAdmin):
    filter_horizontal = ['assessments']


class AssessmentAdmin(admin.ModelAdmin):
    filter_horizontal = ['marks']


class StudentAdmin(admin.ModelAdmin):
    list_display = ['id']


class TeacherAdmin(admin.ModelAdmin):
    list_display = ['id']


admin.site.register(mark_model.Mark)
admin.site.register(teacher_model.Teacher, TeacherAdmin)
admin.site.register(class_model.Class, ClassAdmin)
admin.site.register(unit_model.Unit, UnitAdmin)
admin.site.register(assessment_model.Assessment, AssessmentAdmin)
admin.site.register(student_model.Student, StudentAdmin)
