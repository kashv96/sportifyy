import 'package:dartz/dartz.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/sign_up_req.dart';

import '../Models/Entities/User.dart';

abstract class UserRepository {
  Future<Either<Failure, List<Map<String, dynamic>>>> createAccount(
      SignUpReq req);
}
