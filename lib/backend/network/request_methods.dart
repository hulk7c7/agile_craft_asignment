import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/presentation/home/models/product_model.dart';
import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {


  Future<ProductList?> getRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    int? statusCode = 200,
    required BuildContext context,
    String? purpose
  }) async {
    try {
      final uri = Uri.parse('$targetUrl').replace(queryParameters: queryParameters);
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == statusCode) {
        if (response.body.isNotEmpty) {
          final dynamic responseData = jsonDecode(response.body);
          print('Response data: $responseData');
          //return jsonDecode(response.body);
          return ProductList.fromJson(jsonDecode(response.body));
        } else {
          print('Response body is empty.');
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      SnackBar(content: Text('$e'));
      throw Exception('Error in GET request: $e');
    }
    return null;
  }


  Future<Map<String, dynamic>?> postRequest({
    required String targetUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int? statusCode,
    required BuildContext context,
    String? purpose
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
        if(purpose=="login") {
          showCustomSnackBar(
            context: context,
            title: 'Unable to Sign In!',
            message: "Please check your credentials again.",
            contentType: ContentType.failure,
          );
        }
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
