# Ödev Raporu - Şablon

Aşağıdaki şablonu kullanarak projeniz için kısa bir rapor hazırlayın. Dosya adı şu biçimde olmalıdır: `reports/TakimAdi_OgrenciNo_Rapor.md` veya tek öğrenci için `reports/Ad_Soyad_No_Rapor.md`.

## 1. Projenin Adı

Örn: Okul Yönetim Sistemi - hello_app2

## 2. Hazırlayan

- İsim: 
- Öğrenci No:
- Grup (varsa):

## 3. Projenin Amacı

Kısa açıklama (2-4 cümle)

## 4. Kullanılan Teknolojiler

- Ruby 3.4.7
- Rails 8.1.x
- Veritabanı: SQLite3 (veya PostgreSQL)

## 5. Model Listesi ve Alanlar

Her model için tablo:

- Student: id, name, student_number, email, birth_date, grade, created_at, updated_at
- Teacher: id, name, specialization, email, phone, start_date, created_at, updated_at
- Course: id, course_name, course_code, credits, semester, teacher_id, created_at, updated_at
- Exam: id, course_id, date, exam_type, duration, max_score, created_at, updated_at
- Grade: id, student_id, exam_id, score, comment, evaluation_date, created_at, updated_at

## 6. Model İlişkileri (ER Diyagramı)

Kısa metinle ilişki açıklamaları ve basit ASCII diyagramı ya da ilişki listesi.

## 7. API Dökümantasyonu

Kullanılan endpointler, istek örnekleri ve örnek yanıtlar. (`docs/API_EXAMPLES.md` referansı)

## 8. Kurulum ve Çalıştırma

Adım adım kurulum talimatları (README ile benzer).

## 9. Testler

Varsa testlerin nasıl çalıştırılacağı ve hangi senaryoların kapsandığı.

## 10. Bilinen Eksiklikler ve Geliştirme Önerileri

Kısa liste halinde eksikler ve yapılabilecek geliştirmeler.

## 11. GitHub Repo Linki

https://github.com/<kullanici>/<repo>

## 12. Teslim Bilgileri

- Son teslim tarihi: 22.10.2025 23:59
- Dosyalar: kaynak kodu, README.md, db/schema.rb, tests/, reports/, docs/

---

Hazırlayan: <Adınız>
Tarih: <Teslim Tarihi>
