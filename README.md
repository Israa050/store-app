# Laza Store — Flutter E-Commerce (Clean Architecture)

A shopping app built with **Flutter**, implementing a complete e-commerce UI kit end to end on a **Clean Architecture** foundation: **Cubit (Bloc)** for state, **Dio + Retrofit** for networking, and centralized API error handling.

The app covers the full shopping flow — authentication, onboarding, browsing products, viewing details, managing the cart, and reviews.

> **Design credit:** the UI is based on the **Laza** e-commerce design kit. The Flutter implementation, API integration, and architecture in this repository are my own work.

---

## ✨ Overview

This project is built around **Separation of Concerns** and **Clean Architecture**, so each layer can change without breaking the others. The goal was a codebase that stays readable and testable as features are added — not just a screen-by-screen build.

---

## 🏗️ Project Structure

```
lib/
├── core/                 # cross-cutting concerns
│   ├── network/          # Dio client, Retrofit services, API error model
│   ├── di/               # get_it / injectable setup
│   ├── routing/          # AppRouter
│   └── errors/           # centralized failure handling
├── features/
│   └── <feature>/        # e.g. auth, home, product, cart
│       ├── data/         # models, DTOs, API services, repository impls
│       ├── domain/       # entities, repository contracts, use cases
│       └── presentation/ # cubits, screens, widgets
└── main.dart
```

### Clean Architecture layers

- **Data** — models/DTOs, Retrofit API services, and repository implementations that fetch and map remote data.
- **Domain** — the business logic, independent of Flutter: entities, repository contracts, and use cases.
- **Presentation** — the UI and state management with Cubit, reacting to emitted states.

---

## 🧭 Engineering decisions

The *what* is in the tech stack below; these are the *why*.

- **Retrofit over hand-written Dio calls** — generated, typed clients mean a change in an endpoint breaks the build instead of failing silently at runtime.
- **One centralized `APIErrorModel`** — errors are parsed and mapped in a single place, so screens handle a known failure type instead of repeating `try/catch` and status-code checks everywhere.
- **Domain layer with no Flutter imports** — business rules don't depend on the UI framework, so they can be reused and tested in isolation.
- **Cubit over heavier Bloc events** — for these screens the state transitions are simple enough that Cubit keeps the boilerplate down without losing predictability.

---

## 🚀 Features

- **Authentication** — login, register, and account verification.
- **Onboarding** — intro screens with preference selection.
- **Home** — dynamic offers carousel, categories, and product listings.
- **Product details** — images, sizes, description, price, and add-to-cart.
- **Cart** — add/remove items with a live total and checkout summary.
- **Reviews** — product review list with ratings.
- **Search** — product search from the home screen.

---

## 🖼️ Screenshots

| Onboarding | Login | Home | Details |
|:----------:|:-----:|:----:|:-------:|
| ![Onboarding](assets/images/on_boarding.png) | ![Login](assets/images/login.png) | ![Home](assets/images/products_home.png) | ![Details](assets/images/details.png) |

---

## 🧠 Tech Stack

| Category                 | Technology           |
| ------------------------ | -------------------- |
| Framework                | Flutter 3.32.0       |
| Language                 | Dart 3.8.0           |
| State Management         | Cubit (Bloc)         |
| Networking               | Dio + Retrofit       |
| Architecture             | Clean Architecture   |
| Dependency Injection     | get_it / injectable  |
| Error Handling           | Custom APIErrorModel |
| Routing                  | AppRouter            |

---

## 🧑‍💻 Getting Started

### Requirements
- Flutter SDK 3.32.0
- Dart SDK 3.8.0
- Android Studio or VS Code

### Setup

```bash
# 1. Clone
git clone https://github.com/Israa050/store-app.git
cd store-app

# 2. Install dependencies
flutter pub get

# 3. Generate Retrofit / injectable files
dart run build_runner build --delete-conflicting-outputs

# 4. Run
flutter run
```

---

## 📌 Status

Learning project — feature-complete for the screens listed above, backed by a public demo API for product data.
No automated tests yet; the next step is widget tests for the cart flow and unit tests for the use cases.

---

## 👩‍💻 Author

**Israa Essa** — Mobile Application Developer
Flutter · Offline-first & Arabic RTL apps

---

## 🧾 License

Released under the MIT License.
