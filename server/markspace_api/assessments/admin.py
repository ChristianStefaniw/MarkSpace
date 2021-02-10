from django.contrib import admin

from .models import Assessment


class AssessmentAdmin(admin.ModelAdmin):
    filter_horizontal = ['marks']


admin.site.register(Assessment, AssessmentAdmin)
