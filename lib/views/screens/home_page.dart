import 'package:flutter/material.dart';
import '../../models/core/recipe.dart';
import '../../models/helper/recipe_helper.dart';
import '../../views/screens/delicious_today_page.dart';
import '../../views/screens/newly_posted_page.dart';
import '../../views/screens/profile_page.dart';
import '../../views/screens/search_page.dart';
import '../../views/utils/AppColor.dart';
import '../../views/widgets/custom_app_bar.dart';
import '../../views/widgets/dummy_search_bar.dart';
import '../../views/widgets/featured_recipe_card.dart';
import '../../views/widgets/recipe_tile.dart';
import '../../views/widgets/recommendation_recipe_card.dart';
import '../widgets/daily_plan_widget.dart';

class HomePage extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('VeRise',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'inter',
                fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
        profilePhoto: AssetImage('assets/images/pp.png'),
        profilePhotoOnPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 295,
                  color: AppColor.primary,
                ),
                // Section 1 - Content
                Column(
                  children: [
                    // Search Bar
                    DummySearchBar(
                      routeTo: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchPage()));
                      },
                    ),
                    // daily full meal recommendation
                    DailyPlanWidget(context),
                    // Delicious Today - Header
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vegan Delicious Today',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'inter'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DeliciousTodayPage()));
                            },
                            child: Text('see all'),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                    // Delicious Today - ListView
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      height: 220,
                      child: ListView.separated(
                        itemCount: featuredRecipe.length,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          return FeaturedRecipeCard(
                              data: featuredRecipe[index]);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Section 2 - Recommendation Recipe
          recommendationRecipeWidget(
              newlyPostedRecipe, 'Breakfast recommendation just for you...'),
          //container for show and calculate daily calories
          dailyCalories(),
          //container for show and calculate daily calories
          recommendationRecipeWidget(
              featuredRecipe, 'Lunch recommendation just for you...'),
          recommendationRecipeWidget(
              recommendationRecipe, 'Dinner recommendation just for you...'),
          // Section 3 - Newly Posted
          Container(
            margin: EdgeInsets.only(top: 14, bottom: 12),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Newly Posted',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewlyPostedPage()));
                      },
                      child: Text('see all'),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                    ),
                  ],
                ),
                // Content
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      data: newlyPostedRecipe[index],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget recommendationRecipeWidget(recommendationRecipe, title) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.primary),
          ),
        ),
        // Content
        Container(
          height: 174,
          child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: recommendationRecipe.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            itemBuilder: (context, index) {
              return RecommendationRecipeCard(
                  data: recommendationRecipe[index]);
            },
          ),
        )
      ],
    ),
  );
}

Widget dailyCalories() {
  return Container(
    height: 150,
    padding: EdgeInsets.symmetric(vertical: 12),
    margin: EdgeInsets.only(left: 14, right: 14, top: 12),
    decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/bg1.jpeg',
            ),
            fit: BoxFit.cover,
            opacity: 0.3),
        gradient: LinearGradient(
            colors: [AppColor.primary, Colors.grey.shade700],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Today you gained:",
          style: TextStyle(
              color: AppColor.whiteSoft,
              fontSize: 18,
              fontFamily: 'inter',
              fontWeight: FontWeight.w600),
        ),
        Text(
          "450 Calories",
          style: TextStyle(
              color: AppColor.whiteSoft,
              fontWeight: FontWeight.w600,
              fontFamily: 'inter',
              fontSize: 28),
        ),
      ],
    ),
  );
}
