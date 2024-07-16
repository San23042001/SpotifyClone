import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/data/model/auth/create_user_req.dart';
import 'package:spotify_clone/data/model/auth/sigin_user_req.dart';
import 'package:spotify_clone/data/model/auth/user.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';
import 'package:spotify_clone/get_it/service_locator.dart';
import 'package:spotify_clone/services/analytics_service.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> sigin(SignUserReq signUserReq);

  Future<Either> getUser();
  Future<Either> signOut();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> sigin(SignUserReq signUserReq) async {
    try {
      var authresult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signUserReq.email, password: signUserReq.password);
      await sl<AnalyticsService>().setUserProperties(
          userId: authresult.user!.uid, userName: authresult.user!.displayName);

      return const Right('Sigin was Sucessfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid user credentials';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(data.user?.uid)
          .set({'name': createUserReq.fullName, 'email': data.user?.email});

      await sl<AnalyticsService>().setUserProperties(
          userId: data.user!.uid, userName: data.user!.displayName);

      return const Right('Signup was Sucessfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exits with that email';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL =
          firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultImage;

      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occured');
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right('Sign-out was successful');
    } catch (e) {
      return const Left('An error occurred during sign-out');
    }
  }
}
