import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.lounch_date})
      : super(key: key);
  final String name;
  final String description;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String lounch_date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Ctext(
          text: 'Description',
          size: 30,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white38,
                              offset: Offset(10, 10),
                              blurRadius: 50)
                        ],
                        image: DecorationImage(
                            image: NetworkImage(posterUrl), fit: BoxFit.cover)),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Ctext(
                        text: '⭐ Average Rating ' + '$vote',
                        size: 15,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Ctext(
              text: name,
              size: 25,
              weight: FontWeight.bold,
            ),const SizedBox(
              height: 10,
            ),
            Ctext(
              text: 'Released-on - '+lounch_date,
              size: 18,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white38,
                            offset: Offset(10, 10),
                            blurRadius: 50)
                      ],
                      image: DecorationImage(
                          image: NetworkImage(bannerUrl), fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ctext(

                      text: description,
                      overflow: TextOverflow.fade,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
