import 'package:flutter/material.dart';
import 'package:movie_recommender_application/Pages/Description/description.dart';
import 'package:movie_recommender_application/Utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trendingMovies});
  final List trendingMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "Treding Movies",
          size: 25.0,
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingMovies.length,
            itemBuilder: (context, index) {
              return trendingMovies[index]["title"] != null
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionDisplayer(
                                name: trendingMovies[index]["title"],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trendingMovies[index]["backdrop_path"],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trendingMovies[index]["poster_path"],
                                description: trendingMovies[index]["overview"],
                                ratings: trendingMovies[index]["vote_average"],
                                relesedate: trendingMovies[index]
                                    ["release_date"],
                              ),
                            ));
                      },
                      child: Container(
                        width: 140,
                        child: Column(children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trendingMovies[index]["poster_path"]),
                              ),
                            ),
                          ),
                          Container(
                            child: modified_text(
                                text: trendingMovies[index]["title"] != null
                                    ? trendingMovies[index]["title"]
                                    : "Loading.."),
                          )
                        ]),
                      ),
                    )
                  : Container();
            },
          ),
        )
      ]),
    );
  }
}
