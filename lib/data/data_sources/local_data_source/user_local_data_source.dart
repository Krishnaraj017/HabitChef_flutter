import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class UserLocalDataSource {
  Future<String?> getUser();

  Future<void> cacheUserName({
    required String userName,
  });

  Future<void> clearUser();
  Future<void> stroeUserLoggedStatus();
  Future<bool> isUserLoggedIn();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<String?> getUser() async {
    var box = Hive.box('userBox');
    return box.get('userName');
  }

  @override
  Future<void> clearUser() async {
    return;
  }

  @override
  Future<void> cacheUserName({required String userName}) async {
    var box = Hive.box('userBox');
    await box.put('userName', userName);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    var box = Hive.box('userBox');
    print("calli g hre");
    return await box.get('isUserLoggedIn', defaultValue: false);
  }

  @override
  Future<void> stroeUserLoggedStatus() {
    var box = Hive.box('userBox');
    box.put('isUserLoggedIn', true);
    return Future.value();
  }
  // @override
  // Stream<User> watchUser() async* {
  //   final userBox = await Hive.openBox<User>(HiveConstants.userBox);

  //   // Using watch() to get a stream of BoxEvent
  //   yield* userBox.watch(key: HiveConstants.userKey).map((event) {
  //     return event.value as User;
  //   });
  // }
}
