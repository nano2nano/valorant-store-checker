import 'dart:io';

import 'package:check_store/data/remote/valorant_api.dart';
import 'package:check_store/exception/auth_failure.dart';
import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cookie_jar/cookie_jar.dart';

final valorantApiDataSourceProvider = Provider<ValorantApiDataSource>(
    (ref) => ValorantApiDataSourceImpl(dio: ref.read(dioProvider)));

class ValorantApiDataSourceImpl implements ValorantApiDataSource {
  ValorantApiDataSourceImpl({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<String> fetchAccessToken(ValorantAccount account) async {
    final url = 'https://auth.riotgames.com/api/v1/authorization';

    final cookies = await fetchCookies();
    final cookieJar = CookieJar();
    cookieJar.saveFromResponse(Uri.parse(url), cookies);

    final manager = CookieManager(cookieJar);
    _dio.interceptors.add(manager);

    final data = {
      'type': 'auth',
      'username': account.username,
      'password': account.password,
      'remember': 'true',
    };

    final response = await _dio.put(url, data: data);
    final Map<String, dynamic> res = response.data;
    if (res.containsKey('error')) {
      if (res['error'] == 'auth_failure') {
        throw const AuthenticationFailure('auth_failure');
      } else {
        throw Error;
      }
    }
    var match = RegExp(
      r'access_token=((?:[a-zA-Z]|\d|\.|-|_)*).*id_token=((?:[a-zA-Z]|\d|\.|-|_)*).*expires_in=(\d*)',
    ).firstMatch(response.data['response']['parameters']['uri']);

    if (match == null) throw Error;
    final accessToken = match.group(1);
    if (accessToken == null) throw Error;

    // reset cookie manager
    _dio.interceptors.remove(manager);
    return accessToken;
  }

  @override
  Future<String> fetchEntitlementsToken(String accessToken) async {
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response = await _dio.post(
      'https://entitlements.auth.riotgames.com/api/token/v1',
      options: Options(headers: headers),
    );
    return response.data['entitlements_token'];
  }

  @override
  Future<List<WeaponSkinlevel>> fetchSingleItemOffers(
      ValorantAccount account) async {
    try {
      final accessToken = await fetchAccessToken(account);
      final futureWait = await Future.wait([
        fetchEntitlementsToken(accessToken),
        fetchUserId(accessToken),
      ]);
      final entitlementsToken = futureWait[0];
      final userId = futureWait[1];

      final headers = {
        'Authorization': 'Bearer $accessToken',
        'X-Riot-Entitlements-JWT': entitlementsToken,
      };
      final response = await _dio.get(
        'https://pd.${account.region}.a.pvp.net/store/v2/storefront/$userId',
        options: Options(headers: headers),
      );

      final tasks = <Future<WeaponSkinlevel>>[];
      for (final uuid in response.data['SkinsPanelLayout']
          ['SingleItemOffers']) {
        tasks.add(fetchWeaponSkinLevelByUuid(uuid));
      }
      return await Future.wait(tasks);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> fetchUserId(String accessToken) async {
    final headers = {'Authorization': 'Bearer $accessToken'};
    final response = await _dio.post(
      'https://auth.riotgames.com/userinfo',
      options: Options(headers: headers),
    );
    return response.data['sub'];
  }

  @override
  Future<WeaponSkinlevel> fetchWeaponSkinLevelByUuid(String uuid) async {
    final response = await _dio.get(
      'https://valorant-api.com/v1/weapons/skinlevels/$uuid',
      queryParameters: {'language': 'ja-JP'},
    );
    final weapon = WeaponSkinlevel.fromJson(response.data['data']);
    return weapon;
  }

  Future<List<Cookie>> fetchCookies() async {
    final url = 'https://auth.riotgames.com/api/v1/authorization';
    final data = {
      'client_id': 'play-valorant-web-prod',
      'nonce': '1',
      'redirect_uri': 'https://playvalorant.com/opt_in',
      'response_type': 'token id_token'
    };

    final cookieJar = CookieJar();
    final manager = CookieManager(cookieJar);
    _dio.interceptors.add(manager);

    await _dio.post(url, data: data);

    final cookies = await cookieJar.loadForRequest(Uri.parse(url));
    _dio.interceptors.remove(manager);
    return cookies;
  }
}
