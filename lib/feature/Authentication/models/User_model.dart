class UserModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
