import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/data.dart';
import 'package:recipe/modal/recipe.dart';
import 'package:recipe/screens/detail.dart';
import 'package:search_page/search_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: Scaffold(

        bottomNavigationBar: FancyBottomNavigation(

          tabs: [
            TabData(iconData: Icons.home, title: "Home",),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {},
        ),

      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: recipes[index].title,
                      imgUrl: recipes[index].imageUrl,
                      ingredients: recipes[index].ingredients,
                      steps: recipes[index].steps,
                      duration: recipes[index].duration,
                    ),),);
              },
              child: Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                elevation: 4.0,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        recipes[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(-15),
                            topLeft: Radius.circular(-15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Colors.green,
                          ),
                        child: Text(
                          recipes[index].title,
                          style: const TextStyle(
                            fontSize: 20,

                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                       right: 145,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(-15),
                                  topLeft: Radius.circular(-15),
                                bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                              ),
                              color: Colors.green),
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              '${recipes[index].duration} min',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    ),
    );
  }
}