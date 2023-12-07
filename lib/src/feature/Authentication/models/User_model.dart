class Usermodel {
  final String? id;
  final String _firstName;
  final String _lastName;
  final String _phoneNumber;
  final String _password;


  const Usermodel({
    this.id;
    required this.firstName;
    required this.lastName;
    required this.phoneNumber;
    required this.password;
  })
}