import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character({
    int? id,
    String? name,
    String? description,
    String? modified,
    String? thumbnail,
    List<String>? comics,
    List<String>? events,
    List<String>? series,
    List<String>? stories, 
  }) = _Character;
}
