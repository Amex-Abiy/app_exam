import 'package:app_exam/data/bloc/post_event.dart';
import 'package:app_exam/data/model/post.dart';
import 'package:app_exam/widgets/error_widget.dart';
import 'package:app_exam/widgets/loading.dart';
import 'package:app_exam/widgets/post_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_exam/data/bloc/bloc.dart';
import 'package:app_exam/data/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:bottom_loader/bottom_loader.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static int start = 0;
  static int limit = 10;

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if(state is PostLoadError) {
             return ErrorLoading(state.error);
            }
            if (state is PostLoading) {
              BlocProvider.of<PostBloc>(context).add(GetPosts());
            }
            if (state is PostLoadSuccess) {
              return buildPosts(state.posts);
            }
            return LoadingWidget();
          },
        ),
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            BlocProvider.of<PostBloc>(context).add(GetPosts());
          });
        },
      )
    );
  }

  Widget buildPosts(List<Post> posts) {
    _scrollController..addListener(() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        limit += 10;
      });
      BlocProvider.of<PostBloc>(context).add(GetPosts());
    }
  });
  return ListView.builder(
    controller: _scrollController,
    itemCount: posts.length,
    itemBuilder: (context, index) {
      return PostWidget(posts[index]);
    }
  );
  }
}