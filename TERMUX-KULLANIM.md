# Termux'ta APK Build Rehberi

Bu rehber, AsilParla mobil uygulamasını Termux ortamında APK'ya derlemek için adım adım talimatlar içerir.

## 📋 Gereksinimler

### 1. Termux Kurulumu
Termux'u Google Play Store'dan veya F-Droid'dan indirin ve kurun.

### 2. Paket Güncellemesi
```bash
pkg update && pkg upgrade
```

### 3. Gerekli Paketlerin Kurulumu

```bash
# Temel paketler
pkg install nodejs openjdk-17 git wget curl -y

# Android SDK (opsiyonel, eğer gerekirse)
pkg install android-sdk -y
export ANDROID_HOME=$PREFIX/opt/android-sdk
```

## 🚀 Adım Adım Build İşlemi

### Adım 1: Gereksiz Klasörleri Ayırma

Mobil uygulama için gerekli olmayan klasörleri ayırmak için:

```bash
cd /workspace
bash ayir-gereksiz-klasorler.sh
```

Bu script şu klasörleri `ayrilmis-gereksiz-klasorler/` klasörüne taşır:
- `services/` (Backend servisleri)
- `apps/admin/` (Admin paneli)
- `docker/` (Docker dosyaları)
- `scripts/` (Deployment scriptleri)
- `compliance/`, `monitoring/`, `system_enhancements/` vb.

### Adım 2: Mobil Uygulama Dizinine Geçme

```bash
cd apps/mobile
```

### Adım 3: Bağımlılıkları Yükleme

```bash
npm install
```

**Not:** Bu işlem biraz zaman alabilir (5-10 dakika).

### Adım 4: Android Build

#### Otomatik Build (Önerilen)

```bash
cd /workspace
bash build-apk-termux.sh
```

Bu script:
1. Gerekli paketleri kontrol eder
2. Bağımlılıkları yükler
3. Metro bundler'ı başlatır
4. Android APK'yı build eder
5. APK dosyasını root dizine kopyalar

#### Manuel Build

```bash
cd apps/mobile/android
chmod +x gradlew
./gradlew assembleRelease
```

### Adım 5: APK Dosyasını Bulma

Build işlemi tamamlandıktan sonra APK dosyası şu konumda olacak:

```
/workspace/asilparla-release.apk
```

veya

```
apps/mobile/android/app/build/outputs/apk/release/app-release.apk
```

## 🔧 Sorun Giderme

### Hata: "Java bulunamadı"
```bash
pkg install openjdk-17 -y
```

### Hata: "Node.js bulunamadı"
```bash
pkg install nodejs -y
```

### Hata: "Gradle bulunamadı"
Gradle wrapper otomatik olarak indirilecektir. İlk build biraz zaman alabilir.

### Hata: "Metro bundler başlatılamıyor"
```bash
cd apps/mobile
npm start
```
Ayrı bir terminalde çalıştırın ve build işlemini tekrar deneyin.

### Hata: "ANDROID_HOME ayarlanmamış"
Termux'ta genellikle Android SDK gerekmez, ancak eğer gerekirse:
```bash
pkg install android-sdk -y
export ANDROID_HOME=$PREFIX/opt/android-sdk
```

### Build Çok Yavaş
- Termux'ta build işlemi normalden daha yavaş olabilir
- Sabırlı olun, ilk build 15-30 dakika sürebilir
- Sonraki build'ler daha hızlı olacaktır

## 📱 APK'yı Yükleme

1. APK dosyasını Android cihazınıza aktarın
2. Cihazınızda "Bilinmeyen kaynaklardan yükleme" iznini açın
3. APK dosyasına dokunarak yükleyin

## ⚠️ Önemli Notlar

1. **İlk Build:** İlk build işlemi çok uzun sürebilir (15-30 dakika)
2. **Disk Alanı:** En az 2-3 GB boş alan gerekir
3. **Bellek:** Build sırasında yeterli RAM gerekir
4. **İnternet:** İlk build için aktif internet bağlantısı gerekir (bağımlılıklar indirilecek)

## 🎯 Hızlı Başlangıç

Tüm işlemleri tek seferde yapmak için:

```bash
# 1. Gereksiz klasörleri ayır
bash ayir-gereksiz-klasorler.sh

# 2. APK build
bash build-apk-termux.sh

# 3. APK dosyasını bul
ls -lh asilparla-release.apk
```

## 📞 Destek

Sorun yaşarsanız:
1. Build loglarını kontrol edin
2. Hata mesajlarını okuyun
3. Gerekli paketlerin kurulu olduğundan emin olun
