import 'package:covid_tracker/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  recovered,
  active,
  deaths,
}

class API {
  API({@required this.apikey});
  final String apikey;

  factory API.sandbox() => API(apikey: APIKeys.ncovSandboxKeys);
  static final String host = 'apigw.nubentos.com';
  static final int port = 443;
  static final String basePath = 't/nubentos.com/ncovapi/2.0.0';
  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': "client_credentials"},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );
  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.recovered: 'recovered',
    Endpoint.deaths: 'deaths',
    Endpoint.active: 'active',
  };
}
