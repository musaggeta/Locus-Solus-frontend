import '../models/user_model.dart';

class AuthService {
  final List<UserModel> _users = [];

  bool login(String email, String password) {
    // Simulación simple de autenticación
    return _users.any((u) => u.email == email);
  }

  void register(UserModel user, String password) {
    _users.add(user);
  }
}
