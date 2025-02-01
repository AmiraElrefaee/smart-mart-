class RegisterEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String coPass;

  RegisterEntity({
    required this.coPass,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
