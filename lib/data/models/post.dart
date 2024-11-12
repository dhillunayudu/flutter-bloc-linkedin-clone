class Post {
  int id;
  String username;
  String headline;
  String title;
  String description;
  String image;
  String link;
  String published;
  bool liked;

  Post({
    required this.id,
    required this.username,
    required this.headline,
    required this.title,
    required this.description,
    required this.image,
    required this.link,
    required this.published,
    required this.liked,
  });
}
