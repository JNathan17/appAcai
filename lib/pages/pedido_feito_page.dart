import 'package:flutter/material.dart';

class PedidoFeitoPage extends StatefulWidget {
  const PedidoFeitoPage({super.key});

  @override
  State<PedidoFeitoPage> createState() => _PedidoFeitoPageState();
}

class _PedidoFeitoPageState extends State<PedidoFeitoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfde0b8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF5DC560),
        title: const Text(
          'Açai do Mugiwara',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/entregador.png", height: 120),
            const Text(
              'Seu pedido sera preparado e\n chegara em breve a sua casa!\n OBRIGADO!',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B2FF),
                  minimumSize: const Size(250, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar para produtos',
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
