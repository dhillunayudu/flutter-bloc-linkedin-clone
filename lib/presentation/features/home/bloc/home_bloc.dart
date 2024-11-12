import 'package:bloc/bloc.dart';
import 'package:linkedin_bloc_clone/data/service/posts_data.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<HomeInitialEvent>((event, emit) async {
      emit(HomePostsLoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(HomePostsLoadedState(posts: PostsData.posts));
    });

    on<HomeChatListButtonNavigateEvent>((event, emit) {
      emit(HomeNavigateToChatListState());
    });

    on<HomeNewChatButtonNavigateEvent>((event, emit) {
      emit(HomeNavigateToNewChatState());
    });

    on<PostLikedEvent>((event, emit) {
      var all_posts = PostsData.posts;
      all_posts.firstWhere((p)=> p.id == event.likedPost.id).liked = true;
      emit(HomePostsLoadedState(posts: all_posts));
    },);

    on<PostDisLikedEvent>((event, emit) {
      var all_posts = PostsData.posts;
      all_posts.firstWhere((p)=> p.id == event.dislikedPost.id).liked = false;
      emit(HomePostsLoadedState(posts: all_posts));
    },);
  }
}
