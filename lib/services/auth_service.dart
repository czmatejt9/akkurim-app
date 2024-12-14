import 'dart:convert';

import 'package:supertokens_flutter/http.dart' as http;
import 'package:supertokens_flutter/supertokens.dart';

class AuthService {
  Uri baseUri = Uri(
    scheme: "https",
    host: "akkurimdev.czmatejt.me",
    path: "/auth/signin",
  ); // TODO load from config
  String loginUrl = '/auth/signin';
  bool isLoggedIn = false;

  Future<void> refresh() async {
    isLoggedIn = await SuperTokens.doesSessionExist();
  }

  Future<void> logout() async {
    await SuperTokens.signOut();
    isLoggedIn = false;
  }

  Future<void> login({required String email, required String password}) async {
    if (isLoggedIn) {
      return;
    }
    var res = await http.post(
      baseUri,
      body: jsonEncode({
        "formFields": [
          {"id": "email", "value": email},
          {"id": "password", "value": password},
        ],
      }),
    );
    print(res.body);
    isLoggedIn = await SuperTokens.doesSessionExist();
  }
}
