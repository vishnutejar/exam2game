// lib/features/authentication/domain/usecases/login_user.dart
import 'package:dartz/dartz.dart';
import 'package:exam2game/core/error/failure.dart';
import 'package:exam2game/features/authentication/domain/entities/user.dart';
import 'package:exam2game/features/authentication/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return repository.loginUser(email, password);
  }
}
