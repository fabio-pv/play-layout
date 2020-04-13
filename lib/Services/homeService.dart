import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:play_layout/Models/post.dart';

class HomeService {
  Future<List<Post>> retriveAll() async {
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode != 200) {
        throw new Exception('Error');
      }

      Iterable postDecode = jsonDecode(response.body);
      List<Post> postList = postDecode.map((x) => Post.fromMap(x)).toList();

      return postList;
    } catch (e) {
      rethrow;
    }
  }
}
