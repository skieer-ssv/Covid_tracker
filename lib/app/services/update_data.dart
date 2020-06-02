import 'api_service.dart';
import 'api.dart';
import 'package:flutter/foundation.dart';

class UpdateData with ChangeNotifier {
  String _cases = '...';
  String _recovered = '...';
  String _deaths = '...';
  String _active = '...';
  String _accessToken = '';
  String get cases => _cases;
  String get active => _active;
  String get deaths => _deaths;
  String get recovered => _recovered;
  void updateData() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.cases);
    final recovered = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.recovered);
    final deaths = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.deaths);
    final active = await apiService.getEndpointData(
        accessToken: accessToken, endpoint: Endpoint.active);
    _accessToken = accessToken;
    _cases = cases.toString();
    _recovered = recovered.toString();
    _deaths = deaths.toString();
    _active = active.toString();
    notifyListeners();
    print(_cases);
  }
}
