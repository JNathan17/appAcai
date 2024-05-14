// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:acai/models/nome_acai.dart';
import 'package:acai/models/nome_app_bar.dart';
import 'package:acai/pages/enderecos_page.dart';
import 'package:acai/pages/login_page.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  NomeAppBar nomeAppBar = NomeAppBar(nomeAppBar: 'Açai do Mugiwara');

  List<NomeAcai> listaNomeAcai = [
    NomeAcai(
        nomeAcai: 'Um açai tradicional',
        descricao: 'Açai com mousse de morango, granulado e cobertura'),
    NomeAcai(
        nomeAcai: 'Açai cremoso',
        descricao:
            'Açai com sorvete, sabor que voce quiser, nutella e leite condensado'),
    NomeAcai(nomeAcai: 'Sorvete', descricao: 'Sorvete de baunilha'),
    NomeAcai(nomeAcai: 'Mousse', descricao: 'Mousse de maracujá'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(nomeAppBar.nomeAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/perfil.jfif'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Crente das novinhas',
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnderecosPage()),
                  );
                },
                tileColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text('Meus endereços'),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text('Sair'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
