import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((NotificationsBloc bloc) =>
            Text('Permission: ${bloc.state.status.name}')),
        actions: [
          IconButton(
              onPressed: () {
                context.read<NotificationsBloc>().requestPermissions();
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<NotificationsBloc>().state.notifications;

    return ListView.builder(
        itemCount: notifications.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return GestureDetector(
            onTap: () => context.push('/notification/${notification.messageId}'),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(notification.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(notification.body),
              leading: notification.imageUrl == null
                  ? null
                  : ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      child: Image.network(
                        notification.imageUrl!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
          );
        });
  }
}
