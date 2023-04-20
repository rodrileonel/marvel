import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/domain/model/character.dart';
import 'package:marvel/domain/usecases/get_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';
part 'characters_bloc.freezed.dart';

@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this._getCharactersUseCase)
      : super(const CharactersState.loading()) {
    on<_GetCharacters>(_getCharacters);
  }

  final GetCharactersUseCase? _getCharactersUseCase;

  FutureOr<void> _getCharacters(
      _GetCharacters event, Emitter<CharactersState> emit) async {
    emit(const CharactersState.loading());

    try {
      final response = await _getCharactersUseCase!.execute();
      response.fold((error) {
        emit(const CharactersState.error());
      }, ((items) {
        emit(CharactersState.success(items));
      }));
    } catch (e) {
      emit(const CharactersState.error());
    }
  }
}
