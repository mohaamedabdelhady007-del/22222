# دليل السحب السريع - DISTRICT99
# شغّل هذا الملف في PowerShell كـ Administrator

Write-Host "=== DISTRICT99 - Shopify Quick Pull ===" -ForegroundColor Green

# 1. تثبيت Shopify CLI لو مش موجود
if (!(Get-Command shopify -ErrorAction SilentlyContinue)) {
  Write-Host "Installing Shopify CLI..." -ForegroundColor Yellow
  npm install -g @shopify/cli @shopify/theme
}

# 2. تسجيل الدخول
Write-Host "تسجيل الدخول..." -ForegroundColor Cyan
shopify login --store district99-preview.myshopify.com

# 3. سحب الثيم
Write-Host "سحب الثيم الـ Live..." -ForegroundColor Cyan
shopify theme pull --live

# 4. التأكد من gift_card.liquid
if (!(Test-Path "templates\gift_card.liquid")) {
  Write-Host "⚠️  gift_card.liquid ناقص — بننشئه..." -ForegroundColor Yellow
  # الكود سيتم نسخه من الريبو
  Copy-Item -Path "$PSScriptRoot\templates\gift_card.liquid" -Destination "templates\gift_card.liquid" -Force -ErrorAction SilentlyContinue
  if (!(Test-Path "templates\gift_card.liquid")) {
    Write-Host "انسخ ملف templates/gift_card.liquid من الريبو يدوياً" -ForegroundColor Red
  }
} else {
  Write-Host "✓ gift_card.liquid موجود" -ForegroundColor Green
}

# 5. فحص الثيم
Write-Host "فحص الثيم..." -ForegroundColor Cyan
shopify theme check

# 6. تشغيل - اختار
Write-Host ""
Write-Host "اختر طريقة التشغيل:" -ForegroundColor Yellow
Write-Host "1) shopify theme dev (آمن - Preview)" -ForegroundColor Green
Write-Host "2) shopify theme dev --allow-live (مباشر على الـ Live)" -ForegroundColor Red
$choice = Read-Host "اكتب 1 أو 2"

if ($choice -eq "1") { shopify theme dev }
elseif ($choice -eq "2") { shopify theme dev --allow-live }
else { Write-Host "شغل يدوياً: shopify theme dev" }
