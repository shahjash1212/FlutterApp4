import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: LeadingText(),
        actions: [
          ActionTag(),
        ],
      ),
      body: Column(
        children: [
          OrdersWidget(),
          Container(
            height: 160,
            padding: EdgeInsets.only(top: 20),
            // color: Colors.red,
            child: Container(
              width: 340,
              // color: Colors.pink,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$400.00",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Shipping",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$15.90",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Bag Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$415.90",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 300,
            margin: EdgeInsets.all(8),
            child: const Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
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

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: const Text(
              "Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 450,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 10),
                        child: Container(
                          height: 115,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: ExactAssetImage("assets/11.png"),
                                fit: BoxFit.contain),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-2, 5),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.yellow,
                          ),
                        ),
                      ),
                      Container(
                        height: 115,
                        width: 230,
                        // color: Colors.pink,
                        padding: EdgeInsets.only(top: 0, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Jordan Sports",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "Size:40",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w100),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$130.00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100),
                                ),
                                Container(
                                  height: 20,
                                  margin: EdgeInsets.only(right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.indeterminate_check_box,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.add_box,
                                        color: Colors.blue,
                                        size: 25,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ActionTag extends StatelessWidget {
  const ActionTag({
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
            Icons.shopping_bag,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class LeadingText extends StatelessWidget {
  const LeadingText({
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
