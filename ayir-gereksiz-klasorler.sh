#!/bin/bash

# Gereksiz klasörleri ayırma scripti
# Mobil uygulama için gerekli olmayan klasörleri ayrı bir yere taşır

set -e

echo "📁 Gereksiz klasörleri ayırılıyor..."
echo "===================================="

# Taşınacak klasörler (mobil uygulama için gerekli olmayanlar)
GEREKSIZ_KLASORLER=(
    "services"
    "apps/admin"
    "docker"
    "scripts"
    "compliance"
    "monitoring"
    "system_enhancements"
    "tools"
    "tests"
    "docs"
    "automation"
    "backup"
    "tools_deployment"
    "config"
    "i18n/formats"
    "i18n/locales"
    "legal"
    "accessibility"
)

# Ayrı klasör oluştur
AYRI_KLASOR="ayrilmis-gereksiz-klasorler"
mkdir -p "$AYRI_KLASOR"

# Her klasörü taşı
for klasor in "${GEREKSIZ_KLASORLER[@]}"; do
    if [ -d "$klasor" ]; then
        echo "📦 Taşınıyor: $klasor"
        mv "$klasor" "$AYRI_KLASOR/"
        echo "✅ Taşındı: $klasor"
    else
        echo "⚠️  Bulunamadı: $klasor"
    fi
done

# Mobil uygulama için gerekli dosyaları koru
echo ""
echo "✅ İşlem tamamlandı!"
echo "📱 Mobil uygulama için gerekli klasörler korundu:"
echo "   - apps/mobile/"
echo "   - package.json (root)"
echo "   - babel.config.js"
echo "   - metro.config.js"
echo ""
echo "📦 Gereksiz klasörler şuraya taşındı: $AYRI_KLASOR/"
