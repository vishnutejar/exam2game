import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final response = await remoteDataSource.loginUser(email, password);
      return Right(User.fromJson(response));
    } catch (e) {
      return Left(Failure('Login failed'));
    }
  }

  @override
  Future<Either<Failure, User>> signupUser(String email, String password) async {
    try {
      final response = await remoteDataSource.signupUser(email, password);
      return Right(User.fromJson(response));
    } catch (e) {
      return Left(Failure('Sign up failed'));
    }
  }
}
