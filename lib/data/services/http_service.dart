import 'dart:developer';

import 'package:http/http.dart';
import 'package:marvel/data/api/config_api.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';


class HttpService {
  final Client _client;
  final ConfigApi _configApi;
  final String baseUrl;
  final String publicKey;
  final String privateKey;

  HttpService( {
    Client? client,
    ConfigApi? configApi,
    required this.baseUrl,
    required this.publicKey,
    required this.privateKey,
  })  : _client = client ?? Client(),
        _configApi = configApi ?? ConfigApi();

  Future<Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? arguments,
  }) async {
    log('$baseUrl$endpoint', name: 'http');
    final ts = DateTime.now().millisecondsSinceEpoch;
    final hash = md5.convert(utf8.encode('$ts$privateKey$publicKey')).toString();
    final Map<String, dynamic> args ={};
    args.addAll(arguments??{});
    args.addAll( {'apikey':publicKey,'hash':hash,'ts':'$ts'});
    log({'apikey':publicKey,'hash':hash,'ts':'$ts'}.toString(), name: 'request');
    return _client.get(
      Uri.parse('$baseUrl$endpoint').replace(queryParameters: args),
      headers: headers ?? await _configApi.headers,
    );
  }

  Future<Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    log('$baseUrl$endpoint', name: 'http');
    return _client.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? await _configApi.headers,
      body: body,
    );
  }
}
