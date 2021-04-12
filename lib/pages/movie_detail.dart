import 'package:flutter/material.dart';
import 'package:flutter_http/models/movie.dart';
import 'package:flutter_http/pages/rating_bar.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previewsfleb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                child: Text(movie.title,
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Row(
                children: <Widget>[
                  Text("Rating: " + movie.voteAverage.toString(),
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                  RatingBar(rating: movie.voteAverage, color: Colors.yellow),
                ],
              ),
              Container(
                child: Text(movie.overview,
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
