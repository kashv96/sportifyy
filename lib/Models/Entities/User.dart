class User {
  final String? profileId;
  final String? userId;
  final String? name;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final bool isActive;
  final bool isArchived;
  final bool isDeleted;
  final bool? isPlayer;
  final double? averageRating;
  final DateTime? createdAt;

  User({
    this.profileId,
    this.userId,
    this.name,
    this.userName,
    this.phoneNumber,
    this.email,
    this.isActive = true,
    this.isArchived = false,
    this.isDeleted = false,
    this.isPlayer,
    this.averageRating,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profileId: json['id'],
      userId: json['user_id'],
      name: json['name'],
      userName: json['user_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      isActive: json['active'] ?? true,
      isArchived: json['archive'] ?? false,
      isDeleted: json['delete'] ?? false,
      isPlayer: json['is_player'],
      averageRating: json['average_rating'] != null
          ? double.tryParse(json['average_rating'].toString())
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': profileId,
      'user_id': userId,
      'name': name,
      'user_name': userName,
      'phone_number': phoneNumber,
      'email': email,
      'active': isActive,
      'archive': isArchived,
      'delete': isDeleted,
      'is_player': isPlayer,
      'average_rating': averageRating?.toString(),
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
