import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:320,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        }
      ),
    );
  }
  Widget _buildPageItem(int index){
    return Container(
       width: 220,
       margin: EdgeInsets.only(left:5, right:5),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: index.isEven?Color(0xff69c5df):Color(0xFF9294cc),
      image: DecorationImage(
        image: 
        //AssetImage(
        //  "assets/image/burger.png"
        //)
        NetworkImage('https://images.unsplash.com/photo-1655312214809-553e851782ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60')
      )
      ),
      );
  }
}