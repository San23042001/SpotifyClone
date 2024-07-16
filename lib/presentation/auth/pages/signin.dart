import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/data/model/auth/sigin_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/get_it/service_locator.dart';
import 'package:spotify_clone/presentation/router/app_router.dart';
import 'package:spotify_clone/services/analytics_service.dart';

@RoutePage()
class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _signupText(context),
        appBar: BasicAppBar(
          title: MyAssets.vectors.spotifyLogo.svg(
            height: 40,
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignInUseCase>().call(
                        params: SignUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString()));
                    // l - signup failed r- request sucessful
                    result.fold((l) {
                      var snackbar = SnackBar(
                          content: Text(
                        l,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }, (r) async {
                      context.router.pushAndPopUntil(
                        const HomeRoute(),
                        predicate: (route) => false,
                      );
                      await sl<AnalyticsService>().logLogin();
                    });
                  },
                  title: "Sign In")
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _password,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                context.replaceRoute(SignupRoute());
              },
              child: const Text('Register Now'))
        ],
      ),
    );
  }
}
