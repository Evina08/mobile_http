import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_http/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  HttpService service;
  @override
  void initState() {
    service = HttpService();
    super.initState();
  }

  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) => {
          setState(() {
            result = value;
          })
        });
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
    return Container();
  }
}
