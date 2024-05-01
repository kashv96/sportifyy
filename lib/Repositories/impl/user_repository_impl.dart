import 'package:injectable/injectable.dart';
import 'package:sportifyy/Repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
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

  Future<void> createAccount(
    String userId,
    String email,
    String? name,
    String? username,
  ) async {
    final profileData = {
      'user_id': '6ca7d524-b28c-4467-9c12-95fa2f61e0ce',
      'email': email,
      'name': name,
      'phone_number': 4372631296,
      'created_at': DateTime.now().toIso8601String(),
    };
    final result = await Supabase.instance.client
        .from('Profiles')
        .upsert(profileData)
        .select();
    print(result);
  }
}
