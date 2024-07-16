import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/theme/app_theme.dart';
import 'package:spotify_clone/get_it/service_locator.dart';
import 'package:spotify_clone/presentation/bloc/theme_cubit.dart';
import 'package:spotify_clone/presentation/router/app_router.dart';
import 'package:spotify_clone/presentation/router/my_route_observer.dart';
import 'package:spotify_clone/services/analytics_service.dart';

class SpotifyApp extends StatefulWidget {
  const SpotifyApp({super.key});

  @override
  State<SpotifyApp> createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: mode,
          darkTheme: AppTheme.darkTheme,
          routerConfig: _appRouter.config(
            navigatorObservers: () => [
              MyRouteObserver(),
              sl<AnalyticsService>().getAnalyticsObserver(),
            ],
          ),
        ),
      ),
    );
  }
}
