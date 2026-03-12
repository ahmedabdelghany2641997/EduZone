<div align="center">

# 🍔 Bite - Food Delivery Ecosystem
**A high-performance mobile solution for seamless food ordering.**

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white) 
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=flat&logo=dart&logoColor=white) 
![BLoC](https://img.shields.io/badge/State-Bloc/Cubit-blue) 
![Clean Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-green) 
![Google Maps](https://img.shields.io/badge/API-Google_Maps-red)

<img src="https://github.com/SP-XD/SP-XD/blob/main/images/dev-working_rounded.gif?raw=true" alt="Development" width="45%"/>
</div>

<hr>

## 🚀 نظرة عامة (Overview)
**Bite** هو نظام متكامل لطلب وتوصيل الطعام، يركز على تجربة مستخدم سلسة وسريعة. يعتمد التطبيق على **Google Maps API** لتوفير تتبع حي، مع هيكلة كود تضمن استقرار الأداء وسهولة التوسع مستقبلاً.

## ✨ المميزات التقنية (Technical Features)
* 📍 **Real-time Tracking:** تتبع مباشر لموقع الدليفري باستخدام خرائط جوجل.
* 🛒 **Advanced Cart Logic:** نظام سلة ذكي يدعم الإضافات المخصصة والخيارات المتعددة.
* 🏗️ **Architectural Design:** تطبيق صارم لـ **Clean Architecture** (Data, Domain, Presentation).
* 🧪 **Engineering Excellence:** استخدام **SOLID Principles** لضمان كود قابل للاختبار (Testable).
* ⚡ **Performance:** استجابة سريعة جداً بفضل التعامل الاحترافي مع الـ API و Cache.

## 🛠️ التقنيات المستخدمة (Tech Stack)
* **Framework:** Flutter (Android & iOS)
* **State Management:** BLoC / Cubit Pattern
* **Architecture:** Clean Architecture
* **API Handling:** Dio with Interceptors
* **Local Storage:** Hive for high-speed caching

## 📂 هيكلة المشروع (Folder Structure)
تم تقسيم المشروع لضمان فصل منطق الأعمال عن الواجهات:
```text
lib/
 ├── core/          # Dependency Injection (GetIt), Utilities, Routes
 ├── data/          # Models, Remote Data Sources (Dio), Repositories Impl
 ├── domain/        # Entities, Use Cases, Repository Interfaces
 └── presentation/  # UI Components, Screens, BLoCs/Cubits
