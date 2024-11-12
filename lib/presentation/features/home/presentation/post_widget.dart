import 'package:flutter/material.dart';

import 'package:linkedin_bloc_clone/data/models/post.dart';
import 'package:linkedin_bloc_clone/presentation/features/home/bloc/home_bloc.dart';

class PostWidget extends StatelessWidget {
  final Post postModel;
  final HomeBloc homeBloc;
  PostWidget({
    Key? key,
    required this.postModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      child: SizedBox(
        height: 256,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 64,
                      child: CircleAvatar(
                        child: Image(
                            image: NetworkImage(
                                'https://media.licdn.com/dms/image/v2/C4E03AQHJnmkUjWVrOw/profile-displayphoto-shrink_100_100/profile-displayphoto-shrink_100_100/0/1517034467855?e=1736380800&v=beta&t=hwUoJxKDtkKCO51X7Q5q0j_1_GmuaPV3vmpE8p2coIw')),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          postModel.username,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          postModel.headline,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 96,
                      child: TextButton(
                          onPressed: () {}, child: const Text('Follow')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Text(
                  postModel.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    postModel.description,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
              const Divider(
                height: 0.2,
              ),
              SizedBox(
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LIKE
                    Expanded(
                        child: IconButton(
                            style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {
                              if (postModel.liked) {
                                homeBloc.add(
                                    PostDisLikedEvent(dislikedPost: postModel));
                              } else {
                                homeBloc
                                    .add(PostLikedEvent(likedPost: postModel));
                              }
                            },
                            icon: Icon(Icons.thumb_up_alt_outlined,
                                color: postModel.liked
                                    ? Colors.blue
                                    : Colors.black))),

                    //COMMENT
                    Expanded(
                        child: IconButton(
                            style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            icon: const Icon(Icons.comment_outlined))),

                    // REPOST
                    Expanded(
                        child: IconButton(
                            style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            icon: const Icon(Icons.sync_sharp))),

                    // SEND
                    Expanded(
                        child: Transform.rotate(
                      angle: 225.5,
                      child: IconButton(
                          style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory),
                          onPressed: () {},
                          icon: const Icon(Icons.send_outlined)),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
