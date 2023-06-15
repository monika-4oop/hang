import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/custom_drawer.dart';

class StartHomePage extends StatefulWidget {
  const StartHomePage({super.key});

  @override
  State<StartHomePage> createState() => _StartHomePage();
}

class _StartHomePage extends State<StartHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  final List<Map> myProducts =
      List.generate(11, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "420",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();

          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      drawer: customDrawer(context: context),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xffCCF4F1),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      hintText: 'What would you like ?',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: const Color(0xff00C8B8).withOpacity(0.8),
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
                  icon: const Icon(
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
                  SizedBox(
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
                                  fontSize: 26),
                            ),
                            TextSpan(
                              text: 'Delivery, where available.\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 26),
                            ),
                            TextSpan(
                              text: 'HIGHLY CALCULATED CANNABIS\n DELIVERY',
                              style: TextStyle(
                                color: Color(0xFF00C8B8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF00C8B8),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Shop Now",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: _screenHeight * 0.45,
            // color: Colors.red,
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured Products",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        surfaceTintColor: const Color(0Xff00C8B8),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "See all >",
                        style: TextStyle(
                          color: Color(0Xff00C8B8),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/budding-GbXiiO6OrJs-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                              // width: 180,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/budding-GbXiiO6OrJs-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                              // width: 180,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _screenHeight * 0.45,
            // color: Colors.red,
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Deals",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        surfaceTintColor: const Color(0Xff00C8B8),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "See all >",
                        style: TextStyle(
                          color: Color(0Xff00C8B8),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 46),
                              decoration: const BoxDecoration(
                                color: Color(0xFF00C8B8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(360),
                                  topRight: Radius.circular(360),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    "assets/img/avery-meeker-muuZhItgQoE-unsplash-removebg-preview 1.png",
                                    fit: BoxFit.fill,
                                    width: 180,
                                    height: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '25% ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                        TextSpan(
                                          text: 'off\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: 'Lorem Ispum Dolor\n',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\$ 152',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 46),
                              decoration: const BoxDecoration(
                                color: Color(0xFF00C8B8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(360),
                                  topRight: Radius.circular(360),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                                    fit: BoxFit.fill,
                                    width: 180,
                                    height: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '15% ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                        TextSpan(
                                          text: 'off\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: 'Lorem Ispum Dolor\n',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\$ 152',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 46),
                              decoration: const BoxDecoration(
                                color: Color(0xFF00C8B8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(360),
                                  topRight: Radius.circular(360),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    "assets/img/avery-meeker-muuZhItgQoE-unsplash-removebg-preview 1.png",
                                    fit: BoxFit.fill,
                                    width: 180,
                                    height: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '25% ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                        TextSpan(
                                          text: 'off\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: 'Lorem Ispum Dolor\n',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\$ 152',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _screenHeight * 0.2,
            margin: const EdgeInsets.all(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/img/Mask group.png",
                  fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            height: 0.8
                            
                          ),
                          children: [
                            TextSpan(
                              text: 'Cannabis\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 38),
                            ),
                            TextSpan(
                              text: 'Vapes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 36),
                            ),
                            
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF00C8B8),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Shop Now",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _screenHeight * 0.45,
            // color: Colors.red,
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Concentrates",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        surfaceTintColor: const Color(0Xff00C8B8),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "See all >",
                        style: TextStyle(
                          color: Color(0Xff00C8B8),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/budding-GbXiiO6OrJs-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                              // width: 180,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 200,
                        width: 220,
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0XFFF9F9F9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.05),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/img/budding-GbXiiO6OrJs-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                              // width: 180,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              width: 150,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Lorem ispum dopnipe fhg",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "\$ 152",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "\$ 160",
                                  style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "27% THC",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Humboldt Farms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 20,
                                    backgroundColor: const Color(0xFF00C8B8),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         
          Container(
            height: _screenHeight * 0.3,
          ),
        ],
      ),
    );
  }
}
