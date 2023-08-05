import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper
{
  static final NotificationHelper notifyService = NotificationHelper._();
  NotificationHelper._();

  FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification()
  async {
    AndroidInitializationSettings androidInit = AndroidInitializationSettings('app_icon');
    DarwinInitializationSettings iOSInit = DarwinInitializationSettings();

    InitializationSettings initializationSettings =
    InitializationSettings( android: androidInit, iOS: iOSInit );
    await notificationsPlugin.initialize(initializationSettings);
  }


  void notificationProductAddToCart({title, information})
  {
      AndroidNotificationDetails androidDetails = AndroidNotificationDetails("1",
          "Added in Cart",
          priority: Priority.high,
          importance: Importance.max );
      DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();
      NotificationDetails notificationDetails =
      NotificationDetails( android:  androidDetails, iOS:  iOSDetails);
      notificationsPlugin.show(3,
          "$title",
          "$information",
          notificationDetails);
  }


}