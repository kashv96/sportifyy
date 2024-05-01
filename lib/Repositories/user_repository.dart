abstract class UserRepository {
  Future<void> createAccount(
      String username, String password, String fullName, String email);
}
