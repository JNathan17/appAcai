// ignore_for_file: prefer_const_constructors
import 'package:acai/models/lista_nome_acai.dart';
import 'package:acai/models/nome_app_bar.dart';
import 'package:acai/pages/cart_page.dart';
import 'package:acai/pages/home_page.dart';
import 'package:acai/pages/perfil_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  NomeAppBar nomeAppBar = NomeAppBar(nomeAppBar: 'Açai do Mugiwara');
  ListaNomeAcai listaNomeAcai = ListaNomeAcai();

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
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: listaNomeAcai.listaNomeAcai.length,
                itemBuilder: (context, index) {
                  final nomes = listaNomeAcai.listaNomeAcai[index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CartPage(nomeAcai: nomes)));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: Colors.grey[300],
                      title: Text(nomes.nomeAcai,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Text(nomes.descricao),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
