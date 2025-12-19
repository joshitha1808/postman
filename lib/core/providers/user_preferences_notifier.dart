import 'package:postman/core/model/user_preferences.dart';
import 'package:postman/init_dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user_preferences_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserPreferencesNotifier extends _$UserPreferencesNotifier {
  @override
  UserPreferences build() {
    // Load cached user preferences from ObjectBox
    final store = serviceLocator.get<Store>();
    return store.box<UserPreferences>().query().build().findFirst() ??
        UserPreferences();
  }

  Future<void> updatePreferences(UserPreferences newPreferences) async {}

  // Manually clear user preferences
  void clearUserPreferences() {
    serviceLocator.get<Store>().box<UserPreferences>().removeAll();
  }
}
