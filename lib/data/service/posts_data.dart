import '../models/post.dart';

class PostsData{

  static List<Post> posts = [
    Post(
      id: 1,
      username: 'Dhillu Nayudu',
      headline: 'Flutter Developer',
      title: 'Exploring Flutter Web : Unleashing Cross-Platform Development',
      description: 'Are you a Flutter enthusiast eager to take your app beyond mobile devices? Look no further! In this post, let\'s delve into Flutter Web and discover how you can leverage this powerful technology to build cross-platform apps that run on the web. Let\'s explore the limitless possibilities of Flutter Web.',
      image: 'https://example.com/image1.jpg',
      link: 'https://example.com/link1',
      published: 'Yesterday, 10:00 AM',
      liked: false
    ),
    Post(
      id: 2,
      username: 'Dhillu Nayudu',
      headline: 'Flutter Developer',
      title: 'Why Explore Flutter Web?',
      description: 'Flutter Web enables developers to extend their Flutter expertise to the web, allowing them to build high-performance, native-like web apps with a single codebase. It opens up new opportunities for reaching users on desktops and browsers.',
      image: 'https://example.com/image2.jpg',
      link: 'https://example.com/link2',
      published: 'Yesterday, 2:00 PM',
      liked: false
    ),
    Post(
      id: 3,
      username: 'Dhillu Nayudu',
      headline: 'Flutter Developer',
      title: 'Getting Started with Flutter Web',
      description: 'Set Up Your Environment \n Adapt Your UI \n Browser Compatibility \n Leverage Web-Specific APIs \n Deploy Your App',
      image: 'https://example.com/image3.jpg',
      link: 'https://example.com/link3',
      published: 'Today, 8:00 AM',
      liked: false
    ),
  ];

}