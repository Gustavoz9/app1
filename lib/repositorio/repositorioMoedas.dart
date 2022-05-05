import 'package:app1/models/modelView.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 70000,
      porcento: 0.50,
      imagem: 'assets/imagens/bitcoin_icon.png',
      valorMaximo: 3,
      valorMinimo: 0.50,
    ),
    Moeda(
      nome: 'Dogecoin',
      sigla: 'DOGE',
      preco: 5000,
      porcento: 5.2,
      imagem: 'assets/imagens/dogecoin_icon.png',
      valorMaximo: 7,
      valorMinimo: 5.2,
    ),
    Moeda(
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 23000,
      porcento: 7.10,
      imagem: 'assets/imagens/litecoin_icon.png',
      valorMaximo: 8,
      valorMinimo: 7.10,
    ),
    Moeda(
      nome: 'Etherium',
      sigla: 'ETC',
      preco: 50000,
      porcento: 0.10,
      imagem: 'assets/imagens/eterium.png',
      valorMaximo: 2,
      valorMinimo: 0.10,
    ),
  ];
}
