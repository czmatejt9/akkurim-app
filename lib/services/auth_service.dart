import 'package:ak_kurim_app/models/remote_config.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supertokens_flutter/dio.dart';
import 'package:supertokens_flutter/supertokens.dart';
import 'package:ak_kurim_app/services/remote_config_service.dart';

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

@riverpod
class AuthService extends _$AuthService {
  @override
  AuthState build() {
    return AuthState(AuthStateEnum.initial);
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthState(AuthStateEnum.loading);
    final RemoteConfig remoteConfig =
        await ref.watch(remoteConfigProvider.future);
    final serverUrl = remoteConfig.serverUrl;
    final Dio dio = Dio();
    dio.interceptors.add(SuperTokensInterceptorWrapper(client: dio));

    var res = await dio.post(
      "$serverUrl/auth/signin",
      data: {
        "formFields": [
          {"id": "email", "value": email},
          {"id": "password", "value": password},
        ],
      },
    ).onError((error, stackTrace) {
      return Response(
        requestOptions: RequestOptions(path: ""),
        statusCode: 500,
        statusMessage: "Network or server error",
      );
    });
    if (res.statusCode != 200) {
      state = AuthState(AuthStateEnum.error, error: res.statusMessage);
      return;
    }
    // kinda stupid imo but the response returns a 200 even if the credentials are wrong

    Map<String, dynamic> body = res.data;
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
    await SuperTokens.signOut();
    state = AuthState(AuthStateEnum.initial);
  }
}
