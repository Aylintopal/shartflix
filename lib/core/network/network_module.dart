import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

    if (baseUrl.isEmpty) {
      throw Exception('API_BASE_URL not found in .env file!');
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = getIt<SharedPreferences>();
          final token = prefs.getString('token');

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
