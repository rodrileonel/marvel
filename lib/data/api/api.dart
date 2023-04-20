import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/data/dto/characters_dto.dart';
import 'package:marvel/data/dto/error.dart';
import 'package:marvel/data/services/http_service.dart';

@lazySingleton
class LApi {
  final HttpService _httpService;
  LApi(this._httpService);

  Future<Either<ErrorDto, CharactersDto?>> getCharacters() async {
    try {
      final response = await _httpService.get('/characters');
      log(response.body, name: 'response');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(charactersDtoFromJson(response.body));
      } else {
        return const Left(ErrorDto.server('Server error'));
      }
    } catch (e) {
      return const Left(ErrorDto.unknow('Unknow error'));
    }
  }
}
