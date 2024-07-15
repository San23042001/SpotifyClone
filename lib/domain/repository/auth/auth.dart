import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/model/auth/create_user_req.dart';
import 'package:spotify_clone/data/model/auth/sigin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SignUserReq signUserReq);

  Future<Either> getUser();

}
