import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';

class CheckAuthStatusScreen extends ConsumerWidget {
  const CheckAuthStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Esto sera delegado a las rutas para saber cuando ir a la pantalla de login o al home
    /*
    ref.listen(authProvider, (previous, next) {
      if (next.authStatus == AuthStatus.authenticated) {
        context.go('/');
        return;
      }

      context.go('/login');
    });
    */

    return const Scaffold(
      body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}
