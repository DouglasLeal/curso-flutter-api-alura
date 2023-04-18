import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:api/http/interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5)
);

const String baseUrl = "http://192.168.15.7:3000";
