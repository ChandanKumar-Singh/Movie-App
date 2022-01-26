import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import 'description.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key, required this.topRated}) : super(key: key);
  final List topRated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ctext(
            text: 'Top Rated Movies',
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
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Description(
                          description: topRated[index]['overview'],
                          name: topRated[index]['title'],
                          bannerUrl: 'http://image.tmdb.org/t/p/w500' +
                              topRated[index]['backdrop_path'],
                          posterUrl: 'http://image.tmdb.org/t/p/w500' +
                              topRated[index]['poster_path'],
                          vote: '${topRated[index]['vote_average']}',
                          lounch_date: '${topRated[index]['release_date']}',
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 140,
                      width: 140,
                      child: Column(
                        children: [
                          Container(
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
                                        topRated[index]['poster_path']),
                              ),
                            ),
                          ),
                          Ctext(
                              text: topRated[index]['title'] ?? 'Loading',
                              size: 20,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
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
