from django.contrib import admin

from .models import Unit


class UnitAdmin(admin.ModelAdmin):
    filter_horizontal = ['assessments']


admin.site.register(Unit, UnitAdmin)
