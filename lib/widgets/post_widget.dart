import 'package:app_exam/data/model/post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  
  PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(post.id.toString()),
      title: Text(post.title.toString()),
      subtitle: Text(post.body.toString()),
    );
  }
}