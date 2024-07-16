import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  //User properties tells us what the user is
  Future setUserProperties({required String userId, String? userName}) async {
    await _analytics.setUserId(id: userId);
    await _analytics.setUserProperty(name: 'user_name', value: userName);
    //property to indicate if it's a pro paying member
    //property that might tell us it's a regular poster,etc
  }

  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  Future logSongViewed(String songName) async {
    await _analytics
        .logEvent(name: 'song_name', parameters: {'song_name': songName});
  }

  Future logFavoriteSong(String songName) async {
    await _analytics
        .logEvent(name: 'favorite_song', parameters: {'song_name': songName});
  }
}
