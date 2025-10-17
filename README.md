# Code-Server Free Deployment on Deta Space

## نشر code-server مجاني ودائم على Deta Space

### 🌟 المميزات
- ✅ مجاني تمامًا بدون بطاقة ائتمان
- ✅ رابط دائم لا ينتهي
- ✅ لا يحتاج API أو مفاتيح
- ✅ VS Code في المتصفح

---

## 📋 خطوات النشر (Deployment Steps)

### 1️⃣ رفع المشروع على GitHub
```bash
# إذا لم تكن قد أنشأت مستودع بعد
git init
git add .
git commit -m "Initial commit: code-server deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/code-server-deploy.git
git push -u origin main
```

### 2️⃣ النشر على Deta Space

1. **افتح الموقع**: [https://deta.space](https://deta.space)
2. **سجل الدخول** بحساب GitHub
3. **اضغط على**: "Create a Project" أو "New App"
4. **اختر**: "Import from GitHub"
5. **اربط المستودع**: اختر `code-server-deploy`
6. **اضغط Deploy**

### 3️⃣ الوصول للتطبيق

بعد دقائق قليلة، سيظهر لك رابط دائم مثل:
```
https://code-server-free-<random>.deta.space
```

**كلمة المرور الافتراضية**: `freevscode`

---

## 🔧 الملفات المطلوبة (Required Files)

### Dockerfile
يحتوي على إعدادات code-server:
- البورت: `8080`
- كلمة المرور: `freevscode`
- المصادقة: تفعيل

### Spacefile
ملف إعدادات Deta Space للنشر التلقائي

---

## ⚙️ تخصيص الإعدادات (Customization)

### تغيير كلمة المرور
في ملف `Dockerfile`، غيّر السطر:
```dockerfile
ENV PASSWORD=freevscode
```
إلى:
```dockerfile
ENV PASSWORD=your_new_password
```

### إضافة Extensions
أضف في `Dockerfile`:
```dockerfile
RUN code-server --install-extension <extension-id>
```

---

## 🚀 نشر تلقائي عبر GitHub Actions (Optional)

إذا أردت نشر تلقائي عند كل Push، يمكن إضافة ملف Workflow.

---

## 📝 ملاحظات مهمة

- **Deta Space** توفر نشر مجاني بدون حدود زمنية
- الرابط يبقى دائمًا فعال
- يمكنك إضافة مشاريعك داخل code-server
- يدعم جميع extensions المتاحة في VS Code

---

## 🌐 Features (English)

- ✅ **100% Free** - No credit card required
- ✅ **Permanent Link** - Never expires
- ✅ **No API Keys** - Easy setup
- ✅ **VS Code in Browser** - Access anywhere

---

## 🔗 روابط مفيدة (Useful Links)

- [Deta Space](https://deta.space)
- [Code-Server Documentation](https://coder.com/docs/code-server)
- [Deta Space Docs](https://deta.space/docs)

---

## 📞 الدعم (Support)

إذا واجهت أي مشكلة، تأكد من:
1. ✅ الملفات موجودة في الجذر
2. ✅ GitHub repository عام (public)
3. ✅ اتبعت الخطوات بالترتيب

---

**Made with ❤️ for free coding in the cloud**
