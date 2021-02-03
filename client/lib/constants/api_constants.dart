// API endpoints

const String API_URL = 'http://192.168.1.131:8000/api/';
const String TEACHER_URL = API_URL + 'teacher/';
const String EMAIL_QUERY_TEACHER_URL = TEACHER_URL + '?email=';
const String CLASS_URL = API_URL + 'class/';
const String CLASS_QUERY_ID_URL = CLASS_URL + '?id=';
const String STUDENT_URL = API_URL + 'student/';
const String EMAIL_QUERY_STUDENT_URL = STUDENT_URL + '?email=';
const String CLASS_QUERY_FOR_STUDENT = '&class=';
const String UNITS_URL = API_URL + 'unit/';
const String ASSESSMENTS_URL = API_URL + 'assessment/?class=';
const String MARKS_URL = API_URL + 'mark/';
const String ANNOUNCEMENT_URL = API_URL + 'announcement/';