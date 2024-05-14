// ignore_for_file: prefer_const_constructors

import 'package:acai/models/nome_acai.dart';
import 'package:acai/models/nome_app_bar.dart';
import 'package:acai/pages/pedido_feito_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final NomeAcai nomeAcai;

  const CartPage({super.key, required this.nomeAcai});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  NomeAppBar nomeAppBar = NomeAppBar(nomeAppBar: 'Açai do Mugiwara');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(nomeAppBar.nomeAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              tileColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(widget.nomeAcai.nomeAcai),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B2FF),
                  minimumSize: const Size(250, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PedidoFeitoPage()),
                  );
                },
                child: Text(
                  'Pagar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
