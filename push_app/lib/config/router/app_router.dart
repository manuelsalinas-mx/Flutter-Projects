
import 'package:go_router/go_router.dart';
import 'package:push_app/presentation/screens/home_screen.dart';
import 'package:push_app/presentation/screens/notification_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) => const HomeScreen()),

  GoRoute(path: '/notification/:id', 
  builder: (context, state) => NotificationScreen(messageId: state.pathParameters['id'] ?? 'no-id')),
]);
