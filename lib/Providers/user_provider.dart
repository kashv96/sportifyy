import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Services/user_service.dart';

@lazySingleton
class UserProvider with ChangeNotifier {
  final UserService _userService;

  String _username = '';
  String _password = '';
  String _fullName = '';
  String _email = '';

  UserProvider(this._userService);

  String get username => _username;
  String get password => _password;
  String get fullName => _fullName;
  String get email => _email;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    return await _userService.signUp(_username, _password, _fullName, _email);
  }
}
