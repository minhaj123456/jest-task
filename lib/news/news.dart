import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class koo extends StatefulWidget {
  @override
  State<koo> createState() => _kooState();
}

class _kooState extends State<koo> {
  List<dynamic> _articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final String apiKey = 'e7fb7eef00bb4ab5884da6ee2fc19708'; 
    final String apiUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _articles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE2Eu6pl32L1UL-2NBnHlZFUA8ESXfceGLIQ&usqp=CAU'), // Replace 'assets/background_image.jpg' with your image path
              fit: BoxFit.cover, 
            ),
          ),
          child:_articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                final article = _articles[index];
                return ListTile(
                  title: Text(article['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  subtitle: Text(article['description'] ?? 'No description'),
                  trailing: Text(article['publishedAt']),
                );
              },
            ),
        ),
      ),
    );
  }
}
