class Filme {
  String title;
  String poster_path;
  String vote_average;
  String overview;

  Filme(this.title,this.vote_average,this.poster_path,this.overview);

  Filme.fromJson(Map<String, dynamic> json)  :
        title = json["title"],
        poster_path = json["poster_path"],
        vote_average = json["vote_average"].toString(),
        overview = json["overview"];

  @override
  String toString() {
    return title;
  }
}