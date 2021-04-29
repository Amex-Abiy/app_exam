import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetPosts extends PostEvent {
  GetPosts();

  @override
  // TODO: implement props
  List<Object> get props => [];
}