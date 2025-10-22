
# Hello App 2 - Rails Ödev Projesi

Bu repository, Ruby on Rails (Rails 8.1) ile oluşturulmuş basit bir "Hello" uygulamasının başlangıç noktasıdır. Proje, ödev yönergelerine göre 3 model ile yapılmış temel gereksinimi sağlar. İsteğe bağlı olarak 5 model ile genişletmeye uygun yapılandırma mevcuttur.

## Genel Bilgi

- Ruby sürümü: 3.4.7
- Rails sürümü: 8.1.x
- Platform: Windows (PowerShell örnek komutları)
- Oluşturulan uygulama: `hello_app2`

## Proje Kriterleri ve Puanlama

- Bu aşamaya kadar yapılan temel uygulama: 75 puan.
- Sadece API (frontend yok) yapanlar: +25 puan (toplam 100).
- EKSTRA: 5 model (3 yerine 5 model) uygulayanlara ek +20 puan.

Toplam mümkün puan 120 (ekstra ile). Ancak ödev tesliminde maksimum 100 olarak değerlendirilecektir. Not: Değerlendirme kriterleri ders sorumlusu tarafından kesinleştirilecektir.

## Teslim Gereksinimleri

Repositoryde bulunması gerekenler:

1. Proje kaynak kodu (tam uygulama)
2. `README.md` (kurulum, çalıştırma, model açıklamaları, API dökümü)
3. Veritabanı şeması (`db/schema.rb` veya `structure.sql`)
4. Testler (varsa)
5. Postman veya benzeri API koleksiyonu (opsiyonel fakat tavsiye edilir)
6. Her ödev için ayrı bir rapor (PDF veya Markdown) — raporlar `reports/` klasörüne konacak.
7. GitHub repo linki (ödev tesliminde paylaşılacak)

Son teslim tarihi: 22.10.2025, 23:59 (Çarşamba gece 23:59)

## Kurulum (Windows - PowerShell)

Aşağıdaki komutları PowerShell üzerinde çalıştırarak projeyi yerel olarak kurabilirsiniz:

```powershell
# Projeyi klonla (örnek):
# git clone https://github.com/<kullanici>/<repo>.git
cd C:\Users\memir\OneDrive\Desktop\ODEV\hello_app2

# Ruby ve bundler kurulu olduğunu varsayıyoruz
bundle install

# Veritabanı oluşturma (eğer Active Record kullanılıyorsa):
# rails db:create db:migrate

# Sunucuyu başlat
rails server
# Tarayıcıda aç: http://localhost:3000
```

## API ve Modeller (Örnek: 5 Model Senaryosu)

Aşağıda örnek 5 model ve ilişkileri verilmiştir (Okul Yönetim Sistemi örneği):

1. Student (öğrenci)
2. Teacher (öğretmen)
3. Course (ders)
4. Exam (sınav)
5. Grade (not)

Model ilişkileri (kısa):

- Student has_many :grades
- Student has_many :exams, through: :grades
- Teacher has_many :courses
- Course belongs_to :teacher
- Course has_many :exams
- Exam belongs_to :course
- Grade belongs_to :student
- Grade belongs_to :exam

### Örnek API endpoints (namespaced under `/api/v1` önerilir)

- GET /api/v1/students
- POST /api/v1/students
- GET /api/v1/teachers
- POST /api/v1/courses
- GET /api/v1/courses/:id/exams
- POST /api/v1/exams
- POST /api/v1/grades
- GET /api/v1/students/:id/grade_report

Örnek JSON istek/yanıtlar README içinde ayrıntılandırılmalıdır (ders tesliminde).

## Ödev Raporu

Her öğrenci/öğrenci grubu, proje ile ilgili kısa bir rapor yükleyecektir. Raporda şu başlıklar bulunmalıdır:

- Projenin amacı
- Hangi modeller oluşturuldu
- Model ilişkileri (ER diyagramı)
- Konfigürasyon ve kurulum adımları
- Nasıl çalıştırılır
- API dökümantasyonu (örnek istek/yanıt)
- Bilinen eksiklikler ve geliştirme önerileri

Raporlar `reports/` klasöründe saklanmalı ve GitHub repo linki ödev teslim formuna eklenmelidir.

## Örnek README İmza

Hazırlayan: <Mustafa Emir Kincal>
Öğrenci No: <231118055>
Ders: <Yazilim Gerceklestirme Ve Test>
Teslim Tarihi: 22.10.2025


---

Bu dosyayı isterseniz genişletebilirim: API örnekleri, Postman koleksiyonu, örnek rapor şablonu veya otomatik testler ekleyebilirim.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
