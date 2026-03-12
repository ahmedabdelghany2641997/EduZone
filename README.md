<div align="center">

# 🎓 Eduzone - E-Learning Platform
**A modern cross-platform E-learning solution built with Flutter and Supabase.**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)](https://supabase.com)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

<img src="https://github.com/SP-XD/SP-XD/blob/main/images/dev-working_rounded.gif?raw=true" alt="Development" width="45%"/>
</div>

<hr>

### 🛠️ المهارات والأدوات المستخدمة (Tech Stack & Tools)
<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=flat&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/State-Bloc/Cubit-blue" alt="BLoC">
  <img src="https://img.shields.io/badge/Architecture-Clean_Architecture-green" alt="Clean Architecture">
  <img src="https://img.shields.io/badge/Backend-Supabase-3ECF8E?style=flat&logo=supabase&logoColor=white" alt="Supabase">
</p>

---

## 🚀 نظرة عامة (Overview)
**Eduzone** هو تطبيق تعليمي متكامل يوفر تجربة تعلم ذكية وسريعة. يعتمد المشروع على قوة **Supabase** في إدارة البيانات اللحظية والملفات، مع واجهات مستخدم احترافية تم بناؤها باستخدام **Flutter** لضمان أفضل أداء.

## ✨ المميزات التقنية (Technical Features)
* 📺 **Dynamic Streaming:** نظام بث محتوى تعليمي مرن.
* ⚡ **Real-time Synchronization:** مزامنة فورية للبيانات بين التطبيق و Supabase.
* 🏗️ **Architectural Design:** تطبيق كامل لمبادئ **Clean Architecture** لضمان فصل المهام.
* 🛡️ **SOLID Principles:** الالتزام بقواعد الكود النظيف لجعل المشروع قابلاً للتوسع (Scalable).
* 🔐 **Secure Auth:** إدارة هويات المستخدمين بشكل آمن عبر Supabase Auth.

## 📂 هيكلة المشروع (Folder Structure)
تم تنظيم الملفات باتباع نمط **Clean Architecture**:
```text
lib/
 ├── core/          # Utilities, themes, and DI (GetIt)
 ├── data/          # Repositories & Data Sources (Supabase Integration)
 ├── domain/        # Use Cases & Entities (Business Logic)
 └── presentation/  # UI Widgets & State Management (BLoC/Cubit)
