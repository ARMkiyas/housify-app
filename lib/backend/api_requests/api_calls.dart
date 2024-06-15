import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MapBox Group Code

class MapBoxGroup {
  static String getBaseUrl({
    String? accessToken =
        'pk.eyJ1IjoiYXJta2l5YXMiLCJhIjoiY2x4M3AxdGtoMHh1ODJrcXN5MmZ4M3IwOCJ9.9rfUAlCtrMreMySDohv5ow',
  }) =>
      'https://api.mapbox.com';
  static Map<String, String> headers = {};
  static ReverseGeoLocationEncodingCall reverseGeoLocationEncodingCall =
      ReverseGeoLocationEncodingCall();
  static ForwareGeoLocationEncordingCall forwareGeoLocationEncordingCall =
      ForwareGeoLocationEncordingCall();
}

class ReverseGeoLocationEncodingCall {
  Future<ApiCallResponse> call({
    double? longitude = 0.0,
    double? latitude = 0.0,
    String? accessToken =
        'pk.eyJ1IjoiYXJta2l5YXMiLCJhIjoiY2x4M3AxdGtoMHh1ODJrcXN5MmZ4M3IwOCJ9.9rfUAlCtrMreMySDohv5ow',
  }) async {
    final baseUrl = MapBoxGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ReverseGeoLocationEncoding',
      apiUrl:
          '${baseUrl}/search/geocode/v6/reverse?limit=1&longitude=${longitude}&latitude=${latitude}&access_token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<double>? cordsList(dynamic response) => (getJsonField(
        response,
        r'''$.features[:].geometry.coordinates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? fullAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.full_address''',
      ));
  String? region(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.region.name''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.country.name''',
      ));
  String? locallityName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.locality.name''',
      ));
  double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.longitude''',
      ));
  double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.latitude''',
      ));
}

class ForwareGeoLocationEncordingCall {
  Future<ApiCallResponse> call({
    String? location = '',
    String? accessToken =
        'pk.eyJ1IjoiYXJta2l5YXMiLCJhIjoiY2x4M3AxdGtoMHh1ODJrcXN5MmZ4M3IwOCJ9.9rfUAlCtrMreMySDohv5ow',
  }) async {
    final baseUrl = MapBoxGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ForwareGeoLocationEncording',
      apiUrl:
          '${baseUrl}/search/geocode/v6/forward?q=${location}&access_token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? fullAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.full_address''',
      ));
  String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.locality.name''',
      ));
  List? fetures(dynamic response) => getJsonField(
        response,
        r'''$.features''',
        true,
      ) as List?;
}

/// End MapBox Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
