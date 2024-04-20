import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> productDetails = [
    {
      "name": "Apple AirPods Max",
      "price": 60000,
      "img": "assets/akhil-yerabati-Q2uV5TkjNz8-unsplash.jpg",
    },
    {
      "name": "Apple AirPods Max 2",
      "price": 60000,
      "img": "assets/ervo-rocks-Zam8TvEgN5o-unsplash.jpg",
    },
    {
      "name": "Apple AirPods",
      "price": 24900,
      "img": "assets/insung-yoon-mru38VH7tII-unsplash.jpg",
    },
    {
      "name": "Apple iPhone 15",
      "price": 79900,
      "img": "assets/paolo-giubilato-ZwKCWVFdrcs-unsplash.jpg",
    },
    {
      "name": "Apple Watch Hermes",
      "price": 104101,
      "img": "assets/bestami-sarikaya-HyHtwQMstSA-unsplash.jpg",
    },
    {
      "name": "Apple AirPods Max",
      "price": 60000,
      "img": "assets/akhil-yerabati-Q2uV5TkjNz8-unsplash.jpg",
    },
    {
      "name": "Apple AirPods Max 2",
      "price": 60000,
      "img": "assets/ervo-rocks-Zam8TvEgN5o-unsplash.jpg",
    },
    {
      "name": "Apple AirPods",
      "price": 24900,
      "img": "assets/insung-yoon-mru38VH7tII-unsplash.jpg",
    },
    {
      "name": "Apple iPhone 15",
      "price": 79900,
      "img": "assets/paolo-giubilato-ZwKCWVFdrcs-unsplash.jpg",
    },
    {
      "name": "Apple Watch Hermes",
      "price": 104101,
      "img": "assets/bestami-sarikaya-HyHtwQMstSA-unsplash.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "SKEPIT",
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FluentIcons.list_16_filled,
              size: 24,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FluentIcons.filter_12_filled,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productDetails.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: ((index % 5 + 1) * 100) - 56 < 200
                      ? ((index % 5 + 1) * 100) + (200 + index.toDouble())
                      : ((index % 5 + 1) * 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            productDetail: productDetails[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.46),
                          child: Image.asset(
                            productDetails[index]["img"],
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.46,
                            height: ((index % 5 + 1) * 100) - 66 < 200
                                ? ((index % 5 + 1) * 100) -
                                    66 +
                                    (200 + index.toDouble())
                                : ((index % 5 + 1) * 100) - 66,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          productDetails[index]["name"],
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "₹ ${productDetails[index]["price"]}",
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.blue.shade900.withOpacity(0.075),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.black12,
                fixedSize: const Size(56, 56),
              ),
              icon: const Icon(
                FluentIcons.list_28_filled,
                size: 24,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                // backgroundColor: Colors.black12,
                fixedSize: const Size(56, 56),
              ),
              icon: const Icon(
                FluentIcons.heart_28_regular,
                size: 24,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                // backgroundColor: Colors.black12,
                fixedSize: const Size(56, 56),
              ),
              icon: const Icon(
                FluentIcons.person_28_regular,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> productDetail;
  const ProductDetailsPage({
    super.key,
    required this.productDetail,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _isWishlisted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                child: Image.asset(
                  widget.productDetail['img'],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          FluentIcons.arrow_step_back_16_filled,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isWishlisted = !_isWishlisted;
                          });
                        },
                        icon: Icon(
                          _isWishlisted
                              ? FluentIcons.heart_28_filled
                              : FluentIcons.heart_28_regular,
                          size: 24,
                          color: _isWishlisted ? Colors.pink : Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FluentIcons.arrow_upload_24_regular,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.425,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 7.5,
                            sigmaY: 7.5,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.925,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.productDetail['name'],
                                  style: GoogleFonts.manrope(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eleifend, nulla eu tincidunt luctus, ligula lectus varius lacus, ut vestibulum arcu velit ac magna. Aliquam dictum lacus et lorem varius.",
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Tags(name: "Premium"),
                                      Tags(name: "Handmade"),
                                      Tags(name: "Premium Sound Quality"),
                                      Tags(name: "Boosted Base"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 7.5,
                            sigmaY: 7.5,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FluentIcons.star_28_filled,
                                  color: Colors.amberAccent.shade700,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "4.9",
                                  style: GoogleFonts.manrope(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "(108)",
                                  style: GoogleFonts.manrope(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 7.5,
                            sigmaY: 7.5,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: const Icon(
                              FluentIcons.cart_24_regular,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.height * 0.025,
          left: MediaQuery.of(context).size.height * 0.025,
          bottom: MediaQuery.of(context).size.height * 0.025,
        ),
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.075),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.075),
            ),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "₹ ${widget.productDetail['price']}",
              style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: " | BUY NOW",
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final String name;
  const Tags({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name,
        style: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
