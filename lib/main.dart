import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/config/router/router.dart';
import 'package:websocket_example/config/theme/app_theme.dart';
import 'package:websocket_example/core/di/service_locator.dart';
import 'package:websocket_example/presentation/bloc/trade_bloc/trade_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupServiceLocator();
  Bloc.observer = TalkerBlocObserver(talker: getIt.get<Talker>());

  runApp(const WebSocketExample());
}

class WebSocketExample extends StatelessWidget {
  const WebSocketExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TradeBloc>(create: (context) => getIt.get<TradeBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: AppRouter.router,
        theme: appTheme,
      ),
    );
  }
}
