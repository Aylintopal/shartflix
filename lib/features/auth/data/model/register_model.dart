class RegisterModel {
  final String email;
  final String name;
  final String password;

  const RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'password': password,
  };
}
