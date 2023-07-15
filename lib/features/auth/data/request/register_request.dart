class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? phone;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
}