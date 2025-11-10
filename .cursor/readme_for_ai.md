# Cursor Rehberi — asilParla v1.17.02

**Amaç:** Bu depo, Termux ve Ubuntu/VDS üzerinde hatasız ayağa kalkacak şekilde hazırlanmış monorepo iskeletidir.
Cursor'dan beklenti:
- Boş dosyaları *içeriklerle doldurmak* (API, mobil, admin)
- Gerçek API entegrasyonlarını modüler adapter yapısıyla eklemek
- Testleri çalışır hâle getirmek
- Zip paket ve GitHub Release otomasyonu hazırlamak

**Öncelikler:**
1) `services/api/app` FastAPI v0.109.x + Pydantic v1.10.x uyumu
2) Router'lar: `auth`, `product`, `order`, `ai`, `finance`, `health`, `market_radar`
3) `.env.example` içindeki placeholder'lara dokunma, sadece kullan
4) `scripts/start_all.sh` ile local dev; `tools_deployment/termux/install.sh` ile Termux; `tools_deployment/ubuntu/bootstrap.sh` ile Ubuntu
5) MarketRadar modülü: `ai/market_radar/*` dosyalarını tamamla, config: `config/policies/market_radar_rules.yaml`
6) Tüm yeni dosyalarda Türkçe açıklayıcı yorumlar

**Çıktı:** Çalışır API + Admin mock UI + Mobil iskelet + Testler + Zip/Release pipeline.
