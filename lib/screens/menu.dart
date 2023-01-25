import 'package:coffee_ui/constants/doubles.dart';
import 'package:coffee_ui/constants/strings.dart';
import 'package:coffee_ui/screens/cart_page.dart';
import 'package:coffee_ui/screens/drawer.dart';
import 'package:coffee_ui/utils/customTextStyle.dart';
import 'package:coffee_ui/utils/size_provider.dart';
import 'package:coffee_ui/widgets/coffeeListTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, //each widget has its own key made with itself
        resizeToAvoidBottomInset: false, //to avoid overflow
        backgroundColor: const Color(0xFFF9F3EE),
        drawer: const MyDrawer(), //drawer is added inside the scaffold itself.
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(SizeProvider.widthProvider(context, 0.03)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      //used to make the image/icon tappable
                      onTap: () {
                        _scaffoldKey.currentState
                            ?.openDrawer(); //to open the drawer while tapping the image, we use the key made
                      },
                      child: Image.asset("Images/splash_icon.png",
                          height: 30, width: 30),
                    ),
                    Image.asset("Images/search.png", height: 30, width: 30),
                  ],
                ),
              ),
              const SizedBox(height: 30, width: 30),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        SizeProvider.widthProvider(context, 0.03)),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "It's Great ",
                              style: GoogleFonts.nunito(fontSize: 30),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Day for ${MediaQuery.of(context).size.width > 700 ? "" : "\n"}Coffee.",
                                  style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20, width: 20),
              Column(
                children: [
                  CoffeeListTile(
                    image: Images.espressoImg,
                    title: Strings.espresso,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.espressoImg,
                                  title: Strings.espresso,
                                )),
                      );
                    },
                  ),
                  CoffeeListTile(
                    image: Images.cappucinoImg,
                    title: Strings.cappucino,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.cappucinoImg,
                                  title: Strings.cappucino,
                                )),
                      );
                    },
                  ),
                  CoffeeListTile(
                    image: Images.latteImg,
                    title: Strings.latte,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.latteImg,
                                  title: Strings.latte,
                                )),
                      );
                    },
                  ),
                  CoffeeListTile(
                    image: Images.mochaImg,
                    title: Strings.mocha,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.mochaImg,
                                  title: Strings.mocha,
                                )),
                      );
                    },
                  ),
                  CoffeeListTile(
                    image: Images.macchiatoImg,
                    title: Strings.macchiato,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.macchiatoImg,
                                  title: Strings.macchiato,
                                )),
                      );
                    },
                  ),
                  CoffeeListTile(
                    image: Images.latteMacchiatoImg,
                    title: Strings.latteMacchiato,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cart(
                                  image: Images.latteMacchiatoImg,
                                  title: Strings.latteMacchiato,
                                )),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            //navigation bar with rounded corner
            decoration: const BoxDecoration(
              //create a box decoration
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 0),
              ],
            ),
            child: ClipRRect(
              //cretates a rounded rectangular clip
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.brown), label: ''),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.location_pin, color: Colors.brown),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Stack(
                        clipBehavior:
                            Clip.none, //to stop the badge from clipping
                        children: [
                          const Icon(Icons.coffee,
                              color: Colors
                                  .brown), //add the icon you want to display
                          Positioned(
                            //position the icon according to your need

                            top: -5,
                            right: 0,
                            child: Container(
                              //use the container as child to display the batch
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                    6), //to make the container circular
                              ),
                              constraints: const BoxConstraints(
                                //to make the container circular
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: Align(
                                  //to align the text in badge in center
                                  alignment: Alignment.center,
                                  child: CustomTextStyle(
                                      data: '${Nums.count}',
                                      fonTSize: 8.0,
                                      color: Colors.white)),
                            ),
                          ),
                        ]),
                    label: ''),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.brown), label: ''),
              ]),
            ))); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
