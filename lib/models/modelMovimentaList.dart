class CardMovimentaModel {
  String siglaMoeda;
  String quantidadeComprada;
  String dataDaCompra;
  double valorDaQuantidade;

  CardMovimentaModel({
    required this.siglaMoeda,
    required this.quantidadeComprada,
    required this.valorDaQuantidade,
    required this.dataDaCompra,
  });
}
