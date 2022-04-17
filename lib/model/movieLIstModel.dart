
import 'dart:convert';

List<MoviesModel> MoviesModelFromJson(String str) => List<MoviesModel>.from(json.decode(str).map((x) => MoviesModel.fromJson(x)));

class MoviesModel {
    MoviesModel({
        required this.movieName,
        required this.poster,
        required this.genre,
        required this.releaseDate,
        required this.runTime,
        required this.director,
        required this.cast,
        required this.imdb,
        required this.rate,
        required this.review,
    });

    String movieName;
    String poster;
    String genre;
    String releaseDate;
    String runTime;
    String director;
    String cast;
    double imdb;
    int rate;
    String review;

    factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        movieName: json["Movie Name"],
        poster: json["Poster"],
        genre: json["Genre"],
        releaseDate: json["Release Date"],
        runTime: json["RunTime"],
        director: json["Director"],
        cast: json["Cast"],
        imdb: json["IMDB"].toDouble(),
        rate: json["Rate"],
        review: json["Review"],
    );
}
