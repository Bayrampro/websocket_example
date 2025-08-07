import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/data/data_sources/binance_socket_client.dart';
import 'package:websocket_example/data/repo/trade_repository_impl.dart';
import 'package:websocket_example/domain/repo/trade_repository.dart';
import 'package:websocket_example/presentation/bloc/trade_bloc/trade_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  registerServices();
  registerRepositories();
  registerBlocs();
}

void registerServices() {
  final talker = TalkerFlutter.init();
  getIt.registerLazySingleton(() => talker);
  getIt.registerFactory<BinanceSocketClient>(() => BinanceSocketClientImpl());
}

void registerRepositories() {
  getIt.registerLazySingleton<TradeRepository>(
    () => TradeRepositoryImpl(getIt.get<BinanceSocketClient>()),
  );
}

void registerBlocs() {
  getIt.registerFactory<TradeBloc>(
    () => TradeBloc(getIt.get<TradeRepository>()),
  );
}
