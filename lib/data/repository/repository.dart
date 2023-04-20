import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/data/api/api.dart';
import 'package:marvel/data/dto/characters_dto.dart';

abstract class LRepository {
  Future<Either<String, CharactersDto?>> getCharacters();
}

class LRepositoryNetwork implements LRepository {
  final mwApi = GetIt.I.get<LApi>();

  @override
  Future<Either<String, CharactersDto?>> getCharacters() async {
    final response = await mwApi.getCharacters();
    return response.fold((error) {
      return Left(error.message);
    }, (m) async {
      return Right(m);
    });
  }
}
