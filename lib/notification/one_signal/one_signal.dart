// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'main.dart';

class OneSignalNotification extends StatefulWidget {
  const OneSignalNotification({super.key});

  @override
  State<OneSignalNotification> createState() => _OneSignalNotificationState();
}

class _OneSignalNotificationState extends State<OneSignalNotification> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  static const String oneSignalAppId = "ca14e38e-d6fb-42dd-b616-b4f3058548f5";
  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);

    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});

    /// Get the Onesignal userId and update that into the firebase.
    /// So, that it can be used to send Notifications to users later.̥
    final status = await OneSignal.shared.getDeviceState();
    debugPrint("clog userId ${status?.userId}");
    // We will update this once he logged in and goes to dashboard.
    ////updateUserProfile(osUserID);
    // Store it into shared prefs, So that later we can use it.

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
      debugPrint('clog result ${result.notification.additionalData}');
      navigatorKey.currentState?.pushNamed('/second');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("One Signal")));
  }
}
