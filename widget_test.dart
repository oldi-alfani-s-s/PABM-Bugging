import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Login button test', (WidgetTester tester) async {
    // Build aplikasi
    await tester.pumpWidget(MyApp());

    // Cari input field dan tombol login
    final usernameField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final loginButton = find.text("Login");

    // Input data login
    await tester.enterText(usernameField, 'user');
    await tester.enterText(passwordField, 'password');
    await tester.tap(loginButton);

    // Rebuild UI setelah tap
    await tester.pump();

    // Pastikan pesan sukses ditampilkan
    expect(find.text('Login berhasil!'), findsOneWidget);
  });

  testWidgets('Invalid login shows error message', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final usernameField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final loginButton = find.text("Login");

    await tester.enterText(usernameField, 'wrongUser');
    await tester.enterText(passwordField, 'wrongPass');
    await tester.tap(loginButton);

    await tester.pump();

    expect(find.text('Username atau Password salah.'), findsOneWidget);
  });
}
