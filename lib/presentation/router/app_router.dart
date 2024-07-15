import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_siginin.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';

import 'package:spotify_clone/presentation/intro/pages/get_started.dart';
import 'package:spotify_clone/presentation/pages/splash/splash.dart';
import 'package:spotify_clone/presentation/home/pages/home.dart';
import 'package:spotify_clone/presentation/profile/pages/profile.dart';
import 'package:spotify_clone/presentation/song_player/pages/song_player.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: GetStartedRoute.page),
        AutoRoute(page: ChooseModeRoute.page),
        AutoRoute(page: SignupOrSigininRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: SigninRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SongPlayerRoute.page),
        AutoRoute(page: ProfileRoute.page)
      ];
}
