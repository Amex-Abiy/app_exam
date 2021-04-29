import 'package:app_exam/data/model/post.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostLoadSuccess extends PostState {
  final List<Post> posts;
  
  PostLoadSuccess(this.posts);

 @override
  List<Object> get props => [posts];
}

class PostLoadError extends PostState {
  final Error error;

  PostLoadError(this.error);
}