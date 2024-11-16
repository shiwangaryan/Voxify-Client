class UserModel {
  String username;
  String email;
  String password;
  String realName;
  bool showRealName;
  String profilePicURL;
  String registrationDate;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.realName,
    required this.showRealName,
    required this.profilePicURL,
    required this.registrationDate,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'realName': realName,
      'showRealName': showRealName,
      'profilePicURL': profilePicURL,
      'registrationDate': registrationDate,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      realName: json['realName'],
      showRealName: json['showRealName'],
      profilePicURL: json['profilePicURL'],
      registrationDate: json['registrationDate'],
    );
  }
}
