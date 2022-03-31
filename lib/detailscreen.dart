import 'package:flutter/material.dart';
import 'models/shoesinfo.dart';
import 'addtocart.dart';

class DetailScreen extends StatelessWidget {
  final Shoes shoeData;
  DetailScreen({Key? key, required this.shoeData}) : super(key: key);

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
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    shoeData.imageUrl,
                    fit: BoxFit.fitWidth,
                  ))),
          const NikeLogo(),
          Text(
            shoeData.productname,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          const Text(
            "\$120.00",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const BottomRow(),
          const Size(),
          const SizeBottom(),
          const BelowButton(),
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
          context, MaterialPageRoute(builder: (context) => const AddToCart())),
      child: Container(
        height: 60,
        width: 300,
        margin: const EdgeInsets.all(8),
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
      padding: const EdgeInsets.only(left: 8, right: 8),
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
                color: const Color(0xfff4f8fb),
              ),
              child: Center(
                  child: Text(
                (index + 36).toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
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
            borderRadius: BorderRadius.circular(15), color: Color(0xfff4f8fb)),
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
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff4f8fb)),
          child: const BackButton(color: Colors.black)),
    );
  }
}
