import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Models/Entities/User.dart';
import 'package:sportifyy/Models/Requests/sign_up_req.dart';
import 'package:sportifyy/Services/user_service.dart';

import '../Exceptions/failures.dart';

@lazySingleton
class UserProvider with ChangeNotifier {
  final UserService _userService;
  late User _iamUser;
  String _username = '';
  String _password = '';
  String _fullName = '';
  String _email = '';
  String _phoneNumber = '';
  bool _isPlayer = true;

  UserProvider(this._userService);

  String get username => _username;
  String get password => _password;
  String get fullName => _fullName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  bool get isPlayer => _isPlayer;
  User get iamUser => _iamUser;

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

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setIsPlayer(bool value) {
    _isPlayer = value;
    notifyListeners();
  }

  Future<void> signUp() async {
    SignUpReq req = SignUpReq(
        name: _fullName,
        password: password,
        userName: _username,
        email: _email,
        phoneNumber: _phoneNumber,
        isPlayer: _isPlayer);

    Either<Failure, List<Map<String, dynamic>>> response =
        await _userService.signUp(req);
    response.fold((l) => throw Exception(l.toString()), (r) {
      print(r);
      if (r.isNotEmpty) {
        _iamUser = User.fromJson(r.first);
        notifyListeners();
      }
    });
  }
}
