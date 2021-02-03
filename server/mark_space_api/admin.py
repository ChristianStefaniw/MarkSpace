from django.contrib import admin

from mark_space_api import models


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers', 'units', 'announcements')


class UnitAdmin(admin.ModelAdmin):
    filter_horizontal = ['assessments']


class AssessmentAdmin(admin.ModelAdmin):
    filter_horizontal = ['marks']


class MarkAdmin(admin.ModelAdmin):
    filter_horizontal = ['subs']


admin.site.register(models.mark_model.Mark, MarkAdmin)
admin.site.register(models.teacher_model.Teacher)
admin.site.register(models.class_model.Class, ClassAdmin)
admin.site.register(models.unit_model.Unit, UnitAdmin)
admin.site.register(models.assessment_model.Assessment, AssessmentAdmin)
admin.site.register(models.student_model.Student)
admin.site.register(models.sub_grade_model.SubGrade)
admin.site.register(models.class_model.Announcement)
