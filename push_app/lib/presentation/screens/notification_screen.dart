import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class NotificationScreen extends StatelessWidget {
  final String messageId;
  const NotificationScreen({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? notif =
        context.watch<NotificationsBloc>().getMessageById(messageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Detail'),
      ),
      body: notif == null 
      ? const Center(child: Text('Notification not found'))
      : _DetailsView(notification: notif),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage notification;

  const _DetailsView({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          if (notification.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(notification.imageUrl!)
              ),
          const SizedBox(height: 30),
          Text(
            notification.title,
            style: textStyles.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(notification.body, style: textStyles.bodyLarge),
          const Divider(),
          Text('Data:', style: textStyles.titleMedium),
          Text(notification.data.toString()),
        ],
      ),
    );
  }
}
