import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullname;
  String? email;
  String? imageURL;

  UserModel({this.fullname, this.email, this.imageURL});

  UserModel.fromJson(Map<String, dynamic> data) {
    fullname = data['name'];
    email = data['email'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullname: fullname,
      email: email,
      imageURL: imageURL,
    );
  }
}
