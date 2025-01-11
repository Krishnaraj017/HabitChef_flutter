import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../constants/hive_constants.dart';

abstract class TokenLocalDataSource {
  Future<void> cacheAccessToken(String token);

  Future<void> cacheRefreshToken(String token);

  Future<void> cacheFCMToken({required String fcmToken});

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getFCMToken();

  Future<void> deleteAccessToken();

  Future<void> deleteRefreshToken();

  Future<void> deleteAllTokens();
  
}

@LazySingleton(as: TokenLocalDataSource)
class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  @override
  Future<void> cacheAccessToken(String token) async {
    final box = Hive.box('userBox');
    print("storing access token");
    await box.put('accessToken', token);
    var res = box.get('accessToken');
    print("token  stored is +++++$res");
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.put(HiveConstants.refreshTokenKey, token);
  }

  @override
  Future<void> cacheFCMToken({required String fcmToken}) async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.put(HiveConstants.fcmToken, fcmToken);
  }

  @override
  Future<void> deleteAccessToken() async {
    final box = Hive.box('userBox');
    await box.delete('accessToken');
  }

  @override
  Future<void> deleteAllTokens() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.deleteAll(
      [HiveConstants.accessTokenKey, HiveConstants.refreshTokenKey],
    );
  }

  @override
  Future<void> deleteRefreshToken() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.delete(HiveConstants.refreshTokenKey);
  }

  @override
  Future<String?> getAccessToken() async {
    // Hive.openBox('userBox');
    final box = Hive.box('userBox');
    var res = box.get('accessToken');
    print("token is +++++$res");
    return res;
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = Hive.box(HiveConstants.tokenBoxName);
    return box.get(HiveConstants.refreshTokenKey);
  }

  @override
  Future<String?> getFCMToken() async {
    final box = Hive.box(HiveConstants.tokenBoxName);
    return box.get(HiveConstants.fcmToken);
  }

 
}
