import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:module_app/presentation/controllers/home_controller.dart';

import '../../helper/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late MockClient mockHttpClient;
  late HomeController controller;

  setUp(() {
    mockHttpClient = MockClient();
    controller = HomeController();
  });

  group('fectPosts function', () {
    final responseJson = jsonDecode(readJson('dummy_data/mebel_detail.json'));
    final expectedBooks = responseJson['record'];

    final url =
        Uri.parse('https://api.jsonbin.io/v3/b/65421a4254105e766fc9df20');

    test('should return books data successfully', () async {
      // Arrange
      when(mockHttpClient.get(url)).thenAnswer(
        (_) async =>
            http.Response(readJson('dummy_data/mebel_detail.json'), 200),
      );

      // Act
      await controller.fetchPosts();

      // assert
      expect(controller.bookData.isNotEmpty, true);
    });

    test('should return books data correctly when response is 200', () async {
      // Arrange
      when(mockHttpClient.get(url)).thenAnswer(
        (_) async =>
            http.Response(readJson('dummy_data/mebel_detail.json'), 200),
      );

      // Act
      await controller.fetchPosts();

      // assert
      final books = controller.bookData;
      expect(books, expectedBooks);
    });
  });
}
