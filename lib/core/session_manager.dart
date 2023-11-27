import 'package:hive_flutter/hive_flutter.dart';

class SessionManager {
  final Box box = Hive.box('session');

  void setSession(
      int id, String token, String email, String firstName, String lastName, String userAvatar
      ) {
    // Store data to session
    box.put(AppKey.idKey, id);
    box.put(AppKey.tokenKey, token);
    box.put(AppKey.emailKey, email);
    box.put(AppKey.firstNameKey, firstName);
    box.put(AppKey.lastNameKey, lastName);
    box.put(AppKey.userAvatarKey, userAvatar);
  }

  int? getActiveId() => box.get(AppKey.idKey);
  String? getActiveToken() => box.get(AppKey.tokenKey);
  String? getActiveEmail() => box.get(AppKey.emailKey);
  String? getActiveFirstName() => box.get(AppKey.firstNameKey);
  String? getActiveLastName() => box.get(AppKey.lastNameKey);
  String? getActiveUserAvatar() => box.get(AppKey.userAvatarKey);

  bool anyActiveSession() {
    int? activeId = getActiveId();
    String? activeToken = getActiveToken();
    String? activeEmail = getActiveEmail();
    String? activeFirstName = getActiveFirstName();
    String? activeLastName = getActiveLastName();
    String? activeUserAvatar = getActiveUserAvatar();
    return activeId != null &&
        activeToken != null &&
        activeEmail != null &&
        activeFirstName != null &&
        activeLastName != null &&
        activeUserAvatar != null;
  }

  void signOut() {
    box.delete(AppKey.idKey);
    box.delete(AppKey.tokenKey);
    box.delete(AppKey.firstNameKey);
    box.delete(AppKey.emailKey);
    box.delete(AppKey.lastNameKey);
    box.delete(AppKey.userAvatarKey);
  }
}

class AppKey {
  static const String idKey = 'ID_KEY';
  static const String tokenKey = 'TOKEN_KEY';
  static const String emailKey = 'EMAIL_KEY';
  static const String firstNameKey = 'FIRSTNAME_KEY';
  static const String lastNameKey = 'LASTNAME_KEY';
  static const String userAvatarKey = 'USERAVATAR_KEY';
}
