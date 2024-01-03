import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../domain/entities/push_message.dart';
import '../../../firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    // Listeners
    on<NotificationStatusChanged>(_notificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);

    // Verificar permisos para recibir notificaciones
    _initialStatusCheck();

    // Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

// * * * * * * * * *  Initialization
  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFcmToken() async {
    final settings = await messaging.getNotificationSettings();
    if (state.status != AuthorizationStatus.authorized) return;
    final fcmToken = await messaging.getToken();
    print('Token: $fcmToken');
  }

// * * * * * * * * *  Permission status change
  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: event.status));

    _getFcmToken();
  }

  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    // emitir
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  // * * * * * * * * *  Handle Remote Messages
  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
        messageId:
            message.messageId?.replaceAll('%', '').replaceAll(':', '') ?? '',
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        sendDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
            ? message.notification!.android?.imageUrl
            : message.notification!.apple?.imageUrl);

    // emitir
    add(NotificationReceived(notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void _onPushMessageReceived(
      NotificationReceived event, Emitter<NotificationsState> emit) {
    emit(
        state.copyWith(notifications: [event.message, ...state.notifications]));
  }

  // * * * * * * * * *  Helpers
  PushMessage? getMessageById(String id) {
    final exist = state.notifications.any((element) => element.messageId == id);
    if (!exist) return null;
    
    return state.notifications.firstWhere((element) => element.messageId == id);
  }
}
