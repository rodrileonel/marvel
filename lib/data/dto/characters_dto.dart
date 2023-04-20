// To parse this JSON data, do
//
//     final charactersDto = charactersDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'characters_dto.freezed.dart';
part 'characters_dto.g.dart';

CharactersDto charactersDtoFromJson(String str) => CharactersDto.fromJson(json.decode(str));

String charactersDtoToJson(CharactersDto data) => json.encode(data.toJson());

@freezed
class CharactersDto with _$CharactersDto {
    const factory CharactersDto({
        int? code,
        String? status,
        String? copyright,
        String? attributionText, 
        String? attributionHtml,
        String? etag,
        Data? data,
    }) = _CharactersDto;

    factory CharactersDto.fromJson(Map<String, dynamic> json) => _$CharactersDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        int? offset,
        int? limit,
        int? total,
        int? count,
        List<Result>? results,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Result with _$Result {
    const factory Result({
        int? id,
        String? name,
        String? description,
        String? modified,
        Thumbnail? thumbnail,
        String? resourceUri,
        Comics? comics,
        Comics? series,
        Stories? stories,
        Comics? events,
        List<Url>? urls,
    }) = _Result;

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Comics with _$Comics {
    const factory Comics({
        int? available,
        String? collectionUri,
        List<ComicsItem>? items,
        int? returned,
    }) = _Comics;

    factory Comics.fromJson(Map<String, dynamic> json) => _$ComicsFromJson(json);
}

@freezed
class ComicsItem with _$ComicsItem {
    const factory ComicsItem({
        String? resourceUri,
        String? name,
    }) = _ComicsItem;

    factory ComicsItem.fromJson(Map<String, dynamic> json) => _$ComicsItemFromJson(json);
}

@freezed
class Stories with _$Stories {
    const factory Stories({
        int? available,
        String? collectionUri,
        List<StoriesItem>? items,
        int? returned,
    }) = _Stories;

    factory Stories.fromJson(Map<String, dynamic> json) => _$StoriesFromJson(json);
}

@freezed
class StoriesItem with _$StoriesItem {
    const factory StoriesItem({
        String? resourceUri,
        String? name,
        String? type,
    }) = _StoriesItem;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => _$StoriesItemFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
    const factory Thumbnail({
        String? path,
        String? extension,
    }) = _Thumbnail;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);
}

@freezed
class Url with _$Url {
    const factory Url({
        String? type,
        String? url,
    }) = _Url;

    factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
}
