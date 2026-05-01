# 🕊️ Plan Maestro de Desarrollo: BirdManager Pro (Local)

Este documento es una guía exhaustiva para la creación de la aplicación móvil definitiva de gestión de cría. La app está diseñada para funcionar de forma **100% local**, garantizando privacidad y velocidad.

---

## 1. El "Jamón" de Datos (Especies Mundiales)

La aplicación incluirá una base de datos preconfigurada. El usuario podrá modificar estos valores si su experiencia personal o clima lo requieren.

| Especie | Incubación (Días) | Margen Estándar | Tipo de Puesta |
| :--- | :---: | :---: | :--- |
| Canario (Serinus canaria) | 13 | +2 | 4-6 huevos (Diaria) |
| Periquito Australiano | 18 | +2 | 4-8 huevos (Días alternos) |
| Agapornis (Inseparables) | 23 | +3 | 4-6 huevos (Días alternos) |
| Ninfa / Carolina | 19 | +2 | 4-7 huevos (Días alternos) |
| Diamante de Gould | 14 | +2 | 4-8 huevos (Diaria) |
| Diamante Mandarín | 12 | +2 | 4-6 huevos (Diaria) |
| Jilguero (Carduelis carduelis) | 13 | +2 | 4-5 huevos (Diaria) |
| Cacatúa Blanca | 25 | +3 | 2-3 huevos (2-3 días) |
| Yaco (Loro Gris) | 28 | +4 | 3-5 huevos (3 días) |
| Guacamayo Azul y Amarillo | 26 | +4 | 2-3 huevos (2 días) |
| Paloma Mensajera | 18 | +1 | 2 huevos (44 horas aprox.) |
| Padda (Gorrión de Java) | 15 | +2 | 4-7 huevos (Diaria) |
| Cotorra del Sol | 23 | +3 | 3-4 huevos (2 días) |

---

## 2. Lógica de Negocio y Algoritmos

### A. Gestión de la Puesta (Botón 1: "Empezó la puesta")
Cuando el usuario pulsa este botón, la app registra la `fecha_inicio`.
- **Notificación matutina (09:00 AM):** "Pareja [Nombre]: Hoy debería poner el huevo N° X". 
- La app calcula X basándose en la "Frecuencia" (ej. diaria o días alternos).

### B. Gestión de Incubación (Botón 2: "Terminó la puesta")
Al pulsar este botón, el sistema cancela las alarmas de puesta y activa la **Ventana de Eclosión**.
1. **Cálculo de Fecha Objetivo:** `Fecha_Fin + Días_Incu`.
2. **Cálculo de Fecha Límite:** `Fecha_Fin + Días_Incu + Días_Margen`.
3. **Notificaciones Finales:** - *Día de Eclosión:* "Hoy es el día previsto para el nacimiento de la Pareja [X]".
   - *Fin de Margen:* "Atención: Ha pasado el tiempo de margen. Revisa el nido de la Pareja [X]".

---

## 3. Stack Tecnológico (Implementación Local)

### Framework: Flutter
Elegimos Flutter por su capacidad de gestionar interfaces fluidas y un sistema de notificaciones robusto.

### Almacenamiento: Isar Database
- **No SQL:** Ideal para guardar objetos JSON directamente.
- **Velocidad:** Es la base de datos más rápida para Flutter.
- **Local:** Los datos nunca salen del teléfono.

### Librería de Notificaciones: `flutter_local_notifications`
- Permite programar alarmas con meses de antelación.
- Permite añadir botones a la notificación (ej. "Nacido" / "No nacido").

---

## 4. Estructura de Pantallas (UX/UI)

### Pantalla 1: Dashboard (Nidada Actual)
- Visualización de jaulas activas.
- Barra de progreso visual que cambia de color:
  - **Gris:** En puesta.
  - **Azul:** Incubando (Cuenta atrás: "Faltan 5 días").
  - **Naranja/Rojo:** En días de margen ("Esperando...").

### Pantalla 2: Formulario de Registro
- Input: Nombre de la pareja o n° de jaula.
- Dropdown: Selección de especie (carga datos del "jamón").
- Switch: "Modo experto" (para cambiar los días de margen a mano).

### Pantalla 3: Diccionario de Aves
- Lista para añadir, editar o borrar especies y sus tiempos.

---

## 5. Hoja de Ruta (Roadmap)

### Semana 1: Cimientos
- Instalación de Flutter.
- Creación de los modelos de datos (`Specie` y `Nidada`).
- Configuración de **Isar** con la carga inicial de las especies de la tabla anterior.

### Semana 2: El Cerebro (Lógica)
- Desarrollo de la clase `DateCalculator`.
- Implementación de la función para sumar días de margen y gestionar festivos o cambios de hora automáticamente.

### Semana 3: Sistema de Alertas
- Configuración del plugin de notificaciones.
- Pruebas de "Wake-up": asegurar que el móvil avisa aunque esté en modo ahorro.

### Semana 4: Interfaz y Pulido
- Diseño de las Cards de seguimiento.
- Creación de iconos personalizados (huevos, pollitos, campanas).

---

## 6. Seguridad y Backup
Incluso siendo local, el plan incluye un botón de **"Exportar Backup"**: