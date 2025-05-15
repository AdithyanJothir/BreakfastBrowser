import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/diet.dart';



class MyHomePage extends StatefulWidget {
  
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void getInitialInfo(){
    categories = CategoryModel.getCategories();
    diets  = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          searchField(),
          SizedBox(height: 40,),
          textWidget(),
          SizedBox(height: 15 ,),
          categoriesSection(),
          SizedBox(height: 40,),
          reccomendationSection()
        ],
      )
    ); 
  }

  Column reccomendationSection() {
    return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Reccomended Diets",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 240,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 210,
                        decoration: BoxDecoration(
                          color: diets[index].boxColor.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(diets[index].iconPath),
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              diets[index].level + " | " + diets[index].duration + " | " + diets[index].calories,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xff7B6F72)
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 150,
                              child: Center(
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: diets[index].viewIsSelected ? Colors.white : Color(0xffC58BF2),
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: 
                                  [
                                  diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                                  diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.transparent
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      );
                    }, 
                    separatorBuilder: (context, index) => SizedBox(width: 25,), 
                    itemCount: diets.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20, right: 20),

                    ),
                )
              ],
            )
          ],
        );
  }


  Container categoriesSection() {
    return Container(
          height: 120,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: categories.length  ,
            itemBuilder: (context, index){
            return Container( 
              width: 100 ,
              decoration: BoxDecoration(
                color: categories[index].boxColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container( 
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
            );
          }),
        );
  }

  Column textWidget() {
    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
      )

    ]);

  }

  Column searchField() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
              color: Color(0xff1D1617).withValues(alpha: 0.21),
              blurRadius: 40,
              spreadRadius: 0.0
            )
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search Pancakes",
              hintStyle: TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: IntrinsicHeight(
               child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10 ,
                    color: Color(0xffDDDADA),
                    thickness: 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
              ),
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white, // Setting a light background for AppBar
      elevation: 0, // Remove shadow
      title: Text(
        "BreakFast",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      ),
    centerTitle: true,
    leading: Container(   
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/icons/leftarrow.svg',
        height: 20,
        width: 20,
      ),
    ),
    actions: [
      Container(   
      margin: EdgeInsets.all(10),
      width: 37,
      decoration: BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/icons/dots.svg',
        height: 5,
        width: 5,
      ),
    ),
    ],
    );
  }
}  