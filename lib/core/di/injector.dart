import 'package:marvel/core/di/injector.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

const dev = Environment('dev');
const prod = Environment('prod');

@InjectableInit(preferRelativeImports: false)
Future<void> configure(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.init(environment: environment);
}
