# انسخ ده كله Paste في PowerShell في فولدر THEME-LIVE
# حل نهائي لمشكلة gift_card + تصحيح امر الدخول

Write-Host "1- بنتأكد ان gift_card.liquid موجود..." -ForegroundColor Cyan
if (!(Test-Path "templates\gift_card.liquid")) {
  Write-Host "الملف ناقص - بننشئه حالاً" -ForegroundColor Yellow
  @'
{% layout none %}
<!doctype html><html lang="{{ request.locale.iso_code }}"><head><meta charset="utf-8">{{ content_for_header }}<title>Gift Card</title></head><body>Gift card</body></html>
'@ | Out-File -Encoding utf8 "templates\gift_card.liquid"
}
dir templates\gift_card.liquid

Write-Host "`n2- تسجيل الدخول (الصح)" -ForegroundColor Cyan
Write-Host "استخدم: shopify auth login" -ForegroundColor Green
Write-Host "مش: shopify login --store (قديم واتلغى)" -ForegroundColor Red

Write-Host "`n3- شغّل الثيم (اختر واحد)" -ForegroundColor Cyan
Write-Host "  shopify theme dev  (آمن - Preview جديد)" -ForegroundColor Green
Write-Host "  shopify theme dev --theme-id 190134091960  (مباشر Live)" -ForegroundColor Yellow
