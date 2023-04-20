// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:marvel/core/config/config.dart' as _i5;
import 'package:marvel/core/config/dev_config.dart' as _i7;
import 'package:marvel/core/config/prod_config.dart' as _i6;
import 'package:marvel/core/di/repository_module.dart' as _i11;
import 'package:marvel/data/api/api.dart' as _i10;
import 'package:marvel/data/api/register_api.dart' as _i12;
import 'package:marvel/data/repository/repository.dart' as _i8;
import 'package:marvel/data/services/http_service.dart' as _i9;
import 'package:marvel/domain/bloc/characters_bloc.dart' as _i3;
import 'package:marvel/domain/usecases/get_characters.dart' as _i4;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerApi = _$RegisterApi();
    final registerRepositories = _$RegisterRepositories();
    gh.factory<_i3.CharactersBloc>(
        () => _i3.CharactersBloc(gh<_i4.GetCharactersUseCase>()));
    gh.factory<_i5.Config>(
      () => _i6.ProdConfig(),
      registerFor: {_prod},
    );
    gh.factory<_i5.Config>(
      () => _i7.DevConfig(),
      registerFor: {_dev},
    );
    gh.factory<_i4.GetCharactersUseCase>(
        () => _i4.GetCharactersUseCase(gh<_i8.LRepository>()));
    await gh.lazySingletonAsync<_i9.HttpService>(
      () => registerApi.api(gh<_i5.Config>()),
      preResolve: true,
    );
    gh.lazySingleton<_i10.LApi>(() => _i10.LApi(gh<_i9.HttpService>()));
    gh.lazySingleton<_i8.LRepository>(() => registerRepositories.appInfoRepo());
    return this;
  }
}

class _$RegisterRepositories extends _i11.RegisterRepositories {}

class _$RegisterApi extends _i12.RegisterApi {}
