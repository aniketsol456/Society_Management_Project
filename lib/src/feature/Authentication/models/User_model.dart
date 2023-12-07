class Usermodel {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  const Usermodel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Phone": phoneNumber,
      "Password": password,
    };
  }
}
