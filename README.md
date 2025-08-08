# Finance House Top-Up App (Flutter)

A modular Flutter application showcasing clean architecture, robust state management (Cubit), dependency injection, generated assets/models, and a scalable data layer (remote + local via Swagger).  
Built for **team collaboration**, testability, and future extension.

---

## flowchart LR
A[Launch App<br>HomeLandingPage] --> B[Dashboard<br>HomeScreen]  
B --> C[Manage Beneficiaries<br>AddBeneficiaryPage]  
B --> D[Transfer Flow<br>TransferPage]

---

## ✨ Key Tech Stack

| Layer               | Libraries / Tools                  | Notes                                                           |
|---------------------|------------------------------------|-----------------------------------------------------------------|
| State Management    | `flutter_bloc` (Cubit)             | Feature-driven Cubits; presentation kept dumb                   |
| Dependency Injection| `get_it` + `injectable`            | Compile-time DI via generated configs                           |
| Data Layer          | `dio` (remote via Swagger)         | Abstracted behind repositories                                  |
| Code Generation     | `json_serializable`, `build_runner`| Strongly typed models + null safety + immutability             |
| Assets              | `flutter_gen`                      | Type-safe access to images/fonts/colors                         |
| Responsiveness      | `flutter_screenutil`               | Consistent sizing across devices                                |
| Routing             | `go_router`                        | Typed `extra` parameters for passing models between screens     |
| Validation          | Custom `FieldValidator`s           | Required, phone-length, dynamic max amount                      |
| Architecture        | Clean (Presentation / Domain / Data)| Feature-first folder structure                                  |

---

## 🚀 Getting Started

```bash
cd finance-house
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

I used a live Swagger HTTP API using Asp.Net deployed on myAsp.net:
http://noureddine7-001-site1.jtempurl.com/swagger/index.html


Sample Users

    {
      "_id": "1",
      "name": "Noureddine Naasani",
      "phone": "+971557122464",
    },
    {
      "_id": "2",
      "name": "Ali Hassan",
      "phone": "+971567636320",
    },
    {
      "_id": "3",
      "name": "Sara Khan",
      "phone": "+971505677946",
    },
    {
      "_id": "4",
      "name": "Nazir Dan",
      "phone": "+971502549627",
    },
    {
      "_id": "5",
      "name": "Nouman Gul",
      "phone": "+971563908290",
    },
    {
      "_id": "6",
      "name": "Mohammad Darain",
      "phone": "+971563908291",
    }