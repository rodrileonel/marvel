import 'package:injectable/injectable.dart';
import 'package:marvel/core/config/config.dart';

@prod
@Injectable(as: Config)
class ProdConfig implements Config {
  @override
  String get flavorName => 'Prod';

  @override
  String get baseUrl => 'https://gateway.marvel.com:443/v1/public';

  @override
  String get publicKey => 'fea4ddbf370376865724c2b03db5ffef';
  
  @override
  String get privateKey => 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
}
