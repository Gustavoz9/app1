class Moeda {
  String nome;
  String sigla;
  String imagem;
  double preco;
  double porcento;
  double valorMaximo;
  double valorMinimo;

  Moeda(
      {required this.nome,
      required this.sigla,
      required this.preco,
      required this.porcento,
      required this.imagem,
      required this.valorMaximo,
      required this.valorMinimo});
}
