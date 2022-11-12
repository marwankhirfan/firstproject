import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstproject/Screens/cat_Screen.dart';
import 'package:firstproject/catlist.dart';
import 'package:flutter/material.dart';

import 'package:firstproject/models.dart';

import '../widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<clist> _list2 = [
    clist(
        1,
        "Hekaiah Outlet",
        const NetworkImage(
            "data:image/jpeg;base64,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"),
        Icons.arrow_forward),
    clist(
        2,
        "Aone Outlet",
        const NetworkImage(
            "data:image/jpeg;base64,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"),
        Icons.arrow_forward),
    clist(
        3,
        "Hekaiah Outlet",
        const NetworkImage(
            "data:image/jpeg;base64,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"),
        Icons.arrow_forward),
    clist(
        4,
        "Aone Outlet",
        const NetworkImage(
            "data:image/jpeg;base64,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"),
        Icons.arrow_forward)
  ];
  final List<Model> _list = [
    Model("All", 1, false),
    Model("Clothes", 2, false),
    Model("Food", 3, false),
    Model("Car", 4, false),
    Model("Chess", 5, false),
    Model("Pet", 6, false),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            CustomTheme.loginGradientStart,
            CustomTheme.loginGradientEnd,
          ]

          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: 210,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://png.pngtree.com/png-clipart/20220911/original/pngtree-70-off-sale-tag-banner-template-png-image_8562597.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://png.pngtree.com/png-clipart/20190520/original/pngtree-discount-70--off-vector-template-design-illustration-png-image_4005029.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://png.pngtree.com/png-clipart/20190603/original/pngtree-discount50%25discounts-png-image_591482.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://couponcodes4u.com/wp-content/uploads/2022/03/AMAN2-5.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("  Categories", style: TextStyle(fontSize: 25)),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => categoryScreen(),));
                    },
                    child: const Text(
                      "See All  ",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(7, 0, 3, 0),
                      width: 90,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: Text(_list[index].name),
                      ),
                    );
                  },
                  itemCount: _list.length,
                  scrollDirection: Axis.horizontal),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            _list[0].name,
                            style: const TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Collections",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.purple,
                          ))
                    ],
                  ),
                )),
            SingleChildScrollView(
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
                      height: 73,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    //or 15.0
                                    child: SizedBox(
                                      height: 70.0,
                                      width: 70.0,
                                      child: Image.asset(
                                          'assets/logo-g68499e4eb_1280.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_list2[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      const Text(
                                        'ALL items-others up to 70%',
                                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Icon(_list2[index].icon)
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: _list2.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
