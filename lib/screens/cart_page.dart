import 'package:coffee_ui/utils/CartStyle.dart';
import 'package:coffee_ui/utils/customSizedBox.dart';
import 'package:coffee_ui/utils/customTextStyle.dart';
import 'package:coffee_ui/widgets/coffeetypeImage.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/constants/strings.dart';

import '../constants/doubles.dart';
import '../utils/size_provider.dart';

class Cart extends StatefulWidget {
  final String image; //for calling the images as required while tapping the particular coffee item
  final String title;
  const Cart({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void incrementCounter() {
    setState(() {
      Nums.count++;
    });
  }

  void decrementCounter() {
    setState(() {
      Nums.count--;
    });
  }

  void priceIncrementer() {
    setState(() {
      if (Strings.coffeeSize == 'Small') {
        Nums.small = Nums.small + 35;
      } else if (Strings.coffeeSize == 'Medium') {
        Nums.medium = Nums.medium + 70;
      } else {
        Nums.large = Nums.large + 115;
      }
    });
  }

  void priceDecrementer() {
    setState(() {
      if (Nums.count >= 1) {
        if (Strings.coffeeSize == 'Small') {
          Nums.small = Nums.small - 35;
        } else if (Strings.coffeeSize == 'Medium') {
          Nums.medium = Nums.medium - 70;
        } else {
          Nums.large = Nums.large - 115;
        }
      } else {
        Nums.count = 0;
        Nums.small = 0;
        Nums.medium = 0;
        Nums.large = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar( 
        // to make the appbar invisible
        backgroundColor: Colors.transparent,
        elevation: 0, 
        centerTitle: true,  //center the title
        title: CustomTextStyle(
            data: widget.title,  //call the required title (the one on which the user taps)
            fonTSize: SizeProvider.heightProvider(context, 0.03),
            fontWeight: FontWeight.bold,
            color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);  //go back to the previous page
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height,
        // to set the background image
        decoration: BoxDecoration(  
          image: DecorationImage(
              image: const AssetImage("Images/background.webp"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: SizeProvider.heightProvider(context, 0.1)),
          child: Column(
            children: [
              CoffeeTypeImage(
                  image: widget.image, //call the image of that coffeetype which the user taps 
                  height: SizeProvider.heightProvider(context, 0.2)),
              CustomSizedBox(
                  width: SizeProvider.widthProvider(context, 0.04),
                  height: SizeProvider.heightProvider(context, 0.06)),
              Container(
                height: SizeProvider.heightProvider(context, 0.6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //to add the shadow effect in the inner side of the container, we nmake another small container and give it the shadow from the outer side
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: SizeProvider.heightProvider(context, 0.005),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              spreadRadius: 3,
                              color: Colors.grey[400]!,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                SizeProvider.heightProvider(context, 0.03),
                            horizontal:
                                SizeProvider.heightProvider(context, 0.03)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomTextStyle(
                                    data: widget.title,
                                    fonTSize: SizeProvider.heightProvider(
                                        context, 0.03)),
                                CartStyle(
                                  data: '₹${Nums.small}',
                                  fonTSize: SizeProvider.heightProvider(
                                      context, 0.06),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => {
                                    decrementCounter(),
                                    priceDecrementer(),
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: Center(
                                        child: CustomTextStyle(
                                            data: '-',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fonTSize:
                                                SizeProvider.heightProvider(
                                                    context, 0.025))),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                      child: CustomTextStyle(
                                          data: '${Nums.count}',
                                          fonTSize: SizeProvider.heightProvider(
                                              context, 0.025))),
                                ),
                                InkWell(
                                  onTap: () => {
                                    incrementCounter(),
                                    priceIncrementer(),
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight:
                                                  Radius.circular(12))),
                                      child: Center(
                                          child: CustomTextStyle(
                                              data: '+',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fonTSize:
                                                  SizeProvider.heightProvider(
                                                      context, 0.025)))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     
                      Padding(
                        padding: EdgeInsets.symmetric(
                        horizontal:
                          SizeProvider.heightProvider(context, 0.03)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextStyle(
                              data: Strings.size,
                              fonTSize:
                                  SizeProvider.heightProvider(context, 0.03)),
                        ),
                      ),
                      CustomSizedBox(
                          width: SizeProvider.widthProvider(context, 0.02),
                          height: SizeProvider.heightProvider(context, 0.03)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                SizeProvider.heightProvider(context, 0.03)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: CoffeeTypeImage(
                                      image: Images.selectedCoffeeImg,
                                      height: SizeProvider.heightProvider(
                                          context, 0.060)),
                                ),
                                Container(
                                  height: SizeProvider.heightProvider(
                                        context, 0.02) ,
                                  width: SizeProvider.heightProvider(
                                        context, 0.03),
                                 decoration:const BoxDecoration(
                                border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                              ],
                            ),
                            CustomSizedBox(
                                width:
                                    SizeProvider.widthProvider(context, 0.02),
                                height:
                                    SizeProvider.heightProvider(context, 0.03)),
                            InkWell(
                              onTap: () {},
                              child: CoffeeTypeImage(
                                  image: Images.coffeeSizeImg,
                                  height: SizeProvider.heightProvider(
                                      context, 0.070)),
                            ),
                            CustomSizedBox(
                                width:
                                    SizeProvider.widthProvider(context, 0.02),
                                height:
                                    SizeProvider.heightProvider(context, 0.03)),
                            InkWell(
                              onTap:(){},
                              child: CoffeeTypeImage(
                                  image: Images.coffeeSizeImg,
                                  height: SizeProvider.heightProvider(
                                      context, 0.080)),
                            ),
                          ],
                        ),
                      ),
                      CustomSizedBox(
                          width: SizeProvider.widthProvider(context, 0.02),
                          height: SizeProvider.heightProvider(context, 0.03)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                SizeProvider.heightProvider(context, 0.03)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextStyle(
                              data: Strings.sugar,
                              fonTSize:
                                  SizeProvider.heightProvider(context, 0.03)),
                        ),
                      ),
                      CustomSizedBox(
                          width: SizeProvider.widthProvider(context, 0.02),
                          height: SizeProvider.heightProvider(context, 0.03)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                SizeProvider.heightProvider(context, 0.03)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                CoffeeTypeImage(
                                    image: Images.selectedSugarImg,
                                    height: SizeProvider.heightProvider(
                                        context, 0.050)),
                                 Container(
                                  height: SizeProvider.heightProvider(
                                        context, 0.03) ,
                                  width: SizeProvider.heightProvider(
                                        context, 0.03),
                                 decoration:const BoxDecoration(
                                border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                              ],
                            ),
                            CustomSizedBox(
                                width:
                                    SizeProvider.widthProvider(context, 0.02),
                                height:
                                    SizeProvider.heightProvider(context, 0.03)),
                            CoffeeTypeImage(
                                image: Images.twoCubes,
                                height: SizeProvider.heightProvider(
                                    context, 0.040)),
                            CustomSizedBox(
                                width:
                                    SizeProvider.widthProvider(context, 0.02),
                                height:
                                    SizeProvider.heightProvider(context, 0.03)),
                            CoffeeTypeImage(
                                image: Images.threeCubes,
                                height: SizeProvider.heightProvider(
                                    context, 0.030)),
                            CustomSizedBox(
                                width:
                                    SizeProvider.widthProvider(context, 0.02),
                                height:
                                    SizeProvider.heightProvider(context, 0.03)),
                            CoffeeTypeImage(
                                image: Images.zeroCube,
                                height: SizeProvider.heightProvider(
                                    context, 0.050)),
                          ],
                        ),
                      ),
                      CustomSizedBox(
                          width: SizeProvider.widthProvider(context, 0.02),
                          height: SizeProvider.heightProvider(context, 0.03)),
                      SizedBox(
                        width: SizeProvider.widthProvider(context, 0.25),
                        height: SizeProvider.heightProvider(context, 0.1),
                        child: ElevatedButton(
                          onPressed: () {}, //increase count on cart badge
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              padding: EdgeInsets.all(
                                  SizeProvider.heightProvider(context, 0.008))),
                          child: CustomTextStyle(
                              data: 'Add to Cart',
                              fonTSize:
                                  SizeProvider.widthProvider(context, 0.02),
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
