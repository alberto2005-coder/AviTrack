import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../models/nidada.dart';
import '../models/species.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    tz_data.initializeTimeZones();
    
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(settings: initializationSettings);

    // Request permissions for Android 13+
    final androidImplementation = _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      await androidImplementation.requestNotificationsPermission();
      await androidImplementation.requestExactAlarmsPermission();
    }
  }

  static Future<void> scheduleLayingNotifications(Nidada nidada, Species species) async {
    // Schedule notifications for eggs
    // Assuming a max of 10 eggs for notification purposes
    for (int i = 1; i <= 10; i++) {
      final eggDate = nidada.startDate!.add(Duration(days: (i - 1) * species.layingFrequencyDays));
      
      // Schedule for 09:00 AM
      final scheduledTime = tz.TZDateTime(
        tz.local,
        eggDate.year,
        eggDate.month,
        eggDate.day,
        9, 0,
      );

      if (scheduledTime.isAfter(DateTime.now())) {
        await _notificationsPlugin.zonedSchedule(
          id: nidada.id * 100 + i,
          title: 'AviTrack: Huevo N° $i',
          body: 'Pareja ${nidada.pairName}: Hoy debería poner el huevo N° $i',
          scheduledDate: scheduledTime,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'laying_channel',
              'Seguimiento de Puesta',
              channelDescription: 'Avisos para la puesta de huevos',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );
        print('[AviTrack] Programado Huevo N° $i para: $scheduledTime');
      }
    }
  }

  static Future<void> scheduleHatchingNotifications(Nidada nidada, Species species) async {
    // Cancel previous laying notifications
    for (int i = 1; i <= 10; i++) {
      await _notificationsPlugin.cancel(id: nidada.id * 100 + i);
    }

    final hatchingDate = nidada.expectedHatchingDate;
    if (hatchingDate != null) {
      final scheduledTime = tz.TZDateTime(
        tz.local,
        hatchingDate.year,
        hatchingDate.month,
        hatchingDate.day,
        9, 0,
      );

      if (scheduledTime.isAfter(DateTime.now())) {
        await _notificationsPlugin.zonedSchedule(
          id: nidada.id * 1000 + 1,
          title: 'AviTrack: Día de Eclosión',
          body: 'Pareja ${nidada.pairName}: Hoy es el día previsto para el nacimiento',
          scheduledDate: scheduledTime,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'hatching_channel',
              'Seguimiento de Eclosión',
              channelDescription: 'Avisos para el nacimiento de polluelos',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );
        print('[AviTrack] Programada Eclosión para: $scheduledTime');
      }
    }

    final limitDate = nidada.marginLimitDate;
    if (limitDate != null) {
       final scheduledTime = tz.TZDateTime(
        tz.local,
        limitDate.year,
        limitDate.month,
        limitDate.day,
        9, 0,
      );

      if (scheduledTime.isAfter(DateTime.now())) {
        await _notificationsPlugin.zonedSchedule(
          id: nidada.id * 1000 + 2,
          title: 'AviTrack: Fin de Margen',
          body: 'Atención: Ha pasado el tiempo de margen para la Pareja ${nidada.pairName}. Revisa el nido.',
          scheduledDate: scheduledTime,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'margin_channel',
              'Alerta de Margen',
              channelDescription: 'Avisos cuando el tiempo de margen se agota',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );
        print('[AviTrack] Programada Alerta de Margen para: $scheduledTime');
      }
    }
  }

  static Future<void> cancelAllForNidada(int id) async {
    // Cancel laying notifications
    for (int i = 1; i <= 10; i++) {
      await _notificationsPlugin.cancel(id: id * 100 + i);
    }
    // Cancel hatching and margin
    await _notificationsPlugin.cancel(id: id * 1000 + 1);
    await _notificationsPlugin.cancel(id: id * 1000 + 2);
  }
}
