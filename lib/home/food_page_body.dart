import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/widgets/big_text.dart';
import '/widgets/small_text.dart';
import '/widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.redAccent,
      height:320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        }
      ),
    );
  }
  Widget _buildPageItem(int index){
    return Stack(
      children: [
        Container
    (
       height: 220,
       margin: EdgeInsets.only(left:10, right:10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: index.isEven?Color(0xff69c5df):Color(0xFF9294cc),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          "assets/image/unsplash.jpg"
        )
        //NetworkImage('https://images.unsplash.com/photo-1655312214809-553e851782ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8eGpQUjRobGtCR0F8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60')
      )
      ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: EdgeInsets.only(left:30, right:30, bottom: 30),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          ),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: "Chinese Side"),
            SizedBox(height: 10),
            Row(
              children: [
                Wrap(
                  children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,))
                ),
                SizedBox(width: 10),
                SmallText(text: "4.5"),
                SizedBox(width: 10),
                SmallText(text: "1297"),
                SizedBox(width: 10),
                SmallText(text: "comments"),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                IconAndTextWidget(icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1,),

                IconAndTextWidget(icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor,),

                IconAndTextWidget(icon: Icons.access_time_rounded,
                text: "30min",
                iconColor: AppColors.iconColor2,),
              ]
            )
          ]
        ),
      ),  
         ),

        
      
      )
      ],
      );
  }
}