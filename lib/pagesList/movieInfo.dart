import 'package:flutter/material.dart';
// import '../UtilitiesList/textModify.dart';
/*import 'package:movie_bee/pagesList/castPage.dart';*/


class movieInfo extends StatelessWidget {
  final String movieName;
  final String info;
  final String bannerURL;
  final String posterURL;
  final String likes;
  final String date;

  const movieInfo({
    Key? key,
    required this.movieName,
    required this.info,
    required this.bannerURL,
    required this.posterURL,
    required this.likes,
    required this.date,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 40,
                  child: 
                  Text(
                    "🤍" + likes,style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                  
                ),
                Positioned(
                  bottom: 10,
                  child: 
                  Text(movieName != null ? movieName : "Please Wait",style: TextStyle(color: Colors.white,fontSize: 20),),
               
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: 
            Text("Relaeased On -" + date,style: TextStyle(color: Colors.lightGreen,fontSize: 15),),
           
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 140,
                child: Image.network(posterURL),
              ),
              Flexible(
                child: Container(
                  child: 
                  Text(info,style: TextStyle(color: Colors.white,fontSize: 15),)
    
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Center(
            child: ElevatedButton(
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>CastPage())); // navigate to home page
              },
              child: Text(
                'cast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}

//Movie Detail class for searched items
class movieInfo1 extends StatelessWidget {
  final dynamic movie;

  const movieInfo1({required this.movie});

  @override
  Widget build(BuildContext context) {
    final dynamic movieName = '${movie['title']}';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w185${movie['backdrop_path']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 40,
                    child: Text(
                      '🤍 ${movie['vote_count']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      movieName != null ? movieName : 'Please Wait',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Relaeased On - Release Date: ${movie['release_date']}',
                style: const TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 140,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185${movie['poster_path']}',
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Overview: ${movie['overview']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
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