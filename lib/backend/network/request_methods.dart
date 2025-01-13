import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
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
      SnackBar(content: Text('$e'));
      throw Exception('Error in GET request: $e');
    }
  }


  Future<Map<String, dynamic>?> postRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int? statusCode,
    required BuildContext context
  }) async {
    try {
      final uri = Uri.parse('$targetUrl');
      print(targetUrl);
      print(headers);
      print(body);
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      // print('>>>>>>>>\n${response.statusCode}');
      // print('n${response.body}');
      if (response.statusCode == statusCode) {
        if (response.body.isNotEmpty) {
          final responseData = jsonDecode(response.body);
          print('Response data: $responseData');
          return jsonDecode(response.body);;
        } else {
          print('Response body is empty.');
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        const snackBar = SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
            title: 'Unable to Sign In!',
            message:
            'Please check your credentials again',
            contentType: ContentType.failure,
            inMaterialBanner: true,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (e) {
      SnackBar(content: Text('${e}'));
      throw Exception('Error in POST request: $e');
    }
  }


  Future<Map<String, dynamic>?> putRequest({
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
      return jsonDecode(response.body);
    } catch (e) {
      SnackBar(content: Text('$e'));
      throw Exception('Error in PUT request: $e');
    }
  }


  Future<Map<String, dynamic>?> deleteRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('$targetUrl').replace(queryParameters: queryParameters);
      final response = await http.delete(uri, headers: headers);
      return jsonDecode(response.body);
    } catch (e) {
      SnackBar(content: Text('$e'));
      throw Exception('Error in DELETE request: $e');
    }
  }
}
