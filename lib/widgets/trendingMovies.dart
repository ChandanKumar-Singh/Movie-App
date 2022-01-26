import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import 'description.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Ctext(
            text: 'Trending Movies',
            size: 25,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Description(
                          description: trending[index]['overview'],
                          name: trending[index]['title'],
                          bannerUrl: 'http://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterUrl: 'http://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          vote: '${trending[index]['vote_average']}',
                          lounch_date: '${trending[index]['release_date']}',
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 140,
                      width: 140,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.white38,
                                      offset: Offset(10, 10),
                                      blurRadius: 50)
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                            ),
                          ),
                          Ctext(
                            text: trending[index]['title'] ?? 'Loading',
                            size: 20,
                            color: Colors.white,overflow: TextOverflow.ellipsis
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
