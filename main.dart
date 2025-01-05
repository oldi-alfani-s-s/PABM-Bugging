import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Login Example")),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    setState(() {
      _errorMessage = '';
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    // Validasi sederhana
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Username dan Password tidak boleh kosong.';
      });
      return;
    }

    // Simulasi login
    if (username == 'user' && password == 'password') {
      setState(() {
        _errorMessage = 'Login berhasil!';
      });
    } else {
      setState(() {
        _errorMessage = 'Username atau Password salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _login,
            child: Text("Login"),
          ),
          SizedBox(height: 16),
          Text(
            _errorMessage,
            style: TextStyle(
              color: _errorMessage == 'Login berhasil!'
                  ? Colors.green
                  : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
