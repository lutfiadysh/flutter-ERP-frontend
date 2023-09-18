import 'package:flutter/foundation.dart' show kIsWeb;

export 'invoices_provider_mobile.dart'
    if (dart.library.io) 'invoices_provider_mobile.dart'
    if (dart.library.html) 'invoices_provider_web.dart';
