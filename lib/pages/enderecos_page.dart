import 'package:acai/models/lista_nome_endereco.dart';
import 'package:acai/models/nome_app_bar.dart';
import 'package:flutter/material.dart';

class EnderecosPage extends StatelessWidget {
  const EnderecosPage({super.key});

  @override
  Widget build(BuildContext context) {
    NomeAppBar nomeAppBar = NomeAppBar(nomeAppBar: 'Açai do Mugiwara');
    ListaNomeEndereco listaNomeEndereco = ListaNomeEndereco();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(nomeAppBar.nomeAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text('Endereços Cadastrados:'),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: listaNomeEndereco.listaNomeEndereco.length,
                  itemBuilder: (context, index) {
                    final nomesEndereco =
                        listaNomeEndereco.listaNomeEndereco[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nomesEndereco.nome,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                nomesEndereco.endereco,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Adicionar endereço')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
