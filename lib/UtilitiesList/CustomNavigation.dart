import 'package:flutter/material.dart';
import '../main.dart';
import '../pagesList/categoryPage.dart';
import '../pagesList/searchPage.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home())); // navigate to home page
            },
            child: const Icon(Icons.home_outlined,color: Colors.yellow,size: 50,),
          ),
          /*InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/"); // navigate to same page
            },
            child: const Icon(Icons.home_outlined,color: Colors.yellow,size: 50,),
          ),*/
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const categoryPage())); // navigate to home page
            },
            child: const Icon(Icons.category_outlined,color: Colors.yellow,size: 50,),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>searchPage()));
            },
            child: const Icon(Icons.search_rounded,color: Colors.yellow,size: 50,),
          ),

        ],
      ),
    );
  }
}
