import 'package:admin_dashboard/src/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'proy/api/BackendApi.dart';
import 'proy/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  BackendApi.configureDio();
  //Flurorouter.configureRoutes();

  if (TargetPlatform.windows == defaultTargetPlatform ||
      TargetPlatform.macOS == defaultTargetPlatform) {
    setWindowTitle('AdminKit');
    setWindowMinSize(const Size(480, 360));
    setWindowMaxSize(Size.infinite);
  }
  runApp(const MyApp());
}
