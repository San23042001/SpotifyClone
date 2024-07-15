import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoInitial extends ProfileInfoState{}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;

  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFalure extends ProfileInfoState {}
