from django.contrib import admin
from django.urls import path, include


from teachers import urls as teacher_urls
from units import urls as unit_urls
from students import urls as student_urls
from marks import urls as mark_urls
from classes import urls as class_urls
from assessments import urls as assessment_urls
from announcements import urls as announcement_urls
from app import urls as app_urls

urlpatterns = [
    path('', include(app_urls)),
    path('admin/', admin.site.urls),
    path('api/teachers/', include(teacher_urls)),
    path('api/units/', include(unit_urls)),
    path('api/students/', include(student_urls)),
    path('api/marks/', include(mark_urls)),
    path('api/classes/', include(class_urls)),
    path('api/assessments/', include(assessment_urls)),
    path('api/announcements/', include(announcement_urls))
]
