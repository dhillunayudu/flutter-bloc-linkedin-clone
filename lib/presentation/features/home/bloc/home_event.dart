part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class PostLikedEvent extends HomeEvent {
  final Post likedPost;
  PostLikedEvent({
    required this.likedPost,
  });
}

class PostDisLikedEvent extends HomeEvent {
  final Post dislikedPost;
  PostDisLikedEvent({
    required this.dislikedPost,
  });
}

class PostShareEvent extends HomeEvent{}

class HomeChatListButtonNavigateEvent extends HomeEvent{}

class HomeNewChatButtonNavigateEvent extends HomeEvent{}