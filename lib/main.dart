import 'package:app_exam/data/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_exam/data/provider/post_data.dart';
import 'package:app_exam/data/repository/post_repository.dart';
import 'package:app_exam/screens/home.dart';
import 'package:flutter/material.dart';

Future main() {
  final PostRepository postRepository = PostRepository(
    postDataProvider: PostDataProvider(httpClient: http.Client())
  );
  runApp(MyApp(postRepository: postRepository));
}

class MyApp extends StatelessWidget {
  PostRepository postRepository;

  MyApp({@required this.postRepository}) : assert(postRepository != null);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => this.postRepository,
      child: BlocProvider(
        create: (context) => PostBloc(postRepository: this.postRepository),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Exam App',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: Home(),
        )
      )
    );
  }
}