import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/presentation/router/app_router.dart';

@RoutePage()
class SignupOrSigininPage extends StatelessWidget {
  const SignupOrSigininPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BasicAppBar(),
            Align(
              alignment: Alignment.topRight,
              child: MyAssets.vectors.topPattern.svg(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: MyAssets.vectors.bottomPattern.svg(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: MyAssets.images.authBg.image(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyAssets.vectors.spotifyLogo.svg(),
                    const SizedBox(
                      height: 55,
                    ),
                    const Text(
                      'Enjoy Listening To Music',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BasicAppButton(
                              onPressed: () {
                                context.pushRoute(SignupRoute());
                              },
                              title: "Register"),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              context.pushRoute(SigninRoute());
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
