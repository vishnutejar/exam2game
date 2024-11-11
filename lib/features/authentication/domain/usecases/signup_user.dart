// lib/features/authentication/domain/usecases/signup_user.dart
import 'package:dartz/dartz.dart';
import 'package:exam2game/core/error/failure.dart';
import 'package:exam2game/features/authentication/domain/entities/user.dart';
import 'package:exam2game/features/authentication/domain/repositories/auth_repository.dart';

class SignupUser {
  final AuthRepository repository;

  SignupUser(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return repository.signupUser(email, password);
  }
}
