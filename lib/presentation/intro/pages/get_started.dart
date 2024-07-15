import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/presentation/router/app_router.dart';

@RoutePage()
class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: MyAssets.images.introBg.provider())),
            ),
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: MyAssets.vectors.spotifyLogo.svg()),
                  const Spacer(),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text(
                    'Your journey to discovering and enjoying the best music and podcasts starts here!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BasicAppButton(
                      onPressed: () {
                        context.pushRoute(const ChooseModeRoute());
                      },
                      title: 'Get Started')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
