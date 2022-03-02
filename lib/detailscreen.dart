import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'addtocart.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: const TopLeft(),
        actions: const [TopRight()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ImageShow(),
          NikeLogo(),
          Text(
            "Nike Air Max 87",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 10),
          Text(
            "\$120.00",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          BottomRow(),
          Size(),
          SizeBottom(),
          BelowButton(),
        ],
      ),
    );
  }
}

class ImageShow extends StatelessWidget {
  const ImageShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: ImageSlideshow(
        width: double.infinity,
        height: 350,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 10000,
        isLoop: true,
        children: [
          Image.asset(
            'assets/10.png',
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            'assets/8.png',
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            'assets/9.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}

class BelowButton extends StatelessWidget {
  const BelowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddToCart())),
      child: Container(
        height: 60,
        width: 300,
        margin: EdgeInsets.all(8),
        child: const Center(
          child: Text(
            "Add To Cart",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.blue),
      ),
    );
  }
}

class SizeBottom extends StatelessWidget {
  const SizeBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15, bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Discription",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          Icon(Icons.keyboard_arrow_up),
        ],
      ),
    );
  }
}

class Size extends StatelessWidget {
  const Size({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                (index + 36).toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
            ),
          );
        },
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          Text("Size Guide",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}

class NikeLogo extends StatelessWidget {
  const NikeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(
              "assets/nikelogo.png",
            ),
            fit: BoxFit.fitWidth),
      ),
    );
  }
}

class TopRight extends StatelessWidget {
  const TopRight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class TopLeft extends StatelessWidget {
  const TopLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
          child: BackButton(color: Colors.black)),
    );
  }
}
