import 'package:flutter/material.dart';
import 'package:flutter_http/service/http_service.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Popular Movies"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: GridView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          padding: const EdgeInsets.all(20),
          // itemBuilder: (context, int position) {
          //   return Card(
          //     color: Colors.white,
          //     elevation: 2.0,
          //     child: ListTile(
          //       leading: Image.network(imgPath + movies[position].posterPath),
          //       title: Text(movies[position].title),
          //       subtitle: Text(
          //         'Rating = ' + movies[position].voteAverage.toString(),
          //       ),
          //       onTap: () {
          //         MaterialPageRoute route = MaterialPageRoute(
          //             builder: (_) => MovieDetail(movies[position]));
          //         Navigator.push(context, route);
          //       },
          //     ),
          //   );
          // }, ),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, int position) {
            return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  imgPath + movies[position].posterPath,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}
