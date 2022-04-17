// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_review/screens/moviesReview.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {

  @override
  void initState() {
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        leading:
          Hero(
            tag: 'logo',
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 5,
              color: Colors.transparent,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      body: Container(
        height: maxHeight,
        width: maxWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black54,
              // Colors.black38,
              // Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          
          )
        ),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisExtent: 230,
            ),
            itemCount: _items.length,
            itemBuilder: (context,i) {
              String moviesName = _items[i]["Movie Name"];
              String moviesPoster = _items[i]["Poster"];
              String genre = _items[i]["Genre"];
              String release = _items[i]["Release Date"];
              String runTime = _items[i]["RunTime"];
              String director = _items[i]["Director"];
              String cast = _items[i]["Cast"];
              String imdb = _items[i]["IMDB"].toString();
              var rating = _items[i]["Rate"];
              String review = _items[i]["Review"];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesReview(
                        moviesName :moviesName,
                        moviesPoster:moviesPoster,
                        genre:genre,
                        release:release,
                        runTime:runTime,
                        director:director,
                        cast: cast,
                        imdb:imdb,
                        rating:rating,
                        review:review,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        color: Colors.transparent,
                        height: maxHeight*0.21,
                        width: maxWidth*0.3,
                        child: Image.network(
                          moviesPoster,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              moviesName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              genre,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const Text(
                                      'RELEASE DATE:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      release,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(158, 158, 158, 1),
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5,),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'RUNTIME:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        runTime,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/movieList.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }
}
