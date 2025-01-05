import 'package:flutter_test/flutter_test.dart';

// AuthService terpisah untuk login logika
class AuthService {
  bool login(String username, String password) {
    return username == 'user' && password == 'password';
  }
}

void main() {
  test('Login test - valid credentials', () {
    AuthService authService = AuthService();
    bool result = authService.login('user', 'password');
    expect(result, true); // Login sukses
  });

  test('Login test - invalid credentials', () {
    AuthService authService = AuthService();
    bool result = authService.login('wrongUser', 'wrongPass');
    expect(result, false); // Login gagal
  });

  test('Login test - empty username or password', () {
    AuthService authService = AuthService();
    bool result1 = authService.login('', 'password');
    bool result2 = authService.login('user', '');
    expect(result1, false);
    expect(result2, false);
  });
}
