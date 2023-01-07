class UserModel {
  final String name;
  final String email;
  final String? profileImage;

  const UserModel({
    required this.name,
    required this.email,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      profileImage: map['profileImage'] != null ? map['profileImage'] as String : null,
    );
  }
}
