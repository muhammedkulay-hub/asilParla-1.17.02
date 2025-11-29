# AsilParla Mobile App

React Native tabanlı mobil uygulama.

## Termux'ta APK Build

### Gereksinimler

```bash
# Termux paketlerini güncelle
pkg update && pkg upgrade

# Gerekli paketleri kur
pkg install nodejs openjdk-17 git -y

# Android SDK kurulumu (opsiyonel, eğer Android SDK gerekiyorsa)
pkg install android-sdk -y
export ANDROID_HOME=$PREFIX/opt/android-sdk
```

### Build İşlemi

1. **Gereksiz klasörleri ayır:**
```bash
cd /workspace
bash ayir-gereksiz-klasorler.sh
```

2. **APK build:**
```bash
cd /workspace
bash build-apk-termux.sh
```

3. **APK dosyası:**
Build işlemi tamamlandıktan sonra APK dosyası şu konumda olacak:
- `asilparla-release.apk` (root dizinde)

### Manuel Build

```bash
cd apps/mobile
npm install
cd android
chmod +x gradlew
./gradlew assembleRelease
```

APK dosyası: `android/app/build/outputs/apk/release/app-release.apk`

## Geliştirme

```bash
# Metro bundler başlat
npm start

# Android'de çalıştır
npm run android

# iOS'ta çalıştır (macOS gerekli)
npm run ios
```

## Yapı

- `src/` - Kaynak kodlar
- `android/` - Android native kodlar
- `assets/` - Statik dosyalar (resimler, fontlar, sesler)
