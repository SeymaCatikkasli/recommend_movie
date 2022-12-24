enum ShortMovieCategry {
  action,
  comedy,
  romance,
  fantasy,
}

class ActorModel {
  final String name;
  final String imageUrl;

  ActorModel({required this.name, required this.imageUrl});
}

class ShortMovieModel {
  final String name;
  final String desc;
  final String duration;
  final String coverUrl;
  final bool y18plus;
  final double rate;
  final ShortMovieCategry shortmovieCategry;
  final List<ActorModel> actors;

  ShortMovieModel( {
    required this.name,
    required this.desc,
    required this.duration,
    required this.coverUrl,
    required this.actors,
    required this.rate,
    required this.y18plus,
    required this.shortmovieCategry,
  });
}