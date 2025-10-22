# API Örnekleri - hello_app2

Bu doküman `hello_app2` projesi için örnek API çağrıları ve JSON örnekleri içerir. Aşağıdaki örnekler `api/v1` namespace'i altında çalışacak şekilde tasarlanmıştır.

Not: Eğer uygulamanız API-only ise `--api` ile Rails oluşturulması tercih edilir. Bu örneklerde basit `curl` ve PowerShell (`Invoke-RestMethod`) örnekleri verilmiştir.

## Modeler

- Student
- Teacher
- Course
- Exam
- Grade

## Örnek Endpoints ve Gövdeler

### Students

- GET /api/v1/students
  - Açıklama: Tüm öğrencileri listeler
  - Örnek (curl):

```bash
curl -s http://localhost:3000/api/v1/students | jq
```

- POST /api/v1/students
  - Açıklama: Yeni öğrenci oluşturur
  - Örnek JSON gövde:

```json
{
  "student": {
    "name": "Ahmet Yılmaz",
    "student_number": "2025001",
    "email": "ahmet@example.com",
    "birth_date": "2006-05-12",
    "grade": "10"
  }
}
```

- PowerShell örneği (POST):

```powershell
$body = @{
  student = @{
    name = 'Ahmet Yılmaz'
    student_number = '2025001'
    email = 'ahmet@example.com'
    birth_date = '2006-05-12'
    grade = '10'
  }
} | ConvertTo-Json

Invoke-RestMethod -Uri http://localhost:3000/api/v1/students -Method Post -Body $body -ContentType 'application/json'
```

### Teachers

- POST /api/v1/teachers

```json
{
  "teacher": {
    "name": "Mehmet Öztürk",
    "specialization": "Mathematics",
    "email": "mehmet@example.com",
    "phone": "+90-532-000-0000",
    "start_date": "2020-09-01"
  }
}
```

### Courses

- POST /api/v1/courses

```json
{
  "course": {
    "course_name": "Calculus I",
    "course_code": "MATH101",
    "credits": 4,
    "semester": "Fall",
    "teacher_id": 1
  }
}
```

### Exams

- POST /api/v1/exams

```json
{
  "exam": {
    "course_id": 1,
    "date": "2025-11-15T09:00:00Z",
    "exam_type": "Midterm",
    "duration": 90,
    "max_score": 100
  }
}
```

### Grades

- POST /api/v1/grades

```json
{
  "grade": {
    "student_id": 1,
    "exam_id": 1,
    "score": 85,
    "comment": "Good work",
    "evaluation_date": "2025-11-16"
  }
}
```

### Özel Endpoint: Öğrencinin Not Raporu

- GET /api/v1/students/:id/grade_report
  - Açıklama: Öğrencinin tüm notlarını ve ortalamasını döner.
  - Örnek yanıt:

```json
{
  "student_id": 1,
  "student_name": "Ahmet Yılmaz",
  "grades": [
    { "course": "Calculus I", "exam_type": "Midterm", "score": 85 },
    { "course": "Calculus I", "exam_type": "Final", "score": 90 }
  ],
  "average": 87.5
}
```

## Notlar

- İsteklerin çalışması için controller'larda strong params, model validasyonları ve uygun ilişkilerin kurulmuş olması gerekir.
- Eğer uygulama `--api` ile oluşturulmadıysa `respond_to :json` ve `render json:` şeklinde controller düzenlemeleri yapın.
- İsterseniz ben bu endpoints'ler için controller, serializer (ActiveModel::Serializers veya fast_jsonapi), ve örnek testler oluşturabilirim.
