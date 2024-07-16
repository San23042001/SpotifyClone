import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/get_it/service_locator.dart';

class SignOutUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) {
    return sl<AuthRepository>().signOut();
  }
}
