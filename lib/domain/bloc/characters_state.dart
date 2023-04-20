part of 'characters_bloc.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.loading() = _Loading;
  const factory CharactersState.error() = _Error;
  const factory CharactersState.success(List<Character> characters) = _Success;
}
