class Post {
  const Post({
    this.title
  });

  final String title;
}

final List<Post> posts = [
  Post(
    title: 'List View',
  ),
  Post(
    title: 'Grid View',
  ),
  Post(
    title: 'Column',
  ),
  Post(
    title: 'Row',
  )
];