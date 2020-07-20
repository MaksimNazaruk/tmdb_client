import 'package:flutter/foundation.dart';

enum WebRequestType {
  GET,
  POST,
  PUT,
  DELETE,
}

extension WebRequestTypeValue on WebRequestType {
  String get name => describeEnum(this);
}

class WebRequest {
  final WebRequestType type;
  final String path;
  final Map<String, String> headers;
  final Map<String, String> params;
  final Map<String, dynamic> body; // used for post and put

  WebRequest({
    @required this.type,
    @required this.path,
    this.headers,
    this.params,
    this.body,
  });

  String fullUrl(String baseUrl) {
    String url = baseUrl + this.path;
    if (this.params != null && this.params.length >= 0) {
      url +=
          '?' + this.params.entries.map((e) => '${e.key}=${e.value}').join('&');
    }
    return url;
  }
}
