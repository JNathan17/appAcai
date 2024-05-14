import 'package:acai/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _emailController.text = prefs.getString('email') ?? '';
    _passwordController.text = prefs.getString('password') ?? '';
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
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00B2FF),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: const BorderSide(color: Colors.black),
              ),
              onPressed: () async {
                await _saveData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
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
