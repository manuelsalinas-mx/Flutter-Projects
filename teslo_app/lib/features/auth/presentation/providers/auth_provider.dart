import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

// * 1- State del provider
enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}

// * 2- State Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    // Delay intencional
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  void registerUser(String email, String password, String fullName) async {}

  void checkAuthStatus() async {}

  void _setLoggedUser(User user) {
    //TODO: guardar el token fisicmente
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> logout(String? errorMessage) async {
    // Limpiar token
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

// * 3- 'StateNotifierProvider' - como consumir provider por fuera
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  return AuthNotifier(authRepository: authRepository);
});