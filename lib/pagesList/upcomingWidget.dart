import 'package:flutter/material.dart';
import '../pagesList/movieInfo.dart';
class upcomingMovies extends StatelessWidget {
  final List Upcoming;
  const upcomingMovies ({Key? key, required this.Upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,/*start with  left corner*/
        children: [
          Text('Upcoming movies',style: TextStyle(color:  Colors.white, fontSize: 26),) ,
          SizedBox(height: 8,),
          Container(height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, /* horizontaly moving*/
                itemCount: Upcoming.length,
                itemBuilder: (context, index){
                  /*to  linking to another page*/
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>movieInfo(
                        movieName: Upcoming[index]['title'],
                        info: Upcoming[index]['overview'],
                        bannerURL:  'http://image.tmdb.org/t/p/w500'+Upcoming[index]['backdrop_path'],
                        posterURL:  'http://image.tmdb.org/t/p/w500' + Upcoming[index]['poster_path'],
                        likes: Upcoming[index]['vote_count'].toString(),
                        date: Upcoming[index]['release_date'],
                      )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width:300,
                      child: Column(
                        children: [
                          Container(
                            width:290,
                            height:160,
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w500'+Upcoming[index]['poster_path']
                                    ),
                                    fit: BoxFit.cover

                                )),
                          ),SizedBox(height: 10,),
                          Container(child:
                          Text(Upcoming[index]['title']
                              !=null? Upcoming[index]['title']: "Please Wait",),
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
