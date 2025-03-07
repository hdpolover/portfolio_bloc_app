class AdminUser {
  final String id;
  final String name;
  final String email;
  final String password;

  AdminUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'AdminUser{id: $id, name: $name, email: $email, password: $password}';
  }
}
