import '../../../../core/error/failure.dart';
import '../entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future<Either<Failure, User>> signupUser(String email, String password);
}
