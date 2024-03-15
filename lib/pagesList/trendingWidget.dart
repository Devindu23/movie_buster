import 'package:flutter/material.dart';
import '../pagesList/movieInfo.dart';


class trendingMovies extends StatelessWidget {
  final List trending;
  const trendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,/*start with  left corner*/
        children: [
          Text("Trending Now",style: TextStyle(color: Colors.white, fontSize: 26),),
          SizedBox(height: 8,),
          Container(height: 256,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, /* horizontaly moving*/
                itemCount: trending.length,
                itemBuilder: (context, index){
              /*to  linking to another page*/
              return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>movieInfo(
                            movieName: trending[index]['title'],
                            info: trending[index]['overview'],
                            bannerURL:  'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                            posterURL:  'http://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                            likes: trending[index]['vote_count'].toString(),
                            date: trending[index]['release_date'],
                          )));
                    },
                child: Container(
                  height: 250,
                  margin: EdgeInsets.all(5),
                  width:127,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)
                  ),
                      child: Column(
                        children: [
                          Container(
                            width:250,
                            height: 160,
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(25),
                                image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                                ),
                              fit: BoxFit.cover
                            )),
                          ),SizedBox(height: 10,),
                          Container(child: 
                          Text(trending[index]['title']
                              !=null? trending[index]['title']: "Please Wait",),
                             )
                        ],
                      ),
                    ),


                  );
                }),)
        ],
      ),
    );
  }
}
