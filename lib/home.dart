import 'package:flutter/material.dart';
import 'package:jezt/movie/movies.dart';
import 'package:jezt/news/news.dart';
import 'package:jezt/weather/ui.dart';
import 'package:jezt/weather/weather.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 202, 218, 145),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 200, 236, 145),
          title: Center(child: Text("Jezt",style: TextStyle(color: Colors.red,fontSize: 28,wordSpacing: 1,fontWeight: FontWeight.bold),)),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            unselectedLabelColor: Color.fromARGB(255, 48, 4, 225),
            labelStyle: TextStyle(fontSize: 16, color: Colors.orange),
            

            dividerColor: Color.fromARGB(255, 246, 244, 244),

            mouseCursor: MaterialStateMouseCursor.clickable,
            

            splashBorderRadius: BorderRadius.all(
              Radius.circular(20),
            ),


            tabs: [
              Tab(
                text: 'Weather',
              ),
              Tab(text: 'News'),
              Tab(text: 'Movies'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            hai(),
           koo(),
           koi()
           ],
        ),
      ),
    ));
  }
}
