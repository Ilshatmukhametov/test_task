import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String selftext;
  final String ups;
  DetailPage({Key? key, required this.title, required this.selftext, required this.ups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.anton(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                    selftext,
                    style: GoogleFonts.robotoCondensed(textStyle: TextStyle( fontSize: 16, fontWeight: FontWeight.w400))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.whatshot),
                        Text(
                          ups,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),)
        ],
      )
      );
  }
}

