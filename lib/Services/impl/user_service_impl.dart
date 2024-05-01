import 'package:injectable/injectable.dart';
import 'package:sportifyy/Repositories/user_repository.dart';
import 'package:sportifyy/Services/user_service.dart';

@LazySingleton(as: UserService)
class UserServiceImpl extends UserService {
  final UserRepository userRepository;

  UserServiceImpl(this.userRepository);

  @override
  Future<void> signUp(
      String username, String password, String fullName, String email) async {
    return await userRepository.createAccount(
        username, password, fullName, email);
  }
}
