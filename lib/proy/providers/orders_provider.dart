import 'package:flutter/foundation.dart' show kIsWeb;

export 'orders_provider_mobile.dart'
    if (dart.library.io) 'orders_provider_mobile.dart'
    if (dart.library.html) 'orders_provider_web.dart';
