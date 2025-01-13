import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {


  Future<http.Response> getRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('$targetUrl').replace(queryParameters: queryParameters);
      final response = await http.get(uri, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Error in GET request: $e');
    }
  }


  Future<http.Response> postRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('$targetUrl');
      final response = await http.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return response;
    } catch (e) {
      throw Exception('Error in POST request: $e');
    }
  }


  Future<http.Response> putRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('$targetUrl');
      final response = await http.put(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return response;
    } catch (e) {
      throw Exception('Error in PUT request: $e');
    }
  }


  Future<http.Response> deleteRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('$targetUrl').replace(queryParameters: queryParameters);
      final response = await http.delete(uri, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Error in DELETE request: $e');
    }
  }
}
