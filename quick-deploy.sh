#!/bin/bash

# سكريبت النشر السريع لـ code-server
# Quick deployment script for code-server

echo "🚀 Code-Server Quick Deploy Script"
echo "===================================="
echo ""

# التحقق من وجود git
if ! command -v git &> /dev/null; then
    echo "❌ Git غير مثبت. يرجى تثبيت git أولاً"
    exit 1
fi

echo "📝 الخطوة 1: إعداد Git"
git config --global user.email "deploy@code-server.com" 2>/dev/null
git config --global user.name "Code Server Deploy" 2>/dev/null

# التحقق من المستودع
if [ ! -d .git ]; then
    echo "📦 تهيئة مستودع Git..."
    git init
fi

echo ""
echo "📋 الخطوة 2: إضافة الملفات"
git add .
git status --short

echo ""
echo "💾 الخطوة 3: إنشاء Commit"
git commit -m "Deploy code-server to Deta Space" 2>/dev/null || echo "✅ الملفات مضافة بالفعل"

echo ""
echo "===================================="
echo "✅ المشروع جاهز للنشر!"
echo ""
echo "🔗 الخطوات التالية:"
echo ""
echo "1️⃣  إنشاء مستودع GitHub:"
echo "   - اذهب إلى: https://github.com/new"
echo "   - اسم المستودع: code-server-deploy"
echo "   - اجعله Public"
echo "   - لا تضف README"
echo ""
echo "2️⃣  ربط ورفع الكود:"
echo "   git remote add origin https://github.com/YOUR_USERNAME/code-server-deploy.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3️⃣  النشر على Deta Space:"
echo "   - اذهب إلى: https://deta.space"
echo "   - سجل دخول بحساب GitHub"
echo "   - اختر: New App → Import from GitHub"
echo "   - اختر المستودع: code-server-deploy"
echo "   - اضغط: Deploy"
echo ""
echo "4️⃣  احصل على رابطك الدائم!"
echo "   - بعد 2-3 دقائق ستحصل على رابط مثل:"
echo "   - https://code-server-free-xxxxx.deta.app"
echo "   - كلمة المرور: freevscode"
echo ""
echo "===================================="
echo "📚 للمزيد من المساعدة، افتح: DEPLOY_GUIDE.md"
echo "===================================="
