import 'package:exam2game/features/authentication/domain/usecases/login_user.dart';
import 'package:exam2game/features/authentication/domain/usecases/signup_user.dart';
import 'package:exam2game/features/authentication/presentation/bloc/auth_event.dart';
import 'package:exam2game/features/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final SignupUser signupUser;

  AuthBloc({required this.loginUser, required this.signupUser}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      final result = await loginUser.execute(event.email, event.password);
      yield result.fold(
        (failure) => AuthError(failure.message),
        (user) => AuthAuthenticated(user),
      );
    } else if (event is SignupEvent) {
      yield AuthLoading();
      final result = await signupUser.execute(event.email, event.password);
      yield result.fold(
        (failure) => AuthError(failure.message),
        (user) => AuthAuthenticated(user),
      );
    }
  }
}