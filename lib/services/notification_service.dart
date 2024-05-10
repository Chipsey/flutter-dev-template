import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {}

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("logo.png");

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  ///////////////// Big picture is not still functional ////////////////
  notificationDetails({String? imageUrl}) {
    if (imageUrl != null) {
      print('Image URL: $imageUrl'); // Debug print
      BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(
        DrawableResourceAndroidBitmap(imageUrl),
        contentTitle: 'Code Compile',
        largeIcon: DrawableResourceAndroidBitmap(imageUrl),
      );
      print('Big Picture Style: $bigPictureStyleInformation'); // Debug print
      return NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
          styleInformation: bigPictureStyleInformation,
        ),
        iOS: DarwinNotificationDetails(),
      );
    } else {
      return NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails(),
      );
    }
  }

  Future<void> showNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      String? imageUrl}) async {
    await notificationsPlugin.show(
        id, title, body, await notificationDetails(imageUrl: imageUrl));
  }
}
