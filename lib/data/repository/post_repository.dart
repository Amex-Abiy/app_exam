import 'package:app_exam/data/provider/post_data.dart';
import 'package:app_exam/data/model/post.dart';
import 'package:flutter/cupertino.dart';

class PostRepository {
   
   PostDataProvider postDataProvider;

   PostRepository({@required this.postDataProvider}) : assert(postDataProvider != null);

   Future<List<Post>> getPosts() async {
     return await this.postDataProvider.getPosts();
   }
}