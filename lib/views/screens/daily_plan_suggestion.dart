import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/views/screens/recipe_detail_page.dart';
import 'package:project/views/utils/AppColor.dart';
import '../../models/core/recipe.dart';
import '../../models/helper/recipe_helper.dart';

class DailyPlanSuggestion extends StatelessWidget {
  final Recipe breakfast;
  final Recipe lunch;
  final Recipe dinner;
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  int randomRate1 = 0;
  int randomRate2 = 0;
  int randomRate3 = 0;

  DailyPlanSuggestion(
      {super.key,
      required this.breakfast,
      required this.lunch,
      required this.dinner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AnimatedContainer(
          color: AppColor.primary,
          duration: Duration(milliseconds: 200),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Today Suggestion",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'inter'),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: AppColor.whiteSoft,
                  )),
            ],
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: 118,
          ),
          SizedBox(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              children: [
                itemList(context, "Breakfast", featuredRecipe[1]),
                itemList(context, "Lunch", featuredRecipe[2]),
                itemList(context, "Dinner", featuredRecipe[3]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget itemList(context, type, Recipe recipe) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: recipe),
          ));
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage(recipe.photo),
              opacity: 0.5,
              fit: BoxFit.cover)),
      child: ClipRRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$type :",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 150 / 100,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    Text(
                      recipe.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 150 / 100,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    // Recipe Calories and Time
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/fire-filled.svg',
                            color: Colors.white,
                            width: 12,
                            height: 12,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              recipe.calories,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.alarm, size: 14, color: Colors.white),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              recipe.time,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 12),
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 28,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    )
                  ],
                ),
              ))),
    ),
  );
}
