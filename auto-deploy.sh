#!/bin/bash

# سكريبت النشر التلقائي لـ code-server
# Automatic deployment script for code-server

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║      🚀 سكريبت النشر التلقائي - code-server             ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# ألوان للنص
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# معلومات المشروع
REPO_URL="https://github.com/xx733533-afk/code-server-free"
PROJECT_NAME="code-server-free"

echo -e "${BLUE}📦 المستودع:${NC} $REPO_URL"
echo ""
echo "════════════════════════════════════════════════════════════"
echo ""

# القائمة الرئيسية
echo "اختر منصة النشر:"
echo ""
echo "1) Render.com    (موصى به - الأسهل)"
echo "2) Railway.app   (سريع)"
echo "3) Fly.io        (قوي)"
echo "4) إرشادات يدوية (بدون API)"
echo "5) الخروج"
echo ""
read -p "أدخل اختيارك [1-5]: " choice

case $choice in
    1)
        echo ""
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}✅ اخترت: Render.com${NC}"
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo ""
        echo "للنشر التلقائي على Render، تحتاج إلى API Key:"
        echo ""
        echo "1️⃣  اذهب إلى: https://dashboard.render.com/u/settings#api-keys"
        echo "2️⃣  اضغط: 'Create API Key'"
        echo "3️⃣  انسخ الـ API Key"
        echo ""
        read -p "أدخل Render API Key (أو اترك فارغاً للإرشادات اليدوية): " RENDER_KEY
        
        if [ -z "$RENDER_KEY" ]; then
            echo ""
            echo -e "${BLUE}📖 إرشادات النشر اليدوي على Render:${NC}"
            echo ""
            echo "1. افتح: https://render.com"
            echo "2. سجل دخول بـ GitHub"
            echo "3. New + → Web Service"
            echo "4. اختر المستودع: code-server-free"
            echo "5. Environment: Docker"
            echo "6. Plan: Free"
            echo "7. اضغط: Create Web Service"
            echo ""
            echo -e "${GREEN}✅ بعد 2-3 دقائق، ستحصل على رابطك!${NC}"
            echo ""
        else
            echo ""
            echo -e "${BLUE}🚀 جاري النشر على Render...${NC}"
            echo ""
            
            # استخدام Render API
            RESPONSE=$(curl -s -X POST "https://api.render.com/v1/services" \
                -H "Authorization: Bearer $RENDER_KEY" \
                -H "Content-Type: application/json" \
                -d '{
                    "type": "web_service",
                    "name": "'"$PROJECT_NAME"'",
                    "repo": "'"$REPO_URL"'",
                    "branch": "main",
                    "dockerfilePath": "./Dockerfile",
                    "plan": "free"
                }')
            
            if echo "$RESPONSE" | grep -q "id"; then
                echo -e "${GREEN}✅ تم النشر بنجاح!${NC}"
                echo ""
                SERVICE_URL=$(echo "$RESPONSE" | grep -o '"url":"[^"]*' | cut -d'"' -f4)
                echo -e "${GREEN}🔗 رابطك الدائم:${NC}"
                echo "   $SERVICE_URL"
                echo ""
                echo -e "${BLUE}🔐 كلمة المرور:${NC} freevscode"
            else
                echo -e "${RED}❌ حدث خطأ في النشر${NC}"
                echo "الاستجابة: $RESPONSE"
            fi
        fi
        ;;
    
    2)
        echo ""
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}✅ اخترت: Railway.app${NC}"
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo ""
        echo "للنشر التلقائي على Railway، تحتاج إلى API Token:"
        echo ""
        echo "1️⃣  اذهب إلى: https://railway.app/account/tokens"
        echo "2️⃣  اضغط: 'Create New Token'"
        echo "3️⃣  انسخ الـ Token"
        echo ""
        read -p "أدخل Railway API Token (أو اترك فارغاً للإرشادات اليدوية): " RAILWAY_TOKEN
        
        if [ -z "$RAILWAY_TOKEN" ]; then
            echo ""
            echo -e "${BLUE}📖 إرشادات النشر اليدوي على Railway:${NC}"
            echo ""
            echo "1. افتح: https://railway.app"
            echo "2. سجل دخول بـ GitHub"
            echo "3. New Project → Deploy from GitHub repo"
            echo "4. اختر: code-server-free"
            echo "5. Settings → Generate Domain"
            echo ""
            echo -e "${GREEN}✅ رابطك سيكون جاهزاً فوراً!${NC}"
            echo ""
        else
            echo ""
            echo -e "${BLUE}🚀 جاري النشر على Railway...${NC}"
            echo ""
            echo -e "${YELLOW}ملاحظة: Railway CLI مطلوب للنشر التلقائي${NC}"
            echo "يُفضل استخدام الطريقة اليدوية (أسرع وأسهل)"
        fi
        ;;
    
    3)
        echo ""
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}✅ اخترت: Fly.io${NC}"
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo ""
        echo "للنشر على Fly.io، تحتاج إلى تثبيت flyctl CLI:"
        echo ""
        echo "# تثبيت flyctl"
        echo "curl -L https://fly.io/install.sh | sh"
        echo ""
        echo "# تسجيل الدخول"
        echo "fly auth login"
        echo ""
        echo "# النشر"
        echo "cd /workspace"
        echo "fly launch --name code-server-free"
        echo "fly deploy"
        echo ""
        echo -e "${GREEN}✅ بعد النشر، ستحصل على رابط مثل:${NC}"
        echo "   https://code-server-free.fly.dev"
        echo ""
        ;;
    
    4)
        echo ""
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo -e "${BLUE}📖 إرشادات النشر اليدوي${NC}"
        echo -e "${YELLOW}════════════════════════════════════════════════════════════${NC}"
        echo ""
        echo "اختر منصة:"
        echo ""
        echo "🟢 Render.com (الأسهل - موصى به)"
        echo "   https://render.com"
        echo "   → New + → Web Service → اختر code-server-free"
        echo ""
        echo "🔵 Railway.app (سريع)"
        echo "   https://railway.app"
        echo "   → New Project → Deploy from GitHub"
        echo ""
        echo "🟡 Deta Space (بسيط)"
        echo "   https://deta.space"
        echo "   → New App → Import from GitHub"
        echo ""
        echo "🟣 Fly.io (متقدم)"
        echo "   يحتاج CLI - راجع الخيار 3"
        echo ""
        echo -e "${GREEN}📦 المستودع الجاهز:${NC}"
        echo "   $REPO_URL"
        echo ""
        ;;
    
    5)
        echo ""
        echo -e "${BLUE}👋 شكراً لاستخدامك السكريبت!${NC}"
        exit 0
        ;;
    
    *)
        echo ""
        echo -e "${RED}❌ خيار غير صحيح${NC}"
        exit 1
        ;;
esac

echo ""
echo "════════════════════════════════════════════════════════════"
echo ""
echo -e "${GREEN}💡 نصيحة:${NC} إذا كنت مبتدئ، استخدم Render.com (الأسهل!)"
echo ""
echo "📖 للمزيد من التفاصيل: افتح DEPLOY_NOW.md"
echo ""
echo "════════════════════════════════════════════════════════════"
