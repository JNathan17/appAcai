// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:acai/models/nome_app_bar.dart';
import 'package:acai/pages/login_page.dart';
import 'package:acai/pages/perfil_page.dart';
import 'package:acai/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NomeAppBar nomeAppBar = NomeAppBar(nomeAppBar: 'Açai do Mugiwara');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.green,
        title: Text(nomeAppBar.nomeAppBar),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerfilPage()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      backgroundColor: const Color(0xFFf3eee8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Bem Vindos ao Açai do Mugiwara,\n aqui você encontra os melhores\n produtos relacionados a açai da\nregião',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ProductPage())));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00B2FF),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Conheça nossos produtos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
