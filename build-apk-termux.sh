#!/bin/bash

# AsilParla Mobile APK Build Script for Termux
# Bu script Termux ortamında APK build etmek için kullanılır

set -e

echo "🚀 AsilParla APK Build Script (Termux)"
echo "======================================"

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Mobil uygulama dizini
MOBILE_DIR="apps/mobile"
BUILD_DIR="$MOBILE_DIR/android"

# Kontroller
if [ ! -d "$MOBILE_DIR" ]; then
    echo -e "${RED}❌ Mobil uygulama dizini bulunamadı: $MOBILE_DIR${NC}"
    exit 1
fi

cd "$MOBILE_DIR"

# Node.js kontrolü
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}⚠️  Node.js bulunamadı. Kurulum yapılıyor...${NC}"
    pkg install nodejs -y
fi

# Java kontrolü
if ! command -v java &> /dev/null; then
    echo -e "${YELLOW}⚠️  Java bulunamadı. Kurulum yapılıyor...${NC}"
    pkg install openjdk-17 -y
fi

# Android SDK kontrolü
if [ -z "$ANDROID_HOME" ]; then
    echo -e "${YELLOW}⚠️  ANDROID_HOME ayarlanmamış.${NC}"
    echo -e "${YELLOW}Termux'ta Android SDK kurulumu için:${NC}"
    echo -e "${YELLOW}pkg install android-sdk -y${NC}"
    echo -e "${YELLOW}export ANDROID_HOME=\$PREFIX/opt/android-sdk${NC}"
fi

# Bağımlılıkları yükle
echo -e "${GREEN}📦 Bağımlılıklar yükleniyor...${NC}"
if [ ! -d "node_modules" ]; then
    npm install
else
    npm install
fi

# Metro bundler'ı başlat (arka planda)
echo -e "${GREEN}📦 Metro bundler başlatılıyor...${NC}"
npm start &
METRO_PID=$!

# Biraz bekle
sleep 5

# Android build
echo -e "${GREEN}🔨 Android APK build ediliyor...${NC}"
cd android

# Gradle wrapper'ı çalıştırılabilir yap
chmod +x gradlew

# APK build
./gradlew assembleRelease

# Metro bundler'ı durdur
kill $METRO_PID 2>/dev/null || true

# APK dosyasını bul
APK_FILE=$(find app/build/outputs/apk/release -name "*.apk" | head -1)

if [ -n "$APK_FILE" ]; then
    echo -e "${GREEN}✅ APK başarıyla oluşturuldu!${NC}"
    echo -e "${GREEN}📱 APK dosyası: $APK_FILE${NC}"
    
    # APK'yı ana dizine kopyala
    cp "$APK_FILE" ../../../asilparla-release.apk
    echo -e "${GREEN}📱 APK kopyalandı: ../../../asilparla-release.apk${NC}"
else
    echo -e "${RED}❌ APK dosyası bulunamadı!${NC}"
    exit 1
fi

echo -e "${GREEN}✨ Build tamamlandı!${NC}"
