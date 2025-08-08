import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:finance_house/core/di/app_bindings.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
