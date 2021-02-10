from django.contrib import admin

from .models import Mark


class MarkAdmin(admin.ModelAdmin):
    filter_horizontal = ['subs']


admin.site.register(Mark, MarkAdmin)
