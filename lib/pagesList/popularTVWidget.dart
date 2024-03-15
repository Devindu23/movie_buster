import 'package:flutter/material.dart';
import '../pagesList/movieInfo.dart';
class popularTvShows extends StatelessWidget {
  final List popularTvShow;
  const popularTvShows({Key? key, required this.popularTvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,/*start with  left corner*/
        children: [
          const Text("Popular TV Shows",style: TextStyle(color: Colors.white,fontSize: 26),),
          const SizedBox(height: 8,),
          SizedBox(height: 256,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, /* horizontaly moving*/
                itemCount: popularTvShow.length,
                itemBuilder: (context, index){
                  /*to  linking to another page*/
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>movieInfo(
                        movieName: popularTvShow[index]['name'],
                        info: popularTvShow[index]['overview'],
                        bannerURL:  'http://image.tmdb.org/t/p/w500'+popularTvShow[index]['backdrop_path'],
                        posterURL:  'http://image.tmdb.org/t/p/w500' + popularTvShow[index]['poster_path'],
                        likes: popularTvShow[index]['vote_count'].toString(),
                        date: popularTvShow[index]['first_air_date'],
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
                            height: 160,
                            /*borderRadius:BorderRadius.circular(10),*/
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500'+popularTvShow[index]['poster_path'],
                                    ),
                                    fit: BoxFit.cover
                                )),
                          ),SizedBox(height: 10,),
                          Container(child: 
                          Text(popularTvShow[index]['name']
                 
                              !=null? popularTvShow[index]['name']: "Please Wait"),                     
                          ) 
                        ]
                      ),
                    ),


                  );
                }),)
        ],
      ),
    );
  }
}
