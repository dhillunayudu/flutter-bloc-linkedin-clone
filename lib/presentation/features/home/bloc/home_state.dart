part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

// SIMPLE STATE - BUILD UI
// ACTION STATE

class HomeInitState extends HomeState{}

class HomePostsLoadingState extends HomeState{}

class HomePostsLoadedState extends HomeState {
  final List<Post> posts;
  HomePostsLoadedState({
    required this.posts,
  });

}

class HomeErrorLoadingPostsState extends HomeState{}

class HomeErrorRetryLoadPostsState extends HomeActionState{}

class HomeNavigateToChatListState extends HomeActionState{}

class HomeNavigateToNewChatState extends HomeActionState{}

