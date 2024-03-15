import 'package:flutter/material.dart';
import '../pagesList/movieInfo.dart';
class topRatedMovies extends StatelessWidget {
  final List topRated;
  const topRatedMovies ({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,/*start with  left corner*/
        children: [
          Text("Top Rated Movies",style: TextStyle(color: Colors.white,fontSize: 26),),          SizedBox(height: 8,),
          Container(height: 256,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, /* horizontaly moving*/
                itemCount: topRated.length,
                itemBuilder: (context, index){
                  /*to  linking to another page*/
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>movieInfo(
                        movieName: topRated[index]['title'],
                        info: topRated[index]['overview'],
                        bannerURL:  'http://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                        posterURL:  'http://image.tmdb.org/t/p/w500' + topRated[index]['poster_path'],
                        likes: topRated[index]['vote_count'].toString(),
                        date: topRated[index]['release_date'],
                      )));
                    },
                    child: Container(
                      height: 300,
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
                            height:160,
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+topRated[index]['poster_path']
                                ),
                                fit: BoxFit.cover

                            )),
                          ),SizedBox(height: 10,),
                          Container(child: 
                          Text(topRated[index]['title']
                              !=null? topRated[index]['title']: 'Please Wait',style: TextStyle(color: Colors.white, fontSize: 15,),),
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
