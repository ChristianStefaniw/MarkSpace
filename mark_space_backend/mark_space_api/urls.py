from django.urls import path, include
from rest_framework.routers import DefaultRouter

from mark_space_api.views import teacher_view, assessment_view, class_view, unit_view, student_view, mark_view, announcement_view

router = DefaultRouter()
router.register(r'teacher', teacher_view.TeacherView, 'teacher')
router.register(r'student', student_view.StudentView, 'student')
router.register(r'class', class_view.ClassView, 'class')
router.register(r'unit', unit_view.UnitView, 'unit')
router.register(r'assessment', assessment_view.AssessmentView, 'assessment')
router.register(r'mark', mark_view.MarkView, 'mark')
router.register(r'announcement', announcement_view.AnnouncementView, 'announcement')


urlpatterns = [
    path('', include(router.urls)),
]
