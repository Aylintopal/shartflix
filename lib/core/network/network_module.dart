import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

    if (baseUrl.isEmpty) {
      throw Exception('API_BASE_URL not found in .env file!');
    }

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}