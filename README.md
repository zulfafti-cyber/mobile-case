# Katalog Layanan IT — Aplikasi Navigasi Flutter

Aplikasi demo navigasi antar screen menggunakan Flutter:
- **Screen 1 (Beranda)** — `StatelessWidget`, menampilkan daftar 3 katalog memakai `ListView.builder` + `ListTile`.
- **Screen 2 (Detail Katalog)** — `StatefulWidget`, memakai `Column` vertikal, punya Icon back manual, `Text` nama, `Container` pastel untuk bio, dan tombol `Follow` yang state-nya berubah (contoh event & state).
- **Screen 3 (Paket Harga)** — bonus, diakses dari tombol "Lihat Paket Harga" di Screen 2.

Navigasi antar screen memakai `Navigator.push` (Stack Navigation), dan setiap Scaffold memakai `AppBar` sehingga tombol kembali bawaan (device/Screen) otomatis tersedia.

## 1. Persyaratan

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stabil, versi terbaru)
- Editor: VS Code atau Android Studio + plugin Flutter/Dart
- Emulator Android/iOS, atau browser (untuk target web), atau perangkat fisik yang sudah diaktifkan mode USB debugging

Cek instalasi Flutter:

```bash
flutter doctor
```

Pastikan semua item bertanda centang (minimal untuk platform target kamu).

## 2. Setup Project

1. Clone repository:
   ```bash
   git clone <URL_REPOSITORY_KAMU>
   cd <nama_folder_project>
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Pastikan struktur folder `lib/` sesuai:
   ```
   lib/
   ├── main.dart
   ├── user_model.dart
   ├── pricing_page.dart
   └── screen/
       ├── home_page.dart
       └── profile.dart
   ```

## 3. Menjalankan Aplikasi (Server Lokal / Debug)

Aplikasi ini adalah aplikasi Flutter murni (client-side), sehingga "server lokal" di sini adalah proses `flutter run` yang menghidupkan Dart VM/dev server untuk hot reload.

1. Cek perangkat yang tersedia:
   ```bash
   flutter devices
   ```
2. Jalankan aplikasi (pilih salah satu):
   ```bash
   flutter run                 # ke perangkat/emulator default
   flutter run -d chrome       # jalankan sebagai web di Chrome
   flutter run -d <device_id>  # ke perangkat tertentu
   ```
3. Selama development, tekan `r` di terminal untuk **hot reload**, atau `R` untuk **hot restart**.

## 4. Import Database MySQL

Aplikasi versi saat ini **belum terhubung ke database MySQL** — semua data katalog (`users`) masih berupa data statis (dummy) di `lib/user_model.dart`. Jadi tidak ada file `.sql` yang perlu di-import untuk menjalankan aplikasi ini.

Jika ke depannya project dikembangkan agar mengambil data dari MySQL (misalnya lewat REST API/backend PHP-Laravel), alurnya kurang lebih:

1. Siapkan MySQL server (XAMPP/Laragon/Docker) dan buat database baru, contoh:
   ```sql
   CREATE DATABASE katalog_it;
   ```
2. Import skema/data:
   ```bash
   mysql -u root -p katalog_it < database/katalog_it.sql
   ```
3. Buat backend/API sederhana (Node.js/Express, atau PHP) yang membaca tabel tersebut dan mengembalikan JSON.
4. Di Flutter, ganti sumber data statis `users` di `user_model.dart` dengan pemanggilan HTTP (`package:http`) ke endpoint API tersebut, lalu parse JSON menjadi `UserModel`/`UserData`.

## 5. Struktur Fitur Sesuai Tugas

| Poin Tugas | Lokasi Implementasi |
|---|---|
| Screen 1 StatelessWidget + ListView 3 cards | `lib/screen/home_page.dart` |
| Navigasi Stack (`Navigator.push`) | `onTap` di `ListTile`, `lib/screen/home_page.dart` |
| Screen 2 StatefulWidget + Column | `lib/screen/profile.dart` |
| Icon back manual di Screen 2 | `IconButton(Icons.arrow_back, ...)` di awal `Column`, `lib/screen/profile.dart` |
| Text nama/harga | `Text(widget.user.name, ...)` |
| Container pastel + padding untuk bio | `Container` dengan `Color(0xFFE0F7F5)` |
| AppBar di setiap Screen | `Scaffold(appBar: AppBar(...))` di semua screen |
| Event & state | `_toggleFollow()` + `setState()` mengubah tombol Follow/Following |
