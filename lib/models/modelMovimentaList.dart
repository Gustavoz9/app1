class MovimentaModel {
  String siglaMoeda;
  String quantidadeComprada;
  String dataDaCompra;
  double valorDaQuantidade;

  MovimentaModel({
    required this.siglaMoeda,
    required this.quantidadeComprada,
    required this.valorDaQuantidade,
    required this.dataDaCompra,
  });
}
