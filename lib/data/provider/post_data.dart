import 'dart:convert';
import 'package:app_exam/data/model/post.dart';
import 'package:app_exam/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostDataProvider {

  final http.Client httpClient;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  PostDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Post>> getPosts() async {
    // TO-DO: implement pagination !! DONT FORGET
    // int start = HomeState.start;
    int limit = HomeState.limit;
    final response = await httpClient.get('$_baseUrl/posts/?_start=0&_limit=$limit');
    final body = json.decode(response.body);

    if(body[0] != null) {
      return body.map<Post>((post) => Post.fromJSON(post)).toList();
    }
     // THROW ERROR DONT FORGRT
  }
}