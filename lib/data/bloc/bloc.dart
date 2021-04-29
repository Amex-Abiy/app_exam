import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_exam/data/bloc/post_event.dart';
import 'package:app_exam/data/bloc/post_state.dart';
import 'package:app_exam/data/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
    PostRepository postRepository;

   PostBloc({@required this.postRepository}) : assert(postRepository != null), super(PostLoading());

   Stream<PostState> mapEventToState(PostEvent event) async* {
     if(event is GetPosts) {
       try {
        final posts = await this.postRepository.getPosts();
        yield PostLoadSuccess(posts);
       } catch (error) {
         yield PostLoadError(error);
       }
     }
   }
}