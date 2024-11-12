import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_bloc_clone/presentation/features/chat/list/presentation/chat_list_page.dart';
import 'package:linkedin_bloc_clone/presentation/features/chat/new/presentation/new_chat_page.dart';
import 'package:linkedin_bloc_clone/presentation/features/home/bloc/home_bloc.dart';
import 'package:linkedin_bloc_clone/presentation/features/home/presentation/post_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // Init the state and load posts
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToChatListState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatListPage()));
        } else if (state is HomeNavigateToNewChatState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewChatPage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffe9e5df),
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    child: Image(
                        image: NetworkImage(
                            'https://media.licdn.com/dms/image/v2/C4E03AQHJnmkUjWVrOw/profile-displayphoto-shrink_100_100/profile-displayphoto-shrink_100_100/0/1517034467855?e=1736380800&v=beta&t=hwUoJxKDtkKCO51X7Q5q0j_1_GmuaPV3vmpE8p2coIw')),
                  ),
                  const SizedBox(
                    width: 8,
                  ),

                  // SEARCH BOX
                  Expanded(
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  // NEW CHAT ICON
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNewChatButtonNavigateEvent());
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey[700],
                      )),
                  // CHAT LIST ICON
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeChatListButtonNavigateEvent());
                      },
                      icon: Icon(
                        Icons.message_rounded,
                        color: Colors.grey[700],
                      )),
                ],
              )),
          body: buildBody(state),
        );
      },
    );
  }

  Widget buildBody(HomeState state) {
    switch (state.runtimeType) {
      case HomeInitState:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case HomePostsLoadedState:
        final postsState = state as HomePostsLoadedState;
        return ListView.builder(
            itemCount: postsState.posts.length,
            itemBuilder: (context, index) {
              return PostWidget(
                postModel: postsState.posts[index],
                homeBloc: homeBloc,
              );
            });
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
