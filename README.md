# AviTrack

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Isar](https://img.shields.io/badge/Isar-Database-6E56CF)](https://isar.dev/)
[![GPL-3.0](https://img.shields.io/badge/Licencia-GPL--3.0-blue)](LICENSE)

[Español](#español) · [English](#english)

---

## Español

### Índice

- [Descripción](#descripción)
- [Características](#características)
- [Cómo funciona](#cómo-funciona)
- [Requisitos](#requisitos)
- [Instalación y compilación](#instalación-y-compilación)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Privacidad](#privacidad)
- [Licencia](#licencia)

### Descripción

**AviTrack** es una aplicación **Flutter** para criadores de aves que quieren llevar un control exacto de sus nidadas: puesta de huevos, inicio de incubación, fecha prevista de eclosión y margen extra por nidada. Todo se guarda en el dispositivo, sin cuentas ni servidores.

### Características

- **Seguimiento de nidadas**: registra la puesta, el inicio de la incubación y la fecha prevista de eclosión.
- **Margen extra personalizable**: añade días de espera distintos a cada nidada.
- **Notificaciones automáticas**: avisos por cada huevo y el día del nacimiento, siempre a las 09:00.
- **Diccionario de especies editable**: tiempos de incubación y márgenes por defecto (canarios, periquitos y más).
- **Contador de huevos**: suma o resta huevos en tiempo real durante la puesta.
- **Modo claro, oscuro o automático**, siguiendo el ajuste del teléfono.
- **Almacenamiento local** con Isar: rápido, sin conexión y privado.

### Cómo funciona

1. Das de alta una **especie** en el diccionario (o usas una existente) con sus días de incubación.
2. Creas una **nidada** indicando la fecha de puesta y cuántos huevos hay.
3. La app calcula la fecha de eclosión y programa los avisos.
4. En el **panel** ves cada nidada con los días restantes y su estado; los avisos llegan a las 09:00.
5. Cuando nacen, marcas la nidada como completada y queda en el historial.

### Requisitos

- **Flutter SDK** 3.41 o superior (recomendado).
- **Android SDK 34+** para compilar la APK.
- Un dispositivo o emulador Android (el proyecto incluye también la carpeta `ios/`, pero está pensado para Android).
- Sin dependencias de red en tiempo de ejecución.

### Instalación y compilación

```bash
git clone https://github.com/alberto2005-coder/AviTrack.git
cd AviTrack
flutter pub get
flutter run                # desarrollo con dispositivo conectado
flutter build apk --release
```

La APK de lanzamiento queda en `build/app/outputs/flutter-apk/app-release.apk`.

> [!NOTE]
> Isar genera su código con `build_runner`. Si cambias los modelos, ejecuta `dart run build_runner build --delete-conflicting-outputs`.

### Estructura del proyecto

```text
AviTrack/
├── lib/
│   ├── main.dart                     # Arranque, tema y navegación
│   ├── models/
│   │   ├── nidada.dart               # Nidada y fechas calculadas
│   │   ├── species.dart              # Especie e incubación por defecto
│   │   └── *.g.dart                  # Código generado por Isar
│   ├── screens/
│   │   ├── dashboard.dart            # Panel con las nidadas activas
│   │   ├── add_nidada.dart           # Alta y edición de nidadas
│   │   └── species_list.dart         # Diccionario de especies
│   ├── services/
│   │   ├── database_service.dart     # Isar y consultas
│   │   └── notification_service.dart # Alarmas diarias a las 09:00
│   └── widgets/nidada_card.dart      # Tarjeta de nidada
├── android/ · ios/                   # Proyectos nativos
├── test/widget_test.dart
└── IMPLEMENTATION_PLAN.md            # Plan de desarrollo y decisiones
```

### Privacidad

No hay backend ni inicio de sesión: los datos viven en la base de datos Isar del propio teléfono. Desinstalar la app elimina la información, así que conviene exportar o anotar lo importante antes.

### Licencia

**GNU General Public License v3.0 (GPL-3.0)** — consulta [LICENSE](LICENSE).

---

## English

### Table of contents

- [Overview](#overview)
- [Features](#features)
- [How it works](#how-it-works)
- [Requirements](#requirements)
- [Installation and build](#installation-and-build)
- [Project structure](#project-structure)
- [Privacy](#privacy)
- [License](#license)

### Overview

**AviTrack** is a **Flutter** app for bird breeders who want precise control over their clutches: egg laying, incubation start, expected hatching date and a custom margin per clutch. Everything is stored on the device — no accounts, no servers.

### Features

- **Clutch tracking**: record laying, incubation start and the expected hatching date.
- **Custom extra margin**: give each clutch its own extra waiting days.
- **Automatic notifications**: alerts for every egg and on hatching day, always at 09:00.
- **Editable species dictionary**: default incubation times and margins (canaries, parakeets and more).
- **Egg counter**: add or remove eggs in real time during laying.
- **Light, dark or automatic theme**, following the phone's setting.
- **Local storage** with Isar: fast, offline and private.

### How it works

1. Add a **species** to the dictionary (or reuse one) with its incubation days.
2. Create a **clutch** with the laying date and the number of eggs.
3. The app computes the hatching date and schedules the alarms.
4. The **dashboard** lists every clutch with days remaining and status; alerts arrive at 09:00.
5. When the eggs hatch, mark the clutch as complete and it moves to the history.

### Requirements

- **Flutter SDK** 3.41 or later (recommended).
- **Android SDK 34+** to build the APK.
- An Android device or emulator (the `ios/` folder ships too, but the project targets Android).
- No network dependencies at runtime.

### Installation and build

```bash
git clone https://github.com/alberto2005-coder/AviTrack.git
cd AviTrack
flutter pub get
flutter run                # development on a connected device
flutter build apk --release
```

The release APK lands in `build/app/outputs/flutter-apk/app-release.apk`.

> [!NOTE]
> Isar generates its code with `build_runner`. If you change the models, run `dart run build_runner build --delete-conflicting-outputs`.

### Project structure

```text
AviTrack/
├── lib/
│   ├── main.dart                     # Bootstrap, theme and navigation
│   ├── models/
│   │   ├── nidada.dart               # Clutch and computed dates
│   │   ├── species.dart              # Species and default incubation
│   │   └── *.g.dart                  # Isar-generated code
│   ├── screens/
│   │   ├── dashboard.dart            # Active clutches dashboard
│   │   ├── add_nidada.dart           # Create and edit clutches
│   │   └── species_list.dart         # Species dictionary
│   ├── services/
│   │   ├── database_service.dart     # Isar access and queries
│   │   └── notification_service.dart # Daily 09:00 alarms
│   └── widgets/nidada_card.dart      # Clutch card
├── android/ · ios/                   # Native projects
├── test/widget_test.dart
└── IMPLEMENTATION_PLAN.md            # Development plan and decisions
```

### Privacy

There is no backend and no sign-in: data lives in the phone's Isar database. Uninstalling the app deletes it, so export or copy anything important beforehand.

### License

**GNU General Public License v3.0 (GPL-3.0)** — see [LICENSE](LICENSE).
