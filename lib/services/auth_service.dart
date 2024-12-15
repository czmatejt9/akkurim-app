import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/http.dart' as http;
import 'package:supertokens_flutter/supertokens.dart';

part 'auth_service.g.dart';

class AuthState {
  final AuthStateEnum state;
  String? error;
  AuthState(this.state, {this.error});
}

enum AuthStateEnum {
  initial,
  loading,
  authenticated,
  error,
}

Uri baseUri = Uri(
  scheme: "https",
  host: "devapi.akkurim.cz",
  path: "/auth/signin",
); // TODO load from config

@riverpod
class AuthService extends _$AuthService {
  @override
  AuthState build() {
    return AuthState(AuthStateEnum.initial);
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthState(AuthStateEnum.loading);
    var res = await http.post(
      baseUri,
      body: jsonEncode({
        "formFields": [
          {"id": "email", "value": email},
          {"id": "password", "value": password},
        ],
      }),
    );
    Map<String, dynamic> body = jsonDecode(res.body);

    if (body["status"]!.contains("ERROR")) {
      if (body["status"]!.contains("WRONG_CREDENTIALS_ERROR")) {
        state = AuthState(AuthStateEnum.error, error: "Wrong credentials");
        return;
      }
      String errorString = "";
      for (Map<String, dynamic> error in body["formFields"]!) {
        if (error["error"] != null) {
          errorString += "${error["id"]}: ${error["error"]}!\n";
        }
      }
      state = AuthState(AuthStateEnum.error, error: errorString);
    } else {
      state = AuthState(AuthStateEnum.authenticated);
    }
  }

  Future<void> logout() async {
    SuperTokens.signOut();
    state = AuthState(AuthStateEnum.initial);
  }
}
