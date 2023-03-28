import 'package:flutter/material.dart';
import 'package:movie_recommender_application/Utils/text.dart';

class DescriptionDisplayer extends StatelessWidget {
  final name, description, posterurl, bannerurl, relesedate;
  final ratings;
  const DescriptionDisplayer(
      {super.key,
      this.name,
      this.description,
      this.posterurl,
      this.bannerurl,
      this.ratings,
      this.relesedate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 25,
                    left: 10,
                    child: modified_text(
                      text: "Average Rating ⭐ " + ratings.toString(),
                      color: Colors.blueAccent,
                    ))
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: modified_text(
                text: name != null ? name : "Loading..",
                size: 15.0,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: modified_text(
                text: relesedate != null
                    ? "Released On: " + relesedate
                    : " Releasing soon",
                size: 15.0,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(2),
                  height: 200,
                  width: 160,
                  child: Image.network(
                    posterurl,
                  ),
                ),
                Flexible(child: modified_text(text: description))
              ],
            )
          ],
        ),
      ),
    );
  }
}
