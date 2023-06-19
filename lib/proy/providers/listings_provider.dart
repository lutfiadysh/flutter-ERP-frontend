import 'package:flutter/foundation.dart' show kIsWeb;

export 'listings_provider_mobile.dart'
    if (dart.library.io) 'listings_provider_mobile.dart'
    if (dart.library.html) 'listings_provider_web.dart';
