# DISTRICT99 — Shopify Theme LIVE

ثيم شوبيفاي OS 2.0 جاهز للسحب والتعديل المباشر — مبني لمحل `district99-preview.myshopify.com`

## ✅ حل مشكلة السكرين: Failed to delete `templates/gift_card.liquid`

الايرور اللي ظهر عندك:
```
error
Failed to delete file "templates/gift_card.liquid" from remote theme.
Failed to delete templates/gift_card.liquid: -templates/gift_card.liquid could not be deleted
```

**السبب:** شوبيفاي بيعتبر `gift_card.liquid` ملف محمي (protected). لما تشتغل `shopify theme dev --allow-live` وتحاول تعمل Sync، لو الملف مش موجود Local هيحاول يمسحه من الـ Live — وشوبيفاي بيرفض.

**الحل (تم تطبيقه في هذا الريبو):**
1. الملف موجود الآن: `templates/gift_card.liquid` ✅
2. متستخدمش `--allow-live` مع `theme dev` إلا للضرورة — اشتغل على Preview Theme
3. لو لازم `--allow-live`، تأكد ان `gift_card.liquid` موجود Local قبل ما تعمل dev

---

## 🚀 كيف تسحب الثيم وتعدل مباشر (الطريقة الصح)

### المتطلبات على جهازك (Windows)
- Node.js 18+ 
- Shopify CLI: `npm install -g @shopify/cli @shopify/theme`

### 1) تسجيل الدخول
```powershell
shopify login --store district99-preview.myshopify.com
# هيفتح المتصفح — سجل دخول بايميل صاحب المتجر
```

### 2) سحب الثيم الـ LIVE (زي ما عملت)
```powershell
cd E:\GOOD-JOOOP\THEME-LIVE
shopify theme pull --live
# هيقولك:
# [1] https://district99-preview.myshopify.com
# [2] https://district99-preview.myshopify.com/admin/themes/190134091960/editor
```

> ملاحظة: الأمر ده بينزل كل ملفات `assets/config/layout/sections/snippets/templates` عندك Local.

### 3) التشغيل — اختار واحدة من الطريقتين

**✅ الطريقة الآمنة (مستحسنة): بدون --allow-live**
```powershell
shopify theme dev
# هيعمل لك Development Theme جديد (preview ID مختلف مثل 189905928376)
# تقدر تشوفه على: https://district99-preview.myshopify.com/?preview_theme_id=189905928376
# وتشيره لأي حد بالرابط: Share your theme preview (p) [2]
```
دي **مش هتلمس الـ Live** إلا لما تعمل `shopify theme push --live` بإيدك.

**⚠️ الطريقة المباشرة (اللي كنت بتستخدمها):**
```powershell
shopify theme dev --allow-live
# ده بيعدل على الـ Live مباشرة (ID 190134091960)
# أي حفظ في VS Code = يظهر فوراً على المتجر الحقيقي
```
لو استخدمتها لازم تتأكد ان `templates/gift_card.liquid` موجود — ولو ظهر نفس الايرور نفّذ:
```powershell
# تأكد الملف موجود
dir templates\gift_card.liquid
# لو مش موجود — انسخه من الريبو ده
# أو شغل:
shopify theme check
```

### 4) التعديل
- افتح `THEME-LIVE` في VS Code
- عدّل أي ملف (`sections/hero-banner.liquid`, `assets/base.css`, `templates/index.json` ...)
- احفظ `Ctrl+S` — المتصفح هيعمل Reload تلقائي (Hot Reload)

### 5) الرفع للـ Live بعد ما تخلص
```powershell
# بعد ما تختبر على Preview وتتأكد كل حاجة تمام
shopify theme push --live
# أو لو شغال --allow-live خلاص هو Live أصلاً
```

---

## 📁 هيكل الثيم الحالي (جاهز في هذا الريبو)

```
THEME-LIVE/
├─ layout/theme.liquid + password.liquid
├─ templates/
│  ├─ index.json (هيرو + بيست سيلر + مميزات + نيوزليتر)
│  ├─ product.json / collection.json / cart.json / search.json
│  ├─ gift_card.liquid  ← حل الايرور
│  └─ 404.json / blog.json ...
├─ sections/
│  ├─ header.liquid / footer.liquid / announcement-bar.liquid
│  ├─ hero-banner.liquid / featured-collection.liquid
│  ├─ image-with-text.liquid / multicolumn.liquid / newsletter.liquid
│  └─ main-product.liquid / main-collection-*.liquid / main-cart-*.liquid
├─ snippets/product-card.liquid
├─ assets/base.css + theme.css + global.js  (ستايل DISTRICT99 اسود/اصفر)
├─ config/settings_schema.json + settings_data.json
└─ locales/en.default.json + ar.json (عربي/انجليزي + RTL)
```

**ستايل DISTRICT99:** خلفية سوداء `#0a0a0a` + اصفر نيون `#ccff00` + خطوط Cairo/Inter + كروت براديوس 16px — مناسب لبراند ستريت وير.

---

## 🎨 عايز تعدل ايه بالظبط؟

قلّي واحدة من دول وأنا أعدلها لك فوراً وأرفعها:

- **ألوان / لوجو / خطوط**
- **الهيرو بانر (صورة + نص + زرار)**
- **صفحة المنتج (مقاسات، ألوان، زرار واتساب، جدول مقاسات)**
- **الهيدر / الفوتر / المينيو**
- **عربي RTL كامل**
- **إضافة سكشن جديد (ريفيوز، انستجرام فيد، عدّاد عروض)**

ابعت لي السكرين/التصميم اللي عايز شبهه وأنا أظبطه Pixel Perfect.

---

## 🩹 حل سريع لو الايرور رجع تاني

```powershell
# 1) تأكد الملف موجود
copy templates\gift_card.liquid templates\gift_card.liquid.bak
# لو مش موجود — استخدم الملف اللي في الريبو ده

# 2) اعمل ignore مؤقت (لو عايز)
echo "templates/gift_card.liquid" >> .shopifyignore

# 3) شغل dev بدون allow-live
shopify theme dev
```

## 📞 روابطك الحالية (من السكرين)
- المتجر: https://district99-preview.myshopify.com
- محرر الثيم: https://district99-preview.myshopify.com/admin/themes/190134091960/editor
- Preview Dev: http://127.0.0.1:9292
- Preview Theme ID: 189905928376 → https://district99-preview.myshopify.com/?preview_theme_id=189905928376

---

> هذا الريبو الآن فيه ثيم كامل جاهز للـ Push. تقدر تعمل `shopify theme push --unpublished` لتجربته كـ Draft، أو `shopify theme push --live` لو عايز ترفعه مباشر.
