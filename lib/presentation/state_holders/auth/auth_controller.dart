import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? accessToken;

  final String _accessTokenKey = 'access';

  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    return token;
  }

  Future<bool> checkAuthState() async{
    if(accessToken == null) {
      accessToken = await getAccessToken();
    }
    return accessToken != null;
  }

  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

}