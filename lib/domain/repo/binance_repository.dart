abstract interface class BinanceRepository<T> {
  void subscribeTo(String symbol);
  Stream<T> get data;
  void disconnect();
}
