import 'package:wazteless_layout/models/posts.dart';
import 'package:wazteless_layout/models/agrifood.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsRemoteService {
  Future<List<Posts>?> fetchPosts() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri /* , headers: */);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postsFromJson(jsonString);
    } else {
      return null;
    }
  }
}

class AgriFoodService {
  Future<List<AgriFood>?> fetchAgriFoodData() async {
    const String url =
        "https://ec.europa.eu/agrifood/api/beef/prices?_method=get&memberStateCodes=PT&years=2019,2020&months=1,3,9&weeks=5,6,7,8,40,41,42&beginDate=01/09/2019&endDate=02/02/2020&carcassCategories=heifers,cows";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonString = response.body;
        final decodedString = utf8.decode(jsonString.runes.toList());
        final data = agriFoodFromJson(decodedString);
        return data.isNotEmpty ? data : null;
      } else {
        print("Failed to fetch data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
