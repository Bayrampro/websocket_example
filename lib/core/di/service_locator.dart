import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/data/data_sources/binance_socket_client.dart';
import 'package:websocket_example/data/repo/ticker_repository_impl.dart';
import 'package:websocket_example/data/repo/trade_repository_impl.dart';
import 'package:websocket_example/domain/entities/ticker_entity.dart';
import 'package:websocket_example/domain/entities/trade_entity.dart';
import 'package:websocket_example/domain/repo/binance_repository.dart';
import 'package:websocket_example/presentation/bloc/ticker_bloc/ticker_bloc.dart';
import 'package:websocket_example/presentation/bloc/trade_bloc/trade_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await registerServices();
  registerRepositories();
  registerBlocs();
}

Future<void> registerServices() async {
  final talker = TalkerFlutter.init();
  getIt.registerLazySingleton<Talker>(() => talker);
  getIt.registerFactory<BinanceSocketClient>(() => BinanceSocketClientImpl());
}

void registerRepositories() {
  getIt.registerLazySingleton<BinanceRepository<TradeEntity>>(
    () => TradeRepositoryImpl(getIt.get<BinanceSocketClient>()),
  );

  getIt.registerLazySingleton<BinanceRepository<TickerEntity>>(
    () => TickerRepositoryImpl(getIt.get<BinanceSocketClient>()),
  );
}

void registerBlocs() {
  getIt.registerFactory<TradeBloc>(
    () => TradeBloc(
      getIt.get<BinanceRepository<TradeEntity>>(),
      getIt.get<Talker>(),
    ),
  );

  getIt.registerFactory<TickerBloc>(
    () => TickerBloc(
      getIt.get<BinanceRepository<TickerEntity>>(),
      getIt.get<Talker>(),
    ),
  );
}
