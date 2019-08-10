import 'package:news/src/resources/news_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';


void main() {
  test('FetchTopMethod return List of IDs', () async {
    // Setup test case
    final newsApi = newsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1,2,3,4]), 200);
    });

    final ids = await newsApi.fetchTopID();

    // expectition
    expect(ids, [1,2,3,4]);
  });
}