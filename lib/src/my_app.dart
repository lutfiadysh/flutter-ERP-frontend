import 'package:admin_dashboard/proy/providers/branches_provider.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/clients_provider.dart';
import 'package:admin_dashboard/proy/providers/dashboard_provider.dart';
import 'package:admin_dashboard/proy/providers/inputs_provider.dart';
import 'package:admin_dashboard/proy/providers/invoice_provider.dart';
import 'package:admin_dashboard/proy/providers/listings_provider.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/providers/outputs_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/proy/providers/transfers_provider.dart';
import 'package:admin_dashboard/proy/providers/user_form_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/routes/routes.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart' as routes;
import 'package:admin_dashboard/src/utils/hive/hive.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../proy/providers/auth_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await HiveUtils.init();
    themeModeBloc.add(const ThemeModeEvent.changeTheme(null));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TransfersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => InputsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OutputsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StocksProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BranchesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MovementsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SalesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => InvoicesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersProvider(),
        ),
      ],
      child: MyProyApp(appRouter: _appRouter),
    );
  }
}

class MyProyApp extends StatelessWidget {
  const MyProyApp({
    Key? key,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(key: key);

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return BlocProvider(
      create: (context) => themeModeBloc,
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            success: (themeMode) {
              return MaterialApp.router(
                scaffoldMessengerKey: NotificationsService.messengerKey,
                routerDelegate: AutoRouterDelegate.declarative(
                  _appRouter,
                  routes: (_) => [
                    if (authProvider.authStatus == AuthStatus.checking)
                      const routes.LockScreenOne()
                    else if (authProvider.authStatus ==
                        AuthStatus.authenticated)
                      const routes.MenuBar()
                    else if (authProvider.authStatus ==
                        AuthStatus.notauthenticated)
                      const routes.LoginOne()
                  ],
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                theme: ThemeClass.themeData(themeMode, context),
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.trackpad,
                    PointerDeviceKind.unknown
                  },
                ),
                title: 'AdminKit',
              );
            },
          );
        },
      ),
    );
  }
}
