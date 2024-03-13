// import 'package:flutter/material.dart';



// class koi extends StatelessWidget {
//     final List<Movie> movies = [
//       Movie(
//       title: 'Manjummel Boys',
//       description:
//           'A group of friends get into a daring rescue mission to save their friend from Guna Caves, a perilously deep pit from where nobody has ever been brought back..',
//       rating: '9.8',
//       releaseDate: '2024',
//     ),
//     Movie(
//       title: 'Inception',
//       description:
//           'A thief who enters the dreams of others to steal their secrets from their subconscious.',
//       rating: '8.8',
//       releaseDate: '2010',
//     ),
//     Movie(
//       title: 'The Shawshank Redemption',
//       description:
//           'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
//       rating: '9.3',
//       releaseDate: '1994',
//     ),
//       Movie(
//       title: 'Ustad Hotel',
//       description:
//           'Faisi wants to go to UK to become a professional chef but circumstances force him to assist his grandfather in a small restaurant in Kozhikode city,',
//       rating: '9.3',
//       releaseDate: '2012',
//     ),
//       Movie(
//       title: 'Kumbalangi Nights',
//       description:
//           'The film revolves around four brothers who share a love-hate relationship with each other. Frankys elder brothers, Saji, Bobby and Bony lead a messed up life',
//       rating: '9.3',
//       releaseDate: '2019',
//     ),
//       Movie(
//       title: 'Oppenheimer',
//       description:
//           'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb',
//       rating: '9.3',
//       releaseDate: '2023',
//     ),
//       Movie(
//       title: 'The Shawshank Redemption',
//       description:
//           'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
//       rating: '9.3',
//       releaseDate: '1994',
//     ),
   
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
        
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8rfnXInJqmv0G2JRxET8X9xeMdPoSrO7-Qg&usqp=CAU'), // Replace 'assets/background_image.jpg' with your image path
//               fit: BoxFit.cover, // You can adjust the fit as per your requirements
//             ),
//           ),
//           child: ListView.builder(
        
        
//         itemCount: movies.length,
//         itemBuilder: (context, index) {
//           return MovieTile(movie: movies[index]);
          
//         },
//       ),
//         ),
//       ),
//     );
//   }
// }

// class Movie {
//   final String title;
//   final String description;
//   final String rating;
//   final String releaseDate;

//   Movie({required this.title, required this.description, required this.rating, required this.releaseDate});
// }

// class MovieTile extends StatelessWidget {
//   final Movie movie;

//   MovieTile({required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       color: const Color.fromARGB(255, 247, 177, 86),
//       child: ExpansionTile(
//         title: Text(movie.title,style: TextStyle(fontWeight: FontWeight.bold),),
//         children: [
//           ListTile(
//             title: Text('Description:'),
//             subtitle: Text(movie.description),
//           ),
//           ListTile(
//             title: Text('Rating:'),
//             subtitle: Text(movie.rating),
//           ),
//           ListTile(
//             title: Text('Release Date:'),
//             subtitle: Text(movie.releaseDate),
//           ),
//         ],
//       ),
//     );
//   }
// }
