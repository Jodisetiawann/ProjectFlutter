import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static const String _baseUrl =
      "https://api.jsonbin.io/v3/b/65421a4254105e766fc9df20";
  final bookData = [].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      var response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        bookData.value = jsonData['items'];
        print('Data:: $bookData');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {}
  }
}
