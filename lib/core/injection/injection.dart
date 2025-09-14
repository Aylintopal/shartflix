import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/injection/injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
