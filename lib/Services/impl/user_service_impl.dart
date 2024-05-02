import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Entities/User.dart';
import 'package:sportifyy/Models/Requests/sign_up_req.dart';
import 'package:sportifyy/Repositories/user_repository.dart';
import 'package:sportifyy/Services/user_service.dart';

@LazySingleton(as: UserService)
class UserServiceImpl extends UserService {
  final UserRepository userRepository;

  UserServiceImpl(this.userRepository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> signUp(
      SignUpReq req) async {
    return await userRepository.createAccount(req);
  }
}
