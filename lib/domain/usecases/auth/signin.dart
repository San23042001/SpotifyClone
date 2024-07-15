import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/model/auth/sigin_user_req.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/get_it/service_locator.dart';

class SignInUseCase implements Usecase<Either, SignUserReq> {
  @override
  Future<Either> call({SignUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
