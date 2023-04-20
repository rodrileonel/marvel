import 'package:injectable/injectable.dart';
import 'package:marvel/data/repository/repository.dart';

@module
abstract class RegisterRepositories {
  @lazySingleton
  LRepository appInfoRepo() => LRepositoryNetwork();
}
