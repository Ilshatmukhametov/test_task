import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:test_json/detail_page.dart';
import 'UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
Future<Welcome> getJsonData() async{

  const String URL = 'https://www.reddit.com/r/flutterdev/new.json';
  final Uri url = Uri.parse(URL);
  Response response = await get(url);
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Welcome.fromJson(data);
  }else {
    return Welcome.fromJson(data);
  }
}

Future refreshJson() async {
  setState(() {});
  return getJsonData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: refreshJson,
              child: ListView.builder(
                  itemCount: snapshot.data?.data.children.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (_) =>
                        DetailPage(
                          title: snapshot.data!.data.children[index].data.title,
                          selftext: snapshot.data!.data.children[index].data.selftext,
                          ups: snapshot.data!.data.children[index].data.ups.toString(),)));
                      },
                      child: Container(
                          margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 102, 87, 161),),
                        child: Column(
                          children: [
                            Text((index + 1).toString(), style: TextStyle(color: Colors.white, fontSize: 15)),
                            Text(snapshot.data!.data.children[index].data.title, style: TextStyle(color: Colors.white, fontSize: 20),),
                            if (snapshot.data!.data.children[index].data.thumbnail.length > 7)
                              Image.network(snapshot.data!.data.children[index].data.thumbnail),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        },
        future: getJsonData(),
        ),
      );
}
}
