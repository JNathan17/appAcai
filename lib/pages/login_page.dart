import 'package:acai/pages/criar_conta_page.dart';
import 'package:acai/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _validateLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedEmail = prefs.getString('email') ?? '';
    String savedPassword = prefs.getString('password') ?? '';
    return _emailController.text == savedEmail &&
        _passwordController.text == savedPassword;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de Login'),
          content: const Text(
              'Email ou senha incorretos. Por favor, tente novamente.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFf3eee8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/mugiwara.png", height: 120),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: TextField(
              controller: _emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFB7B7B7),
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: TextField(
              controller: _passwordController,
              cursorColor: Colors.black,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFB7B7B7),
                labelText: 'Senha',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                suffixIcon: GestureDetector(
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF46295A),
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(color: Colors.black),
            ),
            onPressed: () async {
              bool isValid = await _validateLogin();
              if (isValid) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else {
                _showErrorDialog();
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B2FF),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: const BorderSide(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CriarConta()),
                );
              },
              child: const Text(
                'Cadastre-se',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
