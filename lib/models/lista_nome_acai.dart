import 'package:acai/models/nome_acai.dart';

class ListaNomeAcai{
  List<NomeAcai> listaNomeAcai = [
    NomeAcai(nomeAcai: 'Um açai tradicional', descricao: 'Açai com mousse de morango, granulado e cobertura'),
    NomeAcai(nomeAcai: 'Açai cremoso', descricao: 'Açai com sorvete, sabor que voce quiser, nutella e leite condensado'),
    NomeAcai(nomeAcai: 'Sorvete', descricao: 'Sorvete de baunilha'),
    NomeAcai(nomeAcai: 'Mousse', descricao: 'Mousse de maracujá'),
  ];

  List<NomeAcai> getListaNomeAcai(){
    return listaNomeAcai;
  } 
}