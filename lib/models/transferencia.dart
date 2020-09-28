class Transferencia {
  final String descricao;
  final int valor;

  Transferencia(
    this.descricao,
    this.valor,
  );

  @override
  String toString() {
    return 'Transferencia{descricao: $descricao, valor: $valor}';
  }
}
