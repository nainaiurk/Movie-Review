// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviesReview extends StatelessWidget {
  const MoviesReview({ Key? key,
    required this.moviesName, 
    required this.moviesPoster, 
    required this.genre, 
    required this.release, 
    required this.runTime, 
    required this.director, 
    required this.cast, 
    required this.imdb,
    required this.rating,
    required this.review
  }) : super(key: key);

  final String moviesName ;
  final String moviesPoster;
  final String genre;
  final String release;
  final String runTime;
  final String director;
  final String cast;
  final String imdb;
  final int rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Review'
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.movie_creation_outlined))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: maxHeight*0.3,
              width: maxWidth,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 10.0 / 13.0,
                    child: Image.network(
                      moviesPoster,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: maxWidth*0.03,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          moviesName,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children:[
                            const Text(
                              'Release Date : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                release,
                                maxLines: 2,
                                style:const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:[
                            const Text(
                              'Genre : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                genre,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cast : ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                cast,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:[
                            const Text(
                              'Director : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                director,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'IMDB : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              imdb,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: maxWidth,
              color: Colors.white12,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.facebookSquare),
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.instagram,),
                    color: Colors.pink,
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.blue[300],
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const FaIcon(FontAwesomeIcons.shareNodes),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text(
                  'Critics Rating : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: rating,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 14,),
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                child: Text(
                  review,
                  style: const TextStyle(
                    color:Colors.white
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}