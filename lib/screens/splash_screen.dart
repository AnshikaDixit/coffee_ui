import 'package:flutter/material.dart';

import 'menu.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {  //to navigate to the menu page
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    //async because we need to use file over here
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(  //push replacement has we need to mobe to another page
      context, 
      MaterialPageRoute(
        builder: (context)=> const MyHomePage(
          title: 'Menu',
    )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Container(
      constraints:
          const BoxConstraints.expand(), //to set the image in fullscreen
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("Images/background.webp"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop)),
      ),
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Images/espresso.png"),
                ),
              ),
        ),
      ),
    ));
  }
}
