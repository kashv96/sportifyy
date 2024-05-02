class SignUpReq {
  final String? name;
  final String? userName;
  final String? password;
  final String? phoneNumber;
  final String? email;
  final bool? isPlayer;

  SignUpReq({
    this.name,
    this.userName,
    this.password,
    this.phoneNumber,
    this.email,
    this.isPlayer,
  });

  factory SignUpReq.fromJson(Map<String, dynamic> json) {
    return SignUpReq(
      name: json['name'],
      userName: json['user_name'],
      password: json['password'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      isPlayer: json['is_player'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'user_name': userName,
      'phone_number': phoneNumber,
      'password': password,
      'email': email,
      'is_player': isPlayer,
    };
  }
}
