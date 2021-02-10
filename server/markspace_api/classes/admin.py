from django.contrib import admin

from .models import Class


class ClassAdmin(admin.ModelAdmin):
    filter_horizontal = ('students', 'teachers', 'units', 'announcements')


admin.site.register(Class, ClassAdmin)
