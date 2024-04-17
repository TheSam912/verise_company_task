import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/views/utils/AppColor.dart';

import '../../models/core/recipe.dart';
import '../../models/helper/recipe_helper.dart';
import '../screens/daily_plan_suggestion.dart';

Widget DailyPlanWidget(context) {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return DailyPlanSuggestion(
          breakfast: featuredRecipe[1],
          lunch: featuredRecipe[2],
          dinner: featuredRecipe[3],
        );
      }));
    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/images/featured1.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5)),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.26),
              ),
              child: Text(
                "Today Suggestion Daily\nPlan With AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'inter'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
