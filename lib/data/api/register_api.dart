import 'package:injectable/injectable.dart';
import 'package:marvel/core/config/config.dart';
import 'package:marvel/data/services/http_service.dart';

@module
abstract class RegisterApi {
  @preResolve
  @lazySingleton
  Future<HttpService> api(Config config) async {
    return HttpService(
        baseUrl: config.baseUrl,
        privateKey: config.privateKey,
        publicKey: config.publicKey);
  }
}
