import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/sign_up_req.dart';
import 'package:sportifyy/Repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final supabase = Supabase.instance.client;
  @override
  // Future<void> createAccount(
  //     String username, String password, String fullName, String? email) async {
  //   // final response = await Supabase.instance.client.auth
  //   //     .signUp(password: password, email: email);
  //   // if (response.user != null) {
  //   //   await createUserProfile(
  //   //     userId: response.user!.id,
  //   //     email: response.user!.email!,
  //   //     name: fullName,
  //   //     username: username,
  //   //   );
  //   // }
  // }
  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> createAccount(
      SignUpReq req) async {
    try {
      final profileData = {
        'user_id': '6ca7d524-b28c-4467-9c12-95fa2f61e0ce',
        'email': req.email,
        'name': req.name,
        'phone_number': req.phoneNumber,
        'user_name': req.userName,
        'is_player': req.isPlayer
      };

      // Perform the upsert operation
      List<Map<String, dynamic>> data =
          await supabase.from('Profiles').upsert(profileData).select();
      print(data);
      return Right(data); // Returns data on success
    } on PostgrestException catch (error) {
      print(error);
      // Specific error handling for known error patterns
      if (error.message.contains('duplicate key value violates')) {
        if (error.message.contains('email')) {
          return Left(Failure('Email already in use'));
        } else if (error.message.contains('phone_number')) {
          return Left(Failure('Phone number already in use'));
        } else if (error.message.contains('user_name')) {
          return Left(Failure('Username already taken'));
        }
      }
      return Left(Failure('Failed to create account: ${error.message}'));
    } catch (e) {
      // Catch-all for unexpected errors
      return Left(Failure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
