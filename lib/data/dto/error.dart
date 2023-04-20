import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

@freezed
class ErrorDto with _$ErrorDto {
  const factory ErrorDto.server(String message) = _Server;
  const factory ErrorDto.unknow(String message) = _Unknow;
}
