import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/provider/theme_provider.dart';
import 'package:e_commerce/screens/Drawer/home_drawer.dart';
import 'package:e_commerce/screens/Home/Widgets/image_slider.dart';
import 'package:e_commerce/screens/Home/Widgets/product_cart.dart';
import 'package:e_commerce/screens/Home/Widgets/search_bar.dart';
import 'package:e_commerce/screens/constans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  int currentSlide = 0;
  int selcetedIndex = 0;
  @override
  Widget build(BuildContext context) {
    print('HomeScreen build method called'); // Add this line

    List<List<Product>> selectedCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Welcome to"),
            Text(
              "Snap Shop",
              style: TextStyle(color: kprimaryColor),
            ),
          ],
        ),
        leading: IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
          icon: Image.asset(
            "images/icon.png",
            height: 30,
            width: 25,
            color: kprimaryColor,
          ),
        ),
        actions: [
          // Adding a Switch to the AppBar
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(themeProvider.isDarkMode
                    ? Icons.nights_stay
                    : Icons.wb_sunny,
                    color: kprimaryColor,),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for custom appBar

              const SizedBox(
                height: 20,
              ),
              //for searchBar
              const MySearchBar(),

              const SizedBox(
                height: 20,
              ),
              ImageSlider(
                  onChange: (value) {
                    setState(
                      () {
                        currentSlide = value;
                      },
                    );
                  },
                  currenSlide: currentSlide),
              const SizedBox(
                height: 20,
              ),
              //for product selection
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: categoriesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selcetedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selcetedIndex ==
                                  index // here we selected the index.
                              ? Colors.orange[200]
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    categoriesList[index].image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              categoriesList[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special for You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              //for Shopping items ...
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: selectedCategories[selcetedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                      product: selectedCategories[selcetedIndex][index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
