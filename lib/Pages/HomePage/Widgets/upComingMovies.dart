import 'package:flutter/material.dart';
import 'package:movie_recommender_application/Utils/text.dart';

import '../../Description/description.dart';

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({super.key, required this.upComingMovies});
  final List upComingMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: "Upcoming Movies",
          size: 25.0,
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          height: 205,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: upComingMovies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionDisplayer(
                        name: upComingMovies[index]["title"],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' +
                            upComingMovies[index]["backdrop_path"],
                        posterurl: 'https://image.tmdb.org/t/p/w500' +
                            upComingMovies[index]["poster_path"],
                        description: upComingMovies[index]["overview"],
                        ratings: upComingMovies[index]["vote_average"],
                        relesedate: upComingMovies[index]["release_date"],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  width: 250,
                  child: Column(children: [
                    Container(
                      height: 140,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    upComingMovies[index]["backdrop_path"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: modified_text(
                          text: upComingMovies[index]["title"] != null
                              ? upComingMovies[index]["title"]
                              : "Loading.."),
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
