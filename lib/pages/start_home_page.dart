import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class StartHomePage extends StatefulWidget {
  const StartHomePage({super.key});

  @override
  State<StartHomePage> createState() => _StartHomePage();
}

class _StartHomePage extends State<StartHomePage> {
  final List<Map> myProducts =
      List.generate(11, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "420",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffCCF4F1),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                      hintText: 'What would you like ?',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: Color(0xff00C8B8).withOpacity(0.8),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_active_outlined,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 115.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Container(
                    width: 100.0,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xff00C8B8),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Image(
                              image: AssetImage("assets/img/catPic.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          myProducts[index]["name"],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 39, 8, 8),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: 225,
            margin: const EdgeInsets.all(12),
            child: CarouselSlider.builder(
              unlimitedMode: true,
              slideIndicator: CircularSlideIndicator(
                  padding: const EdgeInsets.only(bottom: 22),
                  currentIndicatorColor: Colors.white,
                  indicatorBackgroundColor: Colors.grey),
              itemCount: 4,
              slideBuilder: (index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/img/bannerMain.png"),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Nationwide Cannabis \n',
                               style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 32),
                            ),
                            TextSpan(text: 'Delivery, where available.\n',
                             style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 32),),
                            TextSpan(
                              text: 'HIGHLY CALCULATED CANNABIS DELIVERY',
                              style: TextStyle(
                                  color: Color(0xFF00C8B8),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _indicator(bool isActive) {
  return Container(
    height: 10,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 10 : 8.0,
      width: isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        boxShadow: [
          isActive
              ? BoxShadow(
                  color: Color(0XFF2FB7B2).withOpacity(0.72),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              : BoxShadow(
                  color: Colors.transparent,
                )
        ],
        shape: BoxShape.circle,
        color: isActive ? Color(0XFF6BC4C9) : Color(0XFFEAEAEA),
      ),
    ),
  );
}
