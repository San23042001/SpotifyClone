// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChooseModeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseModePage(),
      );
    },
    GetStartedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GetStartedPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SigninRoute.name: (routeData) {
      final args = routeData.argsAs<SigninRouteArgs>(
          orElse: () => const SigninRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SigninPage(key: args.key),
      );
    },
    SignupOrSigininRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupOrSigininPage(),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignupPage(key: args.key),
      );
    },
    SongPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<SongPlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SongPlayerPage(
          key: args.key,
          songEntity: args.songEntity,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [ChooseModePage]
class ChooseModeRoute extends PageRouteInfo<void> {
  const ChooseModeRoute({List<PageRouteInfo>? children})
      : super(
          ChooseModeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseModeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GetStartedPage]
class GetStartedRoute extends PageRouteInfo<void> {
  const GetStartedRoute({List<PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SigninPage]
class SigninRoute extends PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SigninRoute.name,
          args: SigninRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const PageInfo<SigninRouteArgs> page = PageInfo<SigninRouteArgs>(name);
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignupOrSigininPage]
class SignupOrSigininRoute extends PageRouteInfo<void> {
  const SignupOrSigininRoute({List<PageRouteInfo>? children})
      : super(
          SignupOrSigininRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupOrSigininRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<SignupRouteArgs> page = PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SongPlayerPage]
class SongPlayerRoute extends PageRouteInfo<SongPlayerRouteArgs> {
  SongPlayerRoute({
    Key? key,
    required SongEntity songEntity,
    List<PageRouteInfo>? children,
  }) : super(
          SongPlayerRoute.name,
          args: SongPlayerRouteArgs(
            key: key,
            songEntity: songEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'SongPlayerRoute';

  static const PageInfo<SongPlayerRouteArgs> page =
      PageInfo<SongPlayerRouteArgs>(name);
}

class SongPlayerRouteArgs {
  const SongPlayerRouteArgs({
    this.key,
    required this.songEntity,
  });

  final Key? key;

  final SongEntity songEntity;

  @override
  String toString() {
    return 'SongPlayerRouteArgs{key: $key, songEntity: $songEntity}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
