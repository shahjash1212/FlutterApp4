import 'package:flutter/material.dart';

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
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(""))),
          ),
          Container(
            height: 80,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                    "assets/nikelogo.png",
                  ),
                  fit: BoxFit.fitWidth),
            ),
          ),
          const Text(
            "Nike Air Max 87",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          const Text(
            "\$120.00",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: Center(child: Text((index + 36).toString())),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          ),
          Container(
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
        ],
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
