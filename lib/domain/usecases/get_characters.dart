import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/data/repository/repository.dart';
import 'package:marvel/domain/model/character.dart';

@injectable
class GetCharactersUseCase {
  GetCharactersUseCase(this._mwRepository);
  final LRepository? _mwRepository;

  Future<Either<String, List<Character>>> execute() async {
    final response = await _mwRepository!.getCharacters();
    return response.fold((error) {
      return Left(error);
    }, (ch) async {
      List<Character> chars = [];
      ch?.data?.results?.forEach((r) {
        chars.add(Character(
          id: r.id,
          name: r.name,
          description: r.description,
          modified: r.modified,
          thumbnail: '${r.thumbnail?.path}.${r.thumbnail?.extension}',
          comics: r.comics?.items?.map((e) => e.name??'').toList(),
          events: r.events?.items?.map((e) => e.name??'').toList(),
          series: r.series?.items?.map((e) => e.name??'').toList(),
          stories: r.stories?.items?.map((e) => e.name??'').toList(),
        ));
      });
      return Right(chars);
    });
  }
}
